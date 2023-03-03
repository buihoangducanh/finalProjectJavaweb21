package com.devpro.finalProjectJavaweb21.controller.administrator;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.finalProjectJavaweb21.controller.BaseController;
import com.devpro.finalProjectJavaweb21.model.SaleOrder;
import com.devpro.finalProjectJavaweb21.repository.SaleOrderRepository;
import com.devpro.finalProjectJavaweb21.services.SaleOrderService;

@Controller
public class AdminHomeController extends BaseController {
	@Autowired
	SaleOrderService saleOrderService;
	@Autowired
	SaleOrderRepository saleOrderRepository;

	@RequestMapping(value = { "/admin/dashboard" }, method = RequestMethod.GET)
	public String AdminDashboard(final Model model) throws IOException {

		List<SaleOrder> saleOrdersList = saleOrderService
				.getEntitiesByNativeSQL("SELECT * FROM tbl_saleorder ORDER BY created_date DESC LIMIT 6");
		BigDecimal totalSales = saleOrderRepository.selectTotals();
		BigDecimal totalSalesToday = saleOrderRepository.selectTotalsToday();
		model.addAttribute("totalSalesToday", totalSalesToday);
		model.addAttribute("totalSales", totalSales);
		model.addAttribute("saleOrders", saleOrdersList);

		return "administrator/index";
	}
}
