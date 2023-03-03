package com.devpro.finalProjectJavaweb21.controller.customer;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.finalProjectJavaweb21.controller.BaseController;
import com.devpro.finalProjectJavaweb21.model.User;
import com.devpro.finalProjectJavaweb21.repository.UserRepository;
import com.devpro.finalProjectJavaweb21.services.RoleService;

@Controller
public class SignUpController extends BaseController {
	@Autowired
	UserRepository userRepo;
	@Autowired
	RoleService roleService;

	@RequestMapping(value = { "/sign_up" }, method = RequestMethod.GET)
	public String signUpGet(Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
		return "customer/signup";
	}

	@RequestMapping(value = { "/sign_up" }, method = RequestMethod.POST)
	public String signUpPost(Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String phoneNumber = request.getParameter("phoneNumber");
		User newUser = new User();
		firstName = firstName.substring(0, 1).toUpperCase() + firstName.substring(1);
		newUser.setFirst_name(firstName);
		lastName = lastName.substring(0, 1).toUpperCase() + lastName.substring(1);
		newUser.setLast_name(lastName);
		newUser.setEmail(email);
		newUser.setPhone(phoneNumber);
		newUser.setPassword(new BCryptPasswordEncoder(4).encode(password));
		newUser.addRole(roleService.getById(17));
		userRepo.save(newUser);
		return "redirect:/sign_in";
	}
}
