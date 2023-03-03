package com.devpro.finalProjectJavaweb21.controller.customer;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.devpro.finalProjectJavaweb21.controller.BaseController;
import com.devpro.finalProjectJavaweb21.model.SaleOrder;
import com.devpro.finalProjectJavaweb21.model.SaleOrderProduct;
import com.devpro.finalProjectJavaweb21.services.SaleOrderService;

@Controller
public class HistoryController extends BaseController {

	@Autowired
	private SaleOrderService saleOrderService;

	@GetMapping("/purchase_history")
	public String purchase_history(Model model, HttpServletRequest request) throws IOException {

		List<SaleOrder> saleOrder = saleOrderService.getUserSaleOrder(getUserLogined().getId());
		model.addAttribute("saleOrdersList", saleOrder);
		return "customer/purchaseHistory";
	}

	@GetMapping("/purchase_history/order_details/{orderID}")
	public String order_details(Model model, HttpServletRequest request, final @PathVariable("orderID") Integer orderID)
			throws IOException {

		SaleOrder saleOrder = saleOrderService.getById(orderID);
		model.addAttribute("saleOrder", saleOrder);
		Set<SaleOrderProduct> setOrderProds = saleOrder.getOrderProducts();
		List<SaleOrderProduct> listOrderProds = new ArrayList<SaleOrderProduct>(setOrderProds);
		model.addAttribute("orderDetails", listOrderProds);

		return "customer/orderDetails";
	}

	@PostMapping("/cancelOrder/{orderID}")
	public String cancelOrder(final Model model, final @PathVariable("orderID") Integer orderID) throws IOException {
		SaleOrder saleOrder = saleOrderService.getById(orderID);
		saleOrder.setCancel_request(true);
		saleOrderService.saveOrUpdate(saleOrder);
		return "redirect:/purchase_history";
	}

	@PostMapping("/recieved/{orderID}")
	public String recievedOrder(final Model model, final @PathVariable("orderID") Integer orderID) throws IOException {
		SaleOrder saleOrder = saleOrderService.getById(orderID);
		saleOrder.setRecieved(true);
		saleOrderService.saveOrUpdate(saleOrder);
		return "redirect:/purchase_history";
	}
}
