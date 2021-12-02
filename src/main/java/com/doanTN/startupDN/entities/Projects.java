package com.doanTN.startupDN.entities;

import lombok.*;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "project")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Projects {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @ManyToOne
    @JoinColumn(name = "userid")
    private Users user;
    @ManyToOne
    @JoinColumn(name = "categoryid")
    private Categories category;
    private String projectName;
    private double amountCalled;
    private String projectDetail;
    private String title;
    private String country;
    private String district;
    private String subDistrict;
    private String houseNo;
    private String totalVoted;
    private int acepedStatus;

    @OneToMany(mappedBy = "project", fetch = FetchType.EAGER)
    private List<Comments> comments;

    @OneToOne(mappedBy = "project", fetch = FetchType.EAGER)
    private InvestedProjects investedProject;

    @OneToMany(mappedBy = "project", fetch = FetchType.EAGER)
    private List<ImageOfProject> imageOfProjects;

}
