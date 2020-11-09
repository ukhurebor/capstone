package com.claim.FinalCapstone.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.claim.FinalCapstone.model.Products;



public interface ProductRepository extends JpaRepository<Products, Long> {

	
}

