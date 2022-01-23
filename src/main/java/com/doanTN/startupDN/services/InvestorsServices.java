package com.doanTN.startupDN.services;

import com.doanTN.startupDN.daos.InvestorsDAO;
import com.doanTN.startupDN.entities.Investors;
import com.doanTN.startupDN.entities.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class InvestorsServices {
    @Autowired
    private InvestorsDAO investorsDAO;

    @Transactional
    public List<Investors> getAllInvestors(){
        return investorsDAO.findAll();
    }

    @Transactional
    public Investors getInvestorsById (Long id){
        return investorsDAO.findById(id).get();
    }

    @Transactional
    public List<Investors> getAllProjectByUsername (String username){
        return investorsDAO.findAllByUsername(username);
    }
    @Transactional
    public Investors saveInvestor (Users user, String investorsname, String abbreviations, String logo, String content, String country, String province, String district, String subdistrict, String houseno, String sdt, String email){
        return investorsDAO.save(new Investors(user, investorsname, abbreviations, logo, content, country, province,
                district, subdistrict, houseno,sdt,email));
    }

    @Transactional
    public void delete(long id){
        investorsDAO.deleteById(id);
    }

    @Transactional
    public Investors updateInvestorWithOutIMG (Long id, String investorsname, String abbreviations, String content, String country, String province, String district, String subdistrict, String houseno, String sdt, String email){
        Investors investors = investorsDAO.findById(id).get();
        investors.setInvestorsname(investorsname);
        investors.setAbbreviations(abbreviations);
        investors.setContent(content);
        investors.setCountry(country);
        investors.setProvince(province);
        investors.setDistrict(district);
        investors.setSubdistrict(subdistrict);
        investors.setHouseno(houseno);
        investors.setSdt(sdt);
        investors.setEmail(email);
        return investorsDAO.save(investors);
    }
    @Transactional
    public Investors updateInvestor (Long id, String investorsname, String abbreviations, String logo, String content, String country, String province, String district, String subdistrict, String houseno, String sdt, String email){
        Investors investors = investorsDAO.findById(id).get();
        investors.setInvestorsname(investorsname);
        investors.setAbbreviations(abbreviations);
        investors.setLogo(logo);
        investors.setContent(content);
        investors.setCountry(country);
        investors.setProvince(province);
        investors.setDistrict(district);
        investors.setSubdistrict(subdistrict);
        investors.setHouseno(houseno);
        investors.setSdt(sdt);
        investors.setEmail(email);
        return investorsDAO.save(investors);
    }
}
