package com.doanTN.startupDN.daos;

import com.doanTN.startupDN.entities.Projects;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ProjectDAO extends JpaRepository<Projects, Long> {
    @Query("SELECT pr FROM Projects pr WHERE pr.user.username = ?1")
    List<Projects> findAllByUsername(String username);

    @Query("SELECT distinct pr FROM Projects pr, InvestedProjects ip WHERE pr.user.username = ?1 AND ip.acceptstatus = ?2 AND pr.aceptedstatus = 1")
    List<Projects> findAllByUsernameAndInvestionStatus(String username, int acceptStatus);

    @Query("select p from Projects p WHERE p.aceptedstatus = ?1 ORDER BY p.totalvoted DESC ")
    List<Projects> getProjectsByTotalvoted(int acceptStatus, Pageable pageable);

    @Query("select count(p) from Projects p")
    int getTotalProducts();

    @Query("select p from Projects p WHERE p.category.id = ?1 AND p.aceptedstatus = ?2 ORDER BY p.totalvoted DESC ")
    List<Projects> getProjectsByCategoryId(Long categoryId, int acceptStatus,Pageable pageable);

    @Query("select count(p) from Projects p WHERE p.category.id = ?1")
    int getTotalProductsByCategoryId(Long categoryId);

    @Query("SELECT p FROM Projects p WHERE p.aceptedstatus = ?1 AND lower( p.projectname) LIKE lower(?2) ORDER BY p.totalvoted DESC")
    List<Projects> searchProjects(int acceptStatus, String projectName, Pageable pageable);
    @Query("SELECT count(p) FROM Projects p WHERE p.aceptedstatus = ?1 AND lower( p.projectname) LIKE lower(?2)")
    int getTotalSearchResult(int acceptedStatus, String projectName);


    //Admin queries
    @Query("select p from Projects p WHERE p.aceptedstatus = 0")
    List<Projects> findProjectsByAceptedstatus();

    @Query("select  p from Projects p, Users u ,InvestedProjects i where u.id = i.id and i.user.id = ?1 ")
    List<Projects> geta(Long userId);
}
