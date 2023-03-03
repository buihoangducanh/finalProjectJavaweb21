package com.devpro.finalProjectJavaweb21.controller.customer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.finalProjectJavaweb21.controller.BaseController;
import com.devpro.finalProjectJavaweb21.model.Contact;
import com.devpro.finalProjectJavaweb21.services.ContactService;

@Controller
public class ContactController extends BaseController {
	@Autowired
	private ContactService contactService;
	@Autowired
	public JavaMailSender emailSender;

	@RequestMapping(value = { "/contact" }, method = RequestMethod.GET)
	public String contactGet(final Model model) {
		Contact data = new Contact();
		model.addAttribute("contact", data);
		return "customer/contact";
	}

	@RequestMapping(value = { "/contact" }, method = RequestMethod.POST)
	public String contactPost(final Model model, final @ModelAttribute("contact") Contact data) {
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(data.getEmail());
		message.setSubject("CrazyShoes đã tiếp nhận yêu cầu từ bạn");
		message.setText("Chúng tôi sẽ phản hồi và thực hiện yêu cầu của bạn sớm nhất!");
		contactService.saveOrUpdate(data);
		this.emailSender.send(message);
		Contact data1 = new Contact();
		model.addAttribute("contact", data1);
		return "customer/contact";
	}

}