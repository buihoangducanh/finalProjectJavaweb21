package com.devpro.finalProjectJavaweb21.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.devpro.finalProjectJavaweb21.dto.SaleOrderSearchModel;
import com.devpro.finalProjectJavaweb21.model.SaleOrder;

@Service
public class SaleOrderService extends BaseService<SaleOrder> {

	@Override
	protected Class<SaleOrder> clazz() {
		return SaleOrder.class;
	}

	public List<SaleOrder> getUserSaleOrder(int userId) {

		List<SaleOrder> orderList = getEntitiesByNativeSQL(
				"SELECT * FROM tbl_saleorder p WHERE user_id = " + userId + " order by created_date desc");
		return orderList;
	}

	public PagerData<SaleOrder> searchSaleOrder(SaleOrderSearchModel searchModel) {
		String sql = "SELECT * FROM tbl_saleorder p WHERE 1=1";
		if (searchModel != null) {
			if (searchModel.getType() != null && searchModel.getType() > 0) {
				if (searchModel.getType() == 3) {
					sql += " and cancel_status = true";
				} else if (searchModel.getType() == 2) {
					sql += " and cancel_status = false";
					sql += " and recieved = false";
					sql += " and cancel_request = false";
					sql += " and status = true";
				} else if (searchModel.getType() == 4) {
					sql += " and cancel_request = true";
					sql += " and cancel_status = false";
				} else if (searchModel.getType() == 5) {
					sql += " and recieved = true";
				} else {
					sql += " and cancel_status = false";
					sql += " and recieved = false";
					sql += " and status = false ";
					sql += " and recieved = false";

				}
			}
		}
		sql += "  ORDER BY created_date DESC";
		return getEntitiesByNativeSQL(sql, searchModel.getPage(), 5);
	}
}
