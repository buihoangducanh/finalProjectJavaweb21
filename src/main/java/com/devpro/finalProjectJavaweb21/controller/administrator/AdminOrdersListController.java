package com.devpro.finalProjectJavaweb21.controller.administrator;

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
import com.devpro.finalProjectJavaweb21.dto.SaleOrderSearchModel;
import com.devpro.finalProjectJavaweb21.model.SaleOrder;
import com.devpro.finalProjectJavaweb21.model.SaleOrderProduct;
import com.devpro.finalProjectJavaweb21.services.PagerData;
import com.devpro.finalProjectJavaweb21.services.SaleOrderService;

@Controller
public class AdminOrdersListController extends BaseController {

	@Autowired
	SaleOrderService saleOrderService;

	@GetMapping("/admin/orders_management/orders_list")
	public String orderList(final Model model, final HttpServletRequest request) throws IOException {
		Integer type = getInteger(request, "selectSearch");
		SaleOrderSearchModel searchModel = new SaleOrderSearchModel();
		searchModel.setType(type);
		searchModel.setPage(getCurrentPage(request));
		PagerData<SaleOrder> saleOrders = saleOrderService.searchSaleOrder(searchModel);
		model.addAttribute("saleOrders", saleOrders);
		model.addAttribute("searchModel", searchModel);
		return "administrator/orders_list";
	}

	@GetMapping("/admin/orders_management/orders_list/order_details/{orderID}")
	public String orderDetailsGet(final Model model, final @PathVariable("orderID") Integer orderID)
			throws IOException {

		SaleOrder saleOrder = saleOrderService.getById(orderID);
		model.addAttribute("saleOrder", saleOrder);
		Set<SaleOrderProduct> setOrderProds = saleOrder.getOrderProducts();
		List<SaleOrderProduct> listOrderProds = new ArrayList<SaleOrderProduct>(setOrderProds);
		model.addAttribute("orderDetails", listOrderProds);
		return "administrator/orderDetails";
	}

	@GetMapping("/admin/orders_management/orders_list/order_details/delivered/{orderID}")
	public String delivered(final Model model, final @PathVariable("orderID") Integer orderID) throws IOException {

		SaleOrder saleOrder = saleOrderService.getById(orderID);
		saleOrder.setStatus(false);
		saleOrderService.saveOrUpdate(saleOrder);
		return "redirect:/admin/orders_management/orders_list";
	}

	@PostMapping("/admin/cancelOrder/{orderID}")
	public String cancelOrder(final Model model, final @PathVariable("orderID") Integer orderID) throws IOException {
		SaleOrder saleOrder = saleOrderService.getById(orderID);
		saleOrder.setCancel_status(true);
		saleOrderService.saveOrUpdate(saleOrder);
		return "redirect:/admin/orders_management/orders_list";
	}
}
