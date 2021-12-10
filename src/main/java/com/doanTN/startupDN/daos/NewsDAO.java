package com.doanTN.startupDN.daos;

import com.doanTN.startupDN.entities.News;
import org.springframework.data.jpa.repository.JpaRepository;

public interface NewsDAO extends JpaRepository<News,Long> {
}
