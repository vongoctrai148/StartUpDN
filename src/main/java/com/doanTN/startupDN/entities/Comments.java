package com.doanTN.startupDN.entities;


import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "comments")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Comments {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @ManyToOne
    @JoinColumn(name = "userid")
    private Users user;
    @ManyToOne
    @JoinColumn(name = "projectid")
    private Projects project;
    private String binhluan;
    private String liketotal;
    private String postedday;
    @JsonIgnore
    @OneToMany(mappedBy = "comment", fetch = FetchType.LAZY)
    private List<Replies> replies;

    public Comments(Users user, Projects project, String binhluan, String postedday) {
        this.user = user;
        this.project = project;
        this.binhluan = binhluan;
        this.postedday = postedday;
    }
}
