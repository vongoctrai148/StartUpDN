package com.doanTN.startupDN.services;

import com.doanTN.startupDN.daos.InvestedProjectsDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class InvestorsProjectServices {
    @Autowired
    private InvestedProjectsDAO investedProjectsDAO;

//    @Transactional
//    public List<InvestedProjects> getInvestorsprojectByUserId(){
//        return investedProjectsDAO.findInvestedProjectsByUser_Id();
//    }
}
