package com.doanTN.startupDN.entities;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "categories")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Categories {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String categoryName;
    private int sorting;
    private String slug;

    @OneToMany(mappedBy = "category", fetch = FetchType.LAZY)
    private List<Projects> projects;

    @OneToMany(mappedBy = "category", fetch = FetchType.LAZY)
    private List<Blogs> blogs;

    @OneToMany(mappedBy = "category", fetch = FetchType.LAZY)
    private List<EventsReferences> eventsReferences;

    @OneToMany(mappedBy = "category", fetch = FetchType.LAZY)
    private List<News> news;
}
