package com.devpro.finalProjectJavaweb21.controller.customer;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.devpro.finalProjectJavaweb21.controller.BaseController;
import com.devpro.finalProjectJavaweb21.model.Subcriber;
import com.devpro.finalProjectJavaweb21.services.SubcriberService;

@Controller
public class SubcribeController extends BaseController {

	@Autowired
	private SubcriberService subcriberService;

	@PostMapping("ajax/subcribe")
	public ResponseEntity<Map<String, Object>> ajaxSubcribe(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, final @RequestBody Subcriber suber) throws IOException {
		subcriberService.saveOrUpdate(suber);
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("statusCode", 200);
		jsonResult.put("statusMessage", "Bạn sẽ nhận được các thông tin mới nhất từ chúng tôi");
		return ResponseEntity.ok(jsonResult);
	}

}
