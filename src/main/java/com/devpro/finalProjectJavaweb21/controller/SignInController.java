package com.devpro.finalProjectJavaweb21.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SignInController extends BaseController {

	@RequestMapping(value = { "/sign_in" }, method = RequestMethod.GET)
	public String signInGet(Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {

		return "login";
	}

}
