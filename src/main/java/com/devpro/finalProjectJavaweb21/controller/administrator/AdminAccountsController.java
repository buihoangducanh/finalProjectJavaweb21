package com.devpro.finalProjectJavaweb21.controller.administrator;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.finalProjectJavaweb21.controller.BaseController;
import com.devpro.finalProjectJavaweb21.model.Role;
import com.devpro.finalProjectJavaweb21.model.User;
import com.devpro.finalProjectJavaweb21.services.RoleService;
import com.devpro.finalProjectJavaweb21.services.UserService;

@Controller
public class AdminAccountsController extends BaseController {

	@Autowired
	UserService userService;

	@Autowired
	RoleService roleService;

	@RequestMapping(value = { "/admin/accounts_management" }, method = RequestMethod.GET)
	public String accountsList(final Model model) throws IOException {
		List<User> users = userService.findAll();
		model.addAttribute("users", users);
		return "administrator/accountsList";
	}

	@RequestMapping(value = { "/admin/accounts_management/setToUser/{userID}" }, method = RequestMethod.GET)
	public String setToUser(final Model model, final @PathVariable("userID") Integer userID) throws IOException {
		Role userRole = roleService.getById(17);
		User modifiedUser = userService.getById(userID);
		Set<Role> userRoles = modifiedUser.getRoles();
		List<Role> userRolesList = new ArrayList<>(userRoles);
		for (Role role : userRolesList) {
			modifiedUser.deleteRole(role);
		}
		modifiedUser.addRole(userRole);
		userService.saveOrUpdate(modifiedUser);
		return "redirect:/admin/accounts_management";
	}

	@RequestMapping(value = { "/admin/accounts_management/setToAdmin/{userID}" }, method = RequestMethod.GET)
	public String setToAdmin(final Model model, final @PathVariable("userID") Integer userID) throws IOException {
		Role adminRole = roleService.getById(16);
		User modifiedUser = userService.getById(userID);
		Set<Role> userRoles = modifiedUser.getRoles();
		List<Role> userRolesList = new ArrayList<>(userRoles);
		for (Role role : userRolesList) {
			modifiedUser.deleteRole(role);
		}
		modifiedUser.addRole(adminRole);
		userService.saveOrUpdate(modifiedUser);
		return "redirect:/admin/accounts_management";
	}

	@PostMapping("/ajax/admin/deleteUser/{userID}")
	public String deleteUser(final Model model, final @PathVariable("userID") Integer userID) throws IOException {
		User userInDB = userService.getById(userID);
		Set<Role> setRoles = userInDB.getRoles();
		List<Role> listRoles = new ArrayList<>(setRoles);
		for (Role role : listRoles) {
			userInDB.deleteRole(role);
		}

		userService.delete(userInDB);
		return "redirect:/admin/accounts_management";
	}
}
