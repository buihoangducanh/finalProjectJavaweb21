package com.devpro.finalProjectJavaweb21.controller.administrator;

import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.finalProjectJavaweb21.controller.BaseController;

@Controller
public class AdminProfileController extends BaseController {
	@RequestMapping(value = { "/admin/my_profile" }, method = RequestMethod.GET)
	public String adminProfile(final Model model) throws IOException {
		return "administrator/my_profile";
	}
}
