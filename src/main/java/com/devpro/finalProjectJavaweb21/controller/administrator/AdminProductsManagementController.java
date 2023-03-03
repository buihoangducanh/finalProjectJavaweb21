package com.devpro.finalProjectJavaweb21.controller.administrator;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.finalProjectJavaweb21.controller.BaseController;
import com.devpro.finalProjectJavaweb21.model.Brand;
import com.devpro.finalProjectJavaweb21.model.Color;
import com.devpro.finalProjectJavaweb21.model.Product;
import com.devpro.finalProjectJavaweb21.model.Size;
import com.devpro.finalProjectJavaweb21.model.Type;
import com.devpro.finalProjectJavaweb21.services.BrandService;
import com.devpro.finalProjectJavaweb21.services.ColorService;
import com.devpro.finalProjectJavaweb21.services.ProductService;
import com.devpro.finalProjectJavaweb21.services.SizeService;
import com.devpro.finalProjectJavaweb21.services.TypeService;

@Controller
public class AdminProductsManagementController extends BaseController {
	@Autowired
	private BrandService brandService;
	@Autowired
	private ColorService colorService;
	@Autowired
	private TypeService typeService;
	@Autowired
	private SizeService sizeService;
	@Autowired
	private ProductService productService;
	@PersistenceContext
	protected EntityManager entityManager;

	@RequestMapping(value = { "/admin/products_management/add_product" }, method = RequestMethod.GET)
	public String addProductGET(final Model model) throws IOException {
		Product emptyProduct = new Product();
		model.addAttribute("product", emptyProduct);
		List<Brand> brandsList = brandService.findAll();
		model.addAttribute("brands", brandsList);
		List<Color> colorsList = colorService.findAll();
		model.addAttribute("colors", colorsList);
		List<Type> typesList = typeService.findAll();
		model.addAttribute("types", typesList);
		List<Size> sizesList = sizeService.findAll();
		model.addAttribute("sizes", sizesList);
		return "administrator/add_product";
	}

	@RequestMapping(value = { "/admin/products_management/add_product" }, method = RequestMethod.POST)
	public String addProductPOST(final Model model, final HttpServletRequest request,
			final @ModelAttribute("product") Product prd, final @RequestParam("avatarP") MultipartFile avatar,
			final @RequestParam("productImagess") MultipartFile[] productImages) throws IOException {

		String hotCheck = request.getParameter("hotProduct");
		boolean HOT = false;
		if (hotCheck != null) {
			HOT = true;
		}
		// size values list
		String[] sizesList = request.getParameterValues("sizesList");
		if (sizesList == null) {
			return "redirect:/admin/products_management/add_product";
		}
		if (prd.getId() == null || prd.getId() <= 0) {
			productService.add(prd, avatar, productImages, sizesList, HOT);
		} else {
			productService.update(prd, avatar, productImages, sizesList, HOT);
		}
		return "redirect:/admin/products_management/available_products";
	}
}
