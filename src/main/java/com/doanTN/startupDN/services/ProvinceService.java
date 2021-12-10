package com.doanTN.startupDN.services;

import com.doanTN.startupDN.daos.ProvinceDAO;
import com.doanTN.startupDN.entities.Provinces;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ProvinceService {

    @Autowired
    private ProvinceDAO provinceDAO;

    @Transactional
    public List<Provinces> getAllProvinces(){
        return provinceDAO.findAll();
    }

    @Transactional
    public String findProvinceNameById (String id){
        return provinceDAO.findById(id).get().getName();
    }
}
