package com.sharkfit.sharkfit.dao;

import com.sharkfit.sharkfit.entity.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.web.bind.annotation.CrossOrigin;

@CrossOrigin("http://localhost:4200") // Accept calls from web browzer script for this origin (Notion Importante)
public interface ProductRepository extends JpaRepository <Product, Long> { //// <Entity, primarykey>

    Page<Product> findByCategoryId(@Param("id") Long id, Pageable pageable);
    Page<Product> findByNameContaining(@Param("name") String name, Pageable pageable);
}
