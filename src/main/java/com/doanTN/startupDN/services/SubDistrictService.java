package com.doanTN.startupDN.services;

import com.doanTN.startupDN.daos.SubDistrictDAO;
import com.doanTN.startupDN.entities.SubDistricts;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class SubDistrictService {
    @Autowired
    private SubDistrictDAO subDistrictDAO;

    @Transactional
    public List<SubDistricts> getSubDistrictByDistrictId(String districtId){
        return subDistrictDAO.getSubDistrictsByDistrictId(districtId);
    }

    @Transactional
    public String findSubDistrictNameById (String id){
        return subDistrictDAO.findById(id).get().getName();
    }
}
