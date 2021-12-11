package com.doanTN.startupDN.services;

import com.doanTN.startupDN.daos.ImageOfProjectDAO;
import com.doanTN.startupDN.daos.ProjectDAO;
import com.doanTN.startupDN.entities.Categories;
import com.doanTN.startupDN.entities.ImageOfProject;
import com.doanTN.startupDN.entities.Projects;
import com.doanTN.startupDN.entities.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ProjectService {
    @Autowired
    private ProjectDAO projectDAO;
    @Autowired
    private ImageOfProjectDAO imageOfProjectDAO;

    @Transactional
    public List<Projects> getAllProjects(){
        return projectDAO.findAll();
    }

    @Transactional
    public Projects getProjectById(Long id){
        return projectDAO.findById(id).get();
    }
    @Transactional
    public Projects saveProject (Users user, Categories category, String projectName, double amountCalled, String projectDetail,
                             String title, String country, String province, String district, String subDistrict, String houseNo){
        return projectDAO.save(new Projects(user, category, projectName, amountCalled, projectDetail, title, country, province,
                district, subDistrict, houseNo));
    }

    @Transactional
    public Projects updateProject (Long id, Categories category, String projectName, double amountCalled, String projectDetail,
                                 String title, String country, String province, String district, String subDistrict, String houseNo){
        Projects project = projectDAO.findById(id).get();
        project.setCategory(category);
        project.setProjectname(projectName);
        project.setAmountcalled(amountCalled);
        project.setProjectdetail(projectDetail);
        project.setTitle(title);
        project.setCountry(country);
        project.setProvince(province);
        project.setDistrict(district);
        project.setSubdistrict(subDistrict);
        project.setHouseno(houseNo);
        return projectDAO.save(project);
    }

    @Transactional
    public void updateRating(Long id, float totalVoted, int sumVoted){
        Projects project = projectDAO.findById(id).get();
        project.setTotalvoted(totalVoted);
        project.setSumvoted(sumVoted);
        projectDAO.save(project);
    }

    @Transactional
    public List<Projects> getAllProjectByUsername (String username){
        return projectDAO.findAllByUsername(username);
    }

    @Transactional
    public List<ImageOfProject> getAllImageByProjectId (Long id){
        return imageOfProjectDAO.findAllImageByProjectId(id);
    }

    @Transactional
    public void addImageOfProject( Projects project, String fileName){
        imageOfProjectDAO.save(new ImageOfProject(project, fileName));
    }

    @Transactional
    public boolean checkImageExists (String imageName){
        if(imageOfProjectDAO.checkImageNameExists(imageName) > 0){
            return true;
        }else{
            return false;
        }
    }

    @Transactional
    public void deleteImageById (Long id){
        imageOfProjectDAO.deleteById(id);
    }

    @Transactional
    public void deleteImageByName (String imageName){
        imageOfProjectDAO.deleteByImagename(imageName);
    }
}
