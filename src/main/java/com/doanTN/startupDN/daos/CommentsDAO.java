package com.doanTN.startupDN.daos;

import com.doanTN.startupDN.entities.Comments;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CommentsDAO extends JpaRepository<Comments, Long> {
}
