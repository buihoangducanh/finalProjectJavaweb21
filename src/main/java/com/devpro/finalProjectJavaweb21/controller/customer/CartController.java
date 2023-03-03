package com.devpro.finalProjectJavaweb21.controller.customer;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.finalProjectJavaweb21.controller.BaseController;
import com.devpro.finalProjectJavaweb21.dto.Cart;
import com.devpro.finalProjectJavaweb21.dto.CartItem;
import com.devpro.finalProjectJavaweb21.model.Product;
import com.devpro.finalProjectJavaweb21.model.SaleOrder;
import com.devpro.finalProjectJavaweb21.model.SaleOrderProduct;
import com.devpro.finalProjectJavaweb21.services.ProductService;
import com.devpro.finalProjectJavaweb21.services.SaleOrderService;

@Controller
public class CartController extends BaseController {

	@Autowired
	private ProductService productService;

	@Autowired
	private SaleOrderService saleOrderService;

	@RequestMapping(value = { "/cart" }, method = RequestMethod.GET)
	public String home(Model model) throws IOException {

		return "customer/cart";
	}

	@RequestMapping(value = { "/cart/checkout" }, method = RequestMethod.GET)
	public String cartCheckout(final Model model) throws IOException {

		return "customer/checkout"; // -> đường dẫn tới View.
	}

	@RequestMapping(value = { "/cart/checkout" }, method = RequestMethod.POST)
	public String cartFinished(final Model model, final HttpServletRequest request) throws IOException {

		// Lấy thông tin khách hàng
		String customerFullName = request.getParameter("customerFullName");
		String customerNote = request.getParameter("note");
		String customerPhone = request.getParameter("customerPhone");
		String customerAddress = request.getParameter("customerAddress");

		// tạo hóa đơn + với thông tin khách hàng lấy được
		SaleOrder saleOrder = new SaleOrder();
		saleOrder.setCustomerName(customerFullName);
		saleOrder.setNote(customerNote);
		saleOrder.setCustomerAddress(customerAddress);
		saleOrder.setCustomerPhone(customerPhone);
		saleOrder.setOrderCode(String.valueOf(System.currentTimeMillis())); // mã hóa đơn
		saleOrder.setUser(getUserLogined());
		// lấy giỏ hàng
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");

		// lấy sản phẩm trong giỏ hàng
		for (CartItem cartItem : cart.getCartItems()) {
			SaleOrderProduct saleOrderProduct = new SaleOrderProduct();
			saleOrderProduct.setProduct(productService.getById(cartItem.getProductId()));
			saleOrderProduct.setQuantity(cartItem.getQuantity());
			saleOrderProduct.setSize(cartItem.getSize());
			// sử dụng hàm tiện ích add hoặc remove đối với các quan hệ one to many
			saleOrder.addSaleOrderProduct(saleOrderProduct);
		}
		BigDecimal totalCost = BigDecimal.ZERO;
		for (CartItem cartItem : cart.getCartItems()) {
			BigDecimal itemCost = cartItem.getPriceUnit().multiply(BigDecimal.valueOf(cartItem.getQuantity()));
			totalCost = totalCost.add(itemCost);
		}
		saleOrder.setTotal(totalCost);
		// lưu vào database
		saleOrderService.saveOrUpdate(saleOrder);

		// thực hiện reset lại giỏ hàng của Session hiện tại
		session.setAttribute("cart", null);
		session.setAttribute("totalItems", 0);

		return "customer/thankyou"; // -> đường dẫn tới View.

	}

	@RequestMapping(value = { "/ajax/cart/deleteItem/{productID}/{size}" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajax_deleteCartItem(final Model model, final HttpServletRequest request,
			final @PathVariable("productID") Integer prodId, final @PathVariable("size") String size) {
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");

		// Lấy danh sách sản phẩm đang có trong giỏ hàng
		List<CartItem> cartItems = cart.getCartItems();
		List<CartItem> deletedCartItems = new ArrayList<CartItem>();
		for (CartItem item : cartItems) {
			if (item.getProductId() == prodId && item.getSize().equalsIgnoreCase(size)) {
				deletedCartItems.add(item);
				session.setAttribute("totalItems", getTotalItems(request) - item.getQuantity());
			}
		}
		cartItems.removeAll(deletedCartItems);

		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("message", "Xoá sản phẩm thành công");
		jsonResult.put("totalItems", getTotalItems(request));

		session.setAttribute("totalItems", getTotalItems(request));

		return ResponseEntity.ok(jsonResult);
	}

	@RequestMapping(value = { "/ajax/cart/increaseItem/{productID}/{size}" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajax_increaseItem(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, final @PathVariable("productID") Integer prodId,
			final @PathVariable("size") String size) {

		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");

		// Lấy danh sách sản phẩm đang có trong giỏ hàng
		List<CartItem> cartItems = cart.getCartItems();
		List<CartItem> deletedCartItems = new ArrayList<CartItem>();
		for (CartItem item : cartItems) {
			if (item.getProductId() == prodId && item.getSize().equalsIgnoreCase(size)) {
				item.setQuantity(item.getQuantity() + 1);
				session.setAttribute("totalItems", getTotalItems(request) + 1);
			}
		}
		cartItems.removeAll(deletedCartItems);

		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("message", "success");
		jsonResult.put("totalItems", getTotalItems(request));

		session.setAttribute("totalItems", getTotalItems(request));

		return ResponseEntity.ok(jsonResult);
	}

	@RequestMapping(value = { "/ajax/cart/decreaseItem/{productID}/{size}" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajax_decreaseItem(final Model model, final HttpServletRequest request,
			final @PathVariable("productID") Integer prodId, final @PathVariable("size") String size) {

		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");

		// Lấy danh sách sản phẩm đang có trong giỏ hàng
		List<CartItem> cartItems = cart.getCartItems();
		List<CartItem> deletedCartItems = new ArrayList<CartItem>();
		for (CartItem item : cartItems) {
			if (item.getProductId() == prodId && item.getSize().equalsIgnoreCase(size)) {
				int quantity = item.getQuantity() - 1;
				item.setQuantity(quantity);
				session.setAttribute("totalItems", getTotalItems(request) - 1);
			}
		}
		cartItems.removeAll(deletedCartItems);

		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("message", "success");
		jsonResult.put("totalItems", getTotalItems(request));

		session.setAttribute("totalItems", getTotalItems(request));

		return ResponseEntity.ok(jsonResult);
	}

	@RequestMapping(value = { "/ajax/addToCart" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajax_AddToCart(final Model model, final HttpServletRequest request,
			final @RequestBody CartItem cartItem) {

		// để lấy session sử dụng thông qua request
		// session tương tự như kiểu Map và được lưu trên main memory.
		HttpSession session = request.getSession();

		// Lấy thông tin giỏ hàng. Đầu tiên giả sử giỏ hàng là null(chưa có giỏ hàng)
		Cart cart = null;

		// kiểm tra xem session có tồn tại đối tượng nào tên là "cart"
		if (session.getAttribute("cart") != null) { // tồn tại 1 giỏ hàng trên session
			cart = (Cart) session.getAttribute("cart");
		} else {// chưa có giỏ hàng nào trên session
			cart = new Cart(); // khởi tạo giỏ hàng mới
			session.setAttribute("cart", cart);
		}

		// Lấy danh sách sản phẩm đang có trong giỏ hàng
		List<CartItem> cartItems = cart.getCartItems();

		// kiểm tra nếu sản phẩm muốn bổ sùng vào giỏ hàng có trong giỏ hàng nếu có thì
		// tăng số lượng
		boolean isExists = false;
		for (CartItem item : cartItems) {
			if (item.getProductId() == cartItem.getProductId() && item.getSize().equalsIgnoreCase(cartItem.getSize())) {
				isExists = true;
				// tăng số lượng sản phẩm lên
				item.setQuantity(item.getQuantity() + cartItem.getQuantity());
			}
		}

		// nếu sản phẩm chưa có trong giỏ hàng thì thực hiện add sản phẩm đó vào giỏ
		// hàng
		if (!isExists) {
			// trước khi thêm mới thì lấy sản phẩm trong db
			// và thiết lập tên + đơn giá cho cartitem
			Product productInDb = productService.getById(cartItem.getProductId());
			cartItem.setProductName(productInDb.getProductName());
			cartItem.setPriceUnit(productInDb.getProductPrice());
			cartItem.setAvatar(productInDb.getAvatar());
			cartItem.setSize(cartItem.getSize());
			cart.getCartItems().add(cartItem); // thêm mới sản phẩm vào giỏ hàng

		}

		// tính tổng tiền
		// this.calculateTotalPrice(request);

		// trả về kết quả
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("status", "success");
		jsonResult.put("totalItems", getTotalItems(request));

		// lưu totalItems vào session
		// tất cả các giá trị lưu trên session đều có thể truy cập được từ View
		session.setAttribute("totalItems", getTotalItems(request));

		return ResponseEntity.ok(jsonResult);
	}

	private int getTotalItems(final HttpServletRequest request) {
		HttpSession httpSession = request.getSession();

		if (httpSession.getAttribute("cart") == null) {
			return 0;
		}

		Cart cart = (Cart) httpSession.getAttribute("cart");
		List<CartItem> cartItems = cart.getCartItems();

		int total = 0;
		// khác id thì tăng số lượng ở icon lên
		int listItems = cartItems.size();
		for (int i = 1; i <= listItems; i++) {
			total++;
		}
//		for (CartItem item : cartItems) {
//			total += item.getQuantity();
//		}

		return total;
	}

}
