package com.doanTN.startupDN.daos;

import com.doanTN.startupDN.entities.Projects;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ProjectDAO extends JpaRepository<Projects, Long> {
    @Query("SELECT pr FROM Projects pr WHERE pr.user.username = ?1")
    List<Projects> findAllByUsername(String username);
    @Query("select p from Projects p WHERE p.aceptedstatus = ?1 ORDER BY p.totalvoted DESC ")
    List<Projects> getProjectsByTotalvoted(int acceptStatus,Pageable pageable);
    @Query("select count(p) from Projects p")
    int getTotalProducts();
    @Query("select p from Projects p WHERE p.category.id = ?1 AND p.aceptedstatus = ?2 ORDER BY p.totalvoted DESC ")
    List<Projects> getProjectsByCategoryId(Long categoryId, int acceptStatus,Pageable pageable);
    @Query("select count(p) from Projects p WHERE p.category.id = ?1")
    int getTotalProductsByCategoryId(Long categoryId);
}
