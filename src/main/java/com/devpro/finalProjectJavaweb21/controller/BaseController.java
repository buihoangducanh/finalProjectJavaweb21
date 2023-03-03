package com.devpro.finalProjectJavaweb21.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.devpro.finalProjectJavaweb21.model.Brand;
import com.devpro.finalProjectJavaweb21.model.User;
import com.devpro.finalProjectJavaweb21.services.BrandService;

public abstract class BaseController {
	@Autowired
	private BrandService brandService;

	@ModelAttribute("brands")
	public List<Brand> getAllBrands() {
		return brandService.findAll();
	}

	public Integer getInteger(HttpServletRequest request, String paramName) {
		try {
			return Integer.parseInt(request.getParameter(paramName));
		} catch (Exception e) {
			return null;
		}
	}

	public int getCurrentPage(HttpServletRequest request) {
		try {
			return Integer.parseInt(request.getParameter("page"));
		} catch (Exception e) {
			return 1;
		}
	}

	/**
	 * Kiểm tra xem người dùng đã đăng nhập chưa? User logined có thể truy cập thông
	 * qua class SecurityContextHolder
	 * 
	 * @return true|false, true nếu đã login ngược lại trả về false
	 */
	@ModelAttribute("isLogined")
	public boolean isLogined() {
		boolean isLogined = false;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (principal instanceof UserDetails) {
			isLogined = true;
		}

		return isLogined;
	}

	/**
	 * trả về entity User chính là user logined User logined có thể truy cập thông
	 * qua class SecurityContextHolder
	 * 
	 * @return
	 */
	@ModelAttribute("userLogined")
	public User getUserLogined() {
		Object userLogined = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (userLogined != null && userLogined instanceof UserDetails)
			return (User) userLogined;

		return new User();
	}
}
