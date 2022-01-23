package com.doanTN.startupDN.services;

import com.doanTN.startupDN.daos.InvestedProjectsDAO;
import com.doanTN.startupDN.daos.ProjectDAO;
import com.doanTN.startupDN.entities.InvestedProjects;
import com.doanTN.startupDN.entities.Projects;
import com.doanTN.startupDN.entities.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class InvestorsProjectServices {
    @Autowired
    private InvestedProjectsDAO investedProjectsDAO;


    @Transactional
    public void registration(Users users,Projects projects){
        investedProjectsDAO.save(new InvestedProjects(users,projects));
    }
    @Transactional
    public List<InvestedProjects> getAll(){
       return investedProjectsDAO.findAll();
    }
}
