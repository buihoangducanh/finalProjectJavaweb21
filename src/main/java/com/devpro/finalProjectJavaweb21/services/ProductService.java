package com.devpro.finalProjectJavaweb21.services;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.finalProjectJavaweb21.dto.ProductSearchModel;
import com.devpro.finalProjectJavaweb21.model.Product;
import com.devpro.finalProjectJavaweb21.model.ProductImage;
import com.devpro.finalProjectJavaweb21.model.Size;
import com.devpro.finalProjectJavaweb21.model.Type;

@Service
public class ProductService extends BaseService<Product> {

	@Autowired
	private ProductImagesService productImagesService;
	@Autowired
	private SizeService sizeService;
	@Autowired
	private TypeService typeService;

	@Override
	protected Class<Product> clazz() {
		return Product.class;
	}

	/**
	 * dùng để kiểm tra xem admin có upload ảnh product hay không
	 * 
	 * @param images
	 * @return
	 */
	private boolean isEmptyUploadFile(MultipartFile[] images) {
		if (images == null || images.length <= 0)
			return true;

		if (images.length == 1 && images[0].getOriginalFilename().isEmpty())
			return true;

		return false;
	}

	/**
	 * dùng để kiểm tra xem admin có upload ảnh product hay không
	 * 
	 * @param image
	 * @return
	 */
	private boolean isEmptyUploadFile(MultipartFile image) {
		return image == null || image.getOriginalFilename().isEmpty();
	}

	private String getUniqueUploadFileName(String fileName) {
		String[] splitFileName = fileName.split("\\.");
		return splitFileName[0] + System.currentTimeMillis() + "." + splitFileName[1];
	}

	@Transactional
	public List<Product> getTop8VansHot() {

		return getEntitiesByNativeSQL(
				"SELECT * FROM tbl_product where is_hot = true and brand_id = 1 ORDER BY created_date DESC LIMIT 8");
	}

	@Transactional
	public List<Product> getTop5ConverseHot() {

		return getEntitiesByNativeSQL(
				"SELECT * FROM tbl_product where is_hot = true and brand_id = 2 ORDER BY created_date DESC LIMIT 5");
	}

	@Transactional
	public List<Product> getTop5Hot() {

		return getEntitiesByNativeSQL(
				"SELECT * FROM tbl_product where is_hot = true ORDER BY created_date DESC LIMIT 5");
	}

	@Transactional
	public List<Product> getRelatedProduct(Integer brandID) {

		return getEntitiesByNativeSQL(
				"SELECT * FROM tbl_product where brand_id = " + brandID + " ORDER BY created_date DESC");
	}

	@Transactional
	public Product add(Product p, MultipartFile productAvatar, MultipartFile[] productPictures, String[] sizesList,
			boolean hot) throws IllegalStateException, IOException {

		// kiểm tra xem admin có đẩy avatar lên không ???
		if (!isEmptyUploadFile(productAvatar)) { // có đẩy avatar lên.

			String fileName = getUniqueUploadFileName(productAvatar.getOriginalFilename());

			// tạo đường dẫn tới folder chứa avatar
			String pathToAvatar = "C:/upload/product/avatar/" + fileName;

			// lưu avatar vào đường dẫn trên
			productAvatar.transferTo(new File(pathToAvatar));

			p.setAvatar("product/avatar/" + fileName);
		}

		// có đẩy pictures(product_images) ???
		if (!isEmptyUploadFile(productPictures)) { // có đẩy pictures lên.

			// nếu admin đẩy lên thì duyệt tất cả file đẩy lên và lưu trên server
			for (MultipartFile pic : productPictures) {
				String fileName = getUniqueUploadFileName(pic.getOriginalFilename());

				// lưu ảnh admin đẩy lên vào server
				pic.transferTo(new File("C:/upload/product/pictures/" + fileName));

				// tạo mới 1 bản ghi product_images
				ProductImage pi = new ProductImage();
				pi.setPath("product/pictures/" + fileName);
				pi.setTitle(fileName);

				p.addProductImage(pi);
			}
		}
		// add list size
		p.setIsHot(hot);
		sizeService.add(p, sizesList);
		// tạo seo: bổ sung thêm thời gian tính bằng miliseconds để tránh trùng seo
//		p.setSeo(new Slugify().slugify(p.getTitle() + "-" + System.currentTimeMillis()));

		// lưu vào database
		return super.saveOrUpdate(p);

	}

	@Transactional
	public Product update(Product p, MultipartFile productAvatar, MultipartFile[] productPictures, String[] sizesList,
			boolean hot) throws IllegalStateException, IOException {

		// lấy thông tin cũ của product theo id
		Product productInDb = super.getById(p.getId());

		// delete all old size
		Set<Size> oldSizesSet = productInDb.getSizes();
		List<Size> oldSizesList = new ArrayList<Size>();
		oldSizesList.addAll(oldSizesSet);
		for (Size size : oldSizesList) {
			productInDb.deleteSize(size);
		}

		// có đẩy avartar ??? => xóa avatar cũ đi và thêm avatar mới
		if (!isEmptyUploadFile(productAvatar)) {
			// xóa avatar trong folder lên
			new File("C:/upload/" + productInDb.getAvatar()).delete();

			// update avatar mới
			String fileName = getUniqueUploadFileName(productAvatar.getOriginalFilename());
			productAvatar.transferTo(new File("C:/upload/product/avatar/" + fileName));
			p.setAvatar("product/avatar/" + fileName);
		} else {
			// sử dụng lại avartar cũ
			p.setAvatar(productInDb.getAvatar());
		}

		// có đẩy pictures ???
		if (!isEmptyUploadFile(productPictures)) {

			// xóa pictures cũ
			if (productInDb.getProductImages() != null && productInDb.getProductImages().size() > 0) {
				for (ProductImage opi : productInDb.getProductImages()) {
					// xóa avatar trong folder lên
					new File("C:/upload/" + opi.getPath()).delete();

					// xóa dữ liệu trong database
					productImagesService.delete(opi);
				}
			}

			// update pictures mới
			for (MultipartFile pic : productPictures) {
				String fileName = getUniqueUploadFileName(pic.getOriginalFilename());

				pic.transferTo(new File("C:/upload/product/pictures/" + fileName));

				ProductImage pi = new ProductImage();
				pi.setPath("product/pictures/" + fileName);
				pi.setTitle(fileName);
				p.addProductImage(pi);
			}
		}

		// add new size list
		p.setIsHot(hot);
		sizeService.add(p, sizesList);

		// tạo seo
//		p.setSeo(new Slugify().slugify(p.getTitle() + "-" + System.currentTimeMillis()));

		// lưu vào database
		return super.saveOrUpdate(p);
	}

	public PagerData<Product> search(ProductSearchModel searchModel) {
		String sql = "SELECT * FROM tbl_product p WHERE 1=1";

		if (searchModel != null) {

			// tìm kiếm theo category
			if (searchModel.getBrandId() != null && searchModel.getBrandId() > 0) {
				sql += " and brand_id = " + searchModel.getBrandId();
			}
			// tìm kiếm theo title và description
			if (!StringUtils.isEmpty(searchModel.getKeyword())) {
				sql += " and (p.product_name like '%" + searchModel.getKeyword() + "%'" + " or p.description like '%"
						+ searchModel.getKeyword() + "%')";
			}
		}

		// chi lay san pham chua xoa
//		sql += " and p.status=1 ";

		return getEntitiesByNativeSQL(sql, searchModel.getPage(), 5);
	}

	public PagerData<Product> renderListProd(ProductSearchModel searchModel) {
		// khởi tạo câu lệnh
		String sql = "SELECT * FROM tbl_product p WHERE 1=1";
		if (searchModel != null) {

			// tìm kiếm theo category
			if (searchModel.getBrandId() != null && searchModel.getBrandId() > 0) {
				sql += " and brand_id = " + searchModel.getBrandId();
			}
			int tempID = 0;
			// tìm kiếm theo title và description
			if (!StringUtils.isEmpty(searchModel.getKeyword())) {
				Type searchingType = typeService.getEntityByNativeSQL(
						"SELECT * FROM tbl_type p WHERE type_name = \"" + searchModel.getKeyword() + "\"");

				if (searchingType != null) {
					int typeID = searchingType.getId();
					tempID = typeID;
				}

				sql += " and (p.product_name like '%" + searchModel.getKeyword() + "%'" + " or p.description like '%"
						+ searchModel.getKeyword() + "%' " + " or p.type_id like '%" + tempID + "%')";
			}

			List<Integer> brandsIDList = searchModel.getBrandID_list();
			if (brandsIDList.size() > 0 && brandsIDList != null) {
				sql += " and";
				for (Integer brandID : brandsIDList) {
					sql += " p.brand_id = " + brandID + " or";
				}
				sql = sql.substring(0, sql.length() - 2);
			}
			List<Integer> typesIDList = searchModel.getTypeID_list();
			if (typesIDList != null && typesIDList.size() > 0) {
				sql += " and";
				for (Integer typeID : typesIDList) {
					sql += " p.type_id = " + typeID + " or";
				}
				sql = sql.substring(0, sql.length() - 2);
			}
			List<Integer> colorsIDList = searchModel.getColorsID_list();
			if (colorsIDList != null && colorsIDList.size() > 0) {
				sql += " and";
				for (Integer colorID : colorsIDList) {

					sql += " p.color_id = " + colorID + " or";
				}
				sql = sql.substring(0, sql.length() - 2);
			}
		}

		sql += " and p.status=1 ";
		String orderBy = searchModel.getOrderBy();
		if (orderBy != null) {
			switch (searchModel.getOrderBy()) {
			case "newest":
				sql += " order by created_date desc";
				break;
			case "trending":
				sql += " and p.is_hot = 1";
				break;
			case "increasingPrice":
				sql += " order by price_sale asc";
				break;
			case "decreasingPrice":
				sql += " order by price_sale desc";
				break;
			default:
				break;
			}
		}

		return getEntitiesByNativeSQL(sql, searchModel.getPage(), 9);
	}

}
