package com.devpro.finalProjectJavaweb21.controller.customer;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.devpro.finalProjectJavaweb21.controller.BaseController;
import com.devpro.finalProjectJavaweb21.dto.ProductSearchModel;
import com.devpro.finalProjectJavaweb21.model.Brand;
import com.devpro.finalProjectJavaweb21.model.Color;
import com.devpro.finalProjectJavaweb21.model.Product;
import com.devpro.finalProjectJavaweb21.model.Type;
import com.devpro.finalProjectJavaweb21.services.BrandService;
import com.devpro.finalProjectJavaweb21.services.ColorService;
import com.devpro.finalProjectJavaweb21.services.PagerData;
import com.devpro.finalProjectJavaweb21.services.ProductService;
import com.devpro.finalProjectJavaweb21.services.TypeService;

@Controller
public class ShopController extends BaseController {
	@Autowired
	private ProductService productService;
	@Autowired
	private BrandService brandService;
	@Autowired
	private ColorService colorService;
	@Autowired
	private TypeService typeService;

	@GetMapping("/shop")
	public String home(Model model, HttpServletRequest request) throws IOException {
		List<Brand> brandsList = brandService.findAll();
		model.addAttribute("brands", brandsList);
		ProductSearchModel prodSearchMod = new ProductSearchModel();
		String keyword = request.getParameter("keyword");
		prodSearchMod.setKeyword(keyword);

		// list brands
		String[] brandFilter = request.getParameterValues("brand");
		List<Integer> brandID_checkBoxesList = new ArrayList<Integer>();
		if (brandFilter != null) {
			for (String brand : brandFilter) {
				Integer brandIDCheckbox = Integer.parseInt(brand.substring(brand.length() - 1));
				brandID_checkBoxesList.add(brandIDCheckbox);
			}
		}
		// set list brands id for search model
		prodSearchMod.setBrandID_list(brandID_checkBoxesList);
		// list types
		String[] typesFilter = request.getParameterValues("type");
		List<Integer> typeID_checkBoxesList = new ArrayList<Integer>();
		if (typesFilter != null) {
			for (String type : typesFilter) {
				Integer typeIDCheckbox = Integer.parseInt(type.substring(type.length() - 1));
				typeID_checkBoxesList.add(typeIDCheckbox);
			}
		}
		// set list types id for search model
		prodSearchMod.setTypeID_list(typeID_checkBoxesList);
		// list colors
		String[] colorsFilter = request.getParameterValues("color");
		List<Integer> colorID_checkBoxesList = new ArrayList<Integer>();
		if (colorsFilter != null) {
			for (String color : colorsFilter) {
				Integer colorIDCheckbox = Integer.parseInt(color.substring(color.length() - 1));
				colorID_checkBoxesList.add(colorIDCheckbox);
			}
		}
		// set list colors id for search model
		prodSearchMod.setColorsID_list(colorID_checkBoxesList);
		String orderBy = request.getParameter("orderBy");
		prodSearchMod.setOrderBy(orderBy);
		prodSearchMod.setPage(getCurrentPage(request));
		PagerData<Product> products = productService.renderListProd(prodSearchMod);
		model.addAttribute("products", products);
		model.addAttribute("prodSearchMod", prodSearchMod);
		List<Color> colorsList = colorService.findAll();
		model.addAttribute("colors", colorsList);
		List<Type> typesList = typeService.findAll();
		model.addAttribute("types", typesList);
		List<Product> topFiveHot = productService.getTop5Hot();
		model.addAttribute("topFiveHot", topFiveHot);
		return "customer/shop";
	}

}
