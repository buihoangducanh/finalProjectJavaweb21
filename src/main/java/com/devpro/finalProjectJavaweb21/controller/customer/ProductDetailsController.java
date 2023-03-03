package com.devpro.finalProjectJavaweb21.controller.customer;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.devpro.finalProjectJavaweb21.controller.BaseController;
import com.devpro.finalProjectJavaweb21.model.Brand;
import com.devpro.finalProjectJavaweb21.model.Product;
import com.devpro.finalProjectJavaweb21.model.ProductImage;
import com.devpro.finalProjectJavaweb21.model.Size;
import com.devpro.finalProjectJavaweb21.services.ProductImagesService;
import com.devpro.finalProjectJavaweb21.services.ProductService;

@Controller
public class ProductDetailsController extends BaseController {

	@Autowired
	private ProductService productService;
	@Autowired
	private ProductImagesService productImagesService;

	// render product details
	@GetMapping("/product_details/{productID}")
	public String prodDetails(Model model, final @PathVariable("productID") String prodID) throws IOException {
		Integer productID = Integer.parseInt(prodID);
		Product prod = productService.getById(productID);
		Product newProd = productService.getById(productID);
		Brand brand = newProd.getBrand();
		List<Product> relatedProducts = productService.getRelatedProduct(brand.getId());
		List<ProductImage> imagesList = productImagesService
				.getEntitiesByNativeSQL("select * from tbl_product_image where product_id = " + prodID);
		model.addAttribute("product", prod);
		model.addAttribute("imgsList", imagesList);
		Set<Size> sizesSet = prod.getSizes();
		List<Size> sizesList = new ArrayList<Size>();
		sizesList.addAll(sizesSet);
		// sort sizes list
		Collections.sort(sizesList);
		model.addAttribute("sizesList", sizesList);
		model.addAttribute("relatedProducts", relatedProducts);
		return "customer/singleproduct";
	}
}
