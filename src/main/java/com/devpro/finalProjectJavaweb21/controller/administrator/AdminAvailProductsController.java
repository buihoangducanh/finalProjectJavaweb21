package com.devpro.finalProjectJavaweb21.controller.administrator;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.finalProjectJavaweb21.controller.BaseController;
import com.devpro.finalProjectJavaweb21.dto.ProductSearchModel;
import com.devpro.finalProjectJavaweb21.model.Brand;
import com.devpro.finalProjectJavaweb21.model.Color;
import com.devpro.finalProjectJavaweb21.model.Product;
import com.devpro.finalProjectJavaweb21.model.Size;
import com.devpro.finalProjectJavaweb21.model.Type;
import com.devpro.finalProjectJavaweb21.services.BrandService;
import com.devpro.finalProjectJavaweb21.services.ColorService;
import com.devpro.finalProjectJavaweb21.services.PagerData;
import com.devpro.finalProjectJavaweb21.services.ProductService;
import com.devpro.finalProjectJavaweb21.services.SizeService;
import com.devpro.finalProjectJavaweb21.services.TypeService;

@Controller
public class AdminAvailProductsController extends BaseController {

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

	// render available products
	@RequestMapping(value = { "/admin/products_management/available_products" }, method = RequestMethod.GET)
	public String availProductGET(final Model model, final HttpServletRequest request) throws IOException {
		List<Brand> brandsList = brandService.getEntitiesByNativeSQL("select * from tbl_brand");
		model.addAttribute("brands", brandsList);
		String keyWord = request.getParameter("keyword");
		Integer brandId = getInteger(request, "selectSearch");
		ProductSearchModel searchModel = new ProductSearchModel();
		searchModel.setKeyword(keyWord);
		searchModel.setBrandId(brandId);
		searchModel.setPage(getCurrentPage(request));
		PagerData<Product> products = productService.search(searchModel);
		model.addAttribute("products", products);
		model.addAttribute("searchModel", searchModel);
		return "administrator/available_products";
	}

	// delete product
	@PostMapping("/ajax/admin/deleteProduct/{prodID}")
	public String cancelOrder(final Model model, final @PathVariable("prodID") Integer prodID) throws IOException {
		Product productInDB = productService.getById(prodID);
		productInDB.setStatus(false);
		productService.saveOrUpdate(productInDB);
		return "redirect:/admin/products_management/available_products";
	}

	// edit product
	@RequestMapping(value = { "/admin/products_management/edit_products/{productID}" }, method = RequestMethod.GET)
	public String editProductGET(final Model model, final @PathVariable("productID") String prodID) throws IOException {
		Integer productID = Integer.parseInt(prodID);
		Product editingPro = productService.getById(productID);
		model.addAttribute("product", editingPro);
		List<Color> colorsList = colorService.getEntitiesByNativeSQL("select * from tbl_color");
		model.addAttribute("colors", colorsList);
		List<Type> typesList = typeService.getEntitiesByNativeSQL("select * from tbl_type");
		model.addAttribute("types", typesList);
		List<Size> sizesList = sizeService.getEntitiesByNativeSQL("select * from tbl_size");
		model.addAttribute("sizes", sizesList);
		return "administrator/add_product";
	}

}
