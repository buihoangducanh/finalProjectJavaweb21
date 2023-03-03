package com.devpro.finalProjectJavaweb21.controller.administrator;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.finalProjectJavaweb21.controller.BaseController;
import com.devpro.finalProjectJavaweb21.model.Contact;
import com.devpro.finalProjectJavaweb21.services.ContactService;

@Controller
public class AdminContactsController extends BaseController {
	@Autowired
	ContactService contactService;

	@RequestMapping(value = { "/admin/contacts" }, method = RequestMethod.GET)
	public String contactListGet(Model model) throws IOException {

		List<Contact> contactsList = contactService
				.getEntitiesByNativeSQL("SELECT * FROM tbl_contact ORDER BY created_date DESC ");
		model.addAttribute("contacts", contactsList);
		return "administrator/contactsList";
	}

	@RequestMapping(value = { "/admin/contacts/contact_details/{contactID}" }, method = RequestMethod.GET)
	public String contactDetail(Model model, final @PathVariable("contactID") Integer contactID) throws IOException {
		Contact contactDetails = contactService.getById(contactID);
		model.addAttribute("contact", contactDetails);
		return "administrator/contactContent";
	}
}
