package com.rob.onlineshop.dao;

import com.rob.onlineshop.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductRepository extends JpaRepository<Product, Long> {
}
