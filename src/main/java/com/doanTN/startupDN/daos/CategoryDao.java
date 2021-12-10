package com.doanTN.startupDN.daos;

import com.doanTN.startupDN.entities.Categories;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CategoryDao extends JpaRepository<Categories,Long> {
}
