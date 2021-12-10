package com.doanTN.startupDN.daos;

import com.doanTN.startupDN.entities.Provinces;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProvinceDAO extends JpaRepository<Provinces, String> {
}
