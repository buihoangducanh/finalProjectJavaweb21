package com.devpro.finalProjectJavaweb21.repository;

import java.math.BigDecimal;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.devpro.finalProjectJavaweb21.model.SaleOrder;

@Repository
public interface SaleOrderRepository extends JpaRepository<SaleOrder, Integer> {
	@Query(value = "SELECT SUM(total) FROM tbl_saleorder  where recieved = true", nativeQuery = true)
	BigDecimal selectTotals();

	@Query(value = "SELECT SUM(total) FROM tbl_saleorder  where recieved = true and created_date < sysdate() && created_date > date_add(sysdate(), interval -24 hour)", nativeQuery = true)
	BigDecimal selectTotalsToday();
}
