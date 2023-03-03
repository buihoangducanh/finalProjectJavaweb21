package com.devpro.finalProjectJavaweb21.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.devpro.finalProjectJavaweb21.model.SaleOrderProduct;

@Repository
public interface SaleOrderProductRepository extends JpaRepository<SaleOrderProduct, Integer> {

}
