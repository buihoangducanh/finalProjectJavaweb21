package com.devpro.finalProjectJavaweb21.controller.customer;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.finalProjectJavaweb21.controller.BaseController;
import com.devpro.finalProjectJavaweb21.model.Product;
import com.devpro.finalProjectJavaweb21.model.Type;
import com.devpro.finalProjectJavaweb21.services.ProductService;
import com.devpro.finalProjectJavaweb21.services.TypeService;

@Controller
public class HomeController extends BaseController {
	@Autowired
	private ProductService productService;

	@Autowired
	private TypeService typeService;

	@RequestMapping(value = { "/home" }, method = RequestMethod.GET)
	public String home(Model model) throws IOException {
		List<Product> hot8Vans = productService.getTop8VansHot();
		model.addAttribute("hotVansList", hot8Vans);
		List<Product> hot5Converse = productService.getTop5ConverseHot();
		model.addAttribute("hotConverseList", hot5Converse);
		List<Type> typesList = typeService.findAll();
		model.addAttribute("types", typesList);
		return "customer/index";
	}
}
