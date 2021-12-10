package com.doanTN.startupDN.daos;

import com.doanTN.startupDN.entities.InvestedProjects;
import org.springframework.data.jpa.repository.JpaRepository;

public interface InvestedProjectsDAO extends JpaRepository<InvestedProjects,Long> {
}
