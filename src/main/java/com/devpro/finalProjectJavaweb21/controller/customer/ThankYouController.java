package com.devpro.finalProjectJavaweb21.controller.customer;

import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.finalProjectJavaweb21.controller.BaseController;

@Controller
public class ThankYouController extends BaseController {
	@RequestMapping(value = { "/order_successfully" }, method = RequestMethod.GET)
	public String orderSuccessfully(Model model) throws IOException {

		return "customer/thankyou";
	}
}
