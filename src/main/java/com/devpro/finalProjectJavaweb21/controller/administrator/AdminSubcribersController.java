package com.devpro.finalProjectJavaweb21.controller.administrator;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.finalProjectJavaweb21.controller.BaseController;
import com.devpro.finalProjectJavaweb21.model.Subcriber;
import com.devpro.finalProjectJavaweb21.services.SubcriberService;

@Controller
public class AdminSubcribersController extends BaseController {

	@Autowired
	SubcriberService subcriberService;

	@RequestMapping(value = { "/admin/subcribers" }, method = RequestMethod.GET)
	public String subcribersList(Model model) throws IOException {
		List<Subcriber> subcribersList = subcriberService.findAll();
		model.addAttribute("subcribers", subcribersList);
		return "administrator/subcribersList";
	}

	@PostMapping("/admin/deleteSUBER/{suberID}")
	public String deleteSUBER(final Model model, final @PathVariable("suberID") Integer suberID) throws IOException {
		Subcriber Subcriber = subcriberService.getById(suberID);
		subcriberService.delete(Subcriber);
		return "redirect:/admin/orders_management/orders_list";
	}
}
