package com.doanTN.startupDN.daos;

import com.doanTN.startupDN.entities.ImageOfProject;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface ImageOfProjectDAO extends JpaRepository<ImageOfProject,Long> {
    @Query("SELECT img FROM ImageOfProject img WHERE img.project.id = ?1")
    List<ImageOfProject> findAllImageByProjectId(Long id);

    @Query("SELECT count(img) FROM ImageOfProject img where img.imagename = ?1 ")
    int checkImageNameExists(String name);

    @Transactional
    @Modifying
    @Query("DELETE FROM ImageOfProject WHERE imagename = ?1")
    void deleteByImagename(String imageName);
}
