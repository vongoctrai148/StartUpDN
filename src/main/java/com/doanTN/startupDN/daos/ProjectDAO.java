package com.doanTN.startupDN.daos;

import com.doanTN.startupDN.entities.Projects;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ProjectDAO extends JpaRepository<Projects, Long> {
    @Query("SELECT pr FROM Projects pr WHERE pr.user.username = ?1")
    List<Projects> findAllByUsername(String username);
}
