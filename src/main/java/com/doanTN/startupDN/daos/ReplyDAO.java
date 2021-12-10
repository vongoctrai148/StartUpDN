package com.doanTN.startupDN.daos;

import com.doanTN.startupDN.entities.Replies;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ReplyDAO  extends JpaRepository<Replies,Long> {
}
