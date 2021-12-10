package com.doanTN.startupDN.forms;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ProjectForm {
    private Long id;
    private String userId;
    private Long categoryId;
    private String projectname;
    private double amountcalled;
    private String projectdetail;
    private String title;
    private String country;
    private String province;
    private String district;
    private String subdistrict;
    private String houseno;

    public ProjectForm(Long id, Long categoryId, String projectname, double amountcalled,
                       String projectdetail, String title, String country, String province,
                       String district, String subdistrict, String houseno) {
        this.id = id;
        this.categoryId = categoryId;
        this.projectname = projectname;
        this.amountcalled = amountcalled;
        this.projectdetail = projectdetail;
        this.title = title;
        this.country = country;
        this.province = province;
        this.district = district;
        this.subdistrict = subdistrict;
        this.houseno = houseno;
    }
}
