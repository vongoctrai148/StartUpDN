package com.doanTN.startupDN.services;

import com.doanTN.startupDN.daos.BlogDAO;
import com.doanTN.startupDN.entities.Blogs;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class BlogServices {
    @Autowired
    private BlogDAO blogDAO;

    @Transactional
    public List<Blogs> getAllBlogs(){
        return blogDAO.findAll();
    }

    @Transactional
    public Blogs getBlogById (Long id){
        return blogDAO.findById(id).get();
    }

    @Transactional
    public void saveBlog(Blogs blogs){
        blogDAO.save(blogs);
    }
    @Transactional
    public void deleteBlog(Long id){
        blogDAO.deleteById(id);
    }
}
