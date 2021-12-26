package com.doanTN.startupDN.services;

import com.doanTN.startupDN.daos.CommentsDAO;
import com.doanTN.startupDN.daos.ImageOfProjectDAO;
import com.doanTN.startupDN.daos.ProjectDAO;
import com.doanTN.startupDN.entities.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
public class ProjectService {
    @Autowired
    private ProjectDAO projectDAO;
    @Autowired
    private ImageOfProjectDAO imageOfProjectDAO;
    @Autowired
    private CommentsDAO commentsDAO;

    @Transactional
    public List<Projects> getAllProjects(int acceptStatus,Pageable pageable){
        return projectDAO.getProjectsByTotalvoted(acceptStatus, pageable);
    }
    @Transactional
    public List<Projects> getProjectsByCategoryId(Long categoryId, int acceptStatus,Pageable pageable){
        return projectDAO.getProjectsByCategoryId(categoryId, acceptStatus, pageable);
    }

    @Transactional
    public Projects getProjectById(Long id){
        return projectDAO.findById(id).get();
    }

    @Transactional
    public Projects saveProject (Users user, Categories category, String projectName, double amountCalled, String projectDetail,
                             String title, String country, String province, String district, String subDistrict, String houseNo, Date postedDay){
        return projectDAO.save(new Projects(user, category, projectName, amountCalled, projectDetail, title, country, province,
                district, subDistrict, houseNo, postedDay));
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
    public int getTotalProject(){
        return projectDAO.getTotalProducts();
    }@Transactional
    public int getTotalProjectByCategoryId(Long categoryId){
        return projectDAO.getTotalProductsByCategoryId(categoryId);
    }

    @Transactional
    public List<Projects> getAllProjectByUsername (String username){
        return projectDAO.findAllByUsername(username);
    }


    //Image of project
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
    public List<ImageOfProject> getAllImageByUsername (String username){
        return imageOfProjectDAO.getALlImageByUserName(username);
    }

    @Transactional
    public void deleteImageById (Long id){
        imageOfProjectDAO.deleteById(id);
    }

    @Transactional
    public void deleteImageByName (String imageName){
        imageOfProjectDAO.deleteByImagename(imageName);
    }

    //Comments
    @Transactional
    public void addComment(Users user, Projects project, String comment, Date postedDay){
        commentsDAO.save(new Comments(user, project, comment, postedDay));
    }
    @Transactional
    public List<Comments> getAllCommentByProjectId (Long id){
        return commentsDAO.findAllByProjectId(id);
    }


}
