package com.doanTN.startupDN.daos;

import com.doanTN.startupDN.entities.SubDistricts;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface SubDistrictDAO extends JpaRepository<SubDistricts, String> {
    @Query("SELECT sd FROM SubDistricts sd WHERE sd.district.id = ?1")
    List<SubDistricts> getSubDistrictsByDistrictId(String districtId);
}
