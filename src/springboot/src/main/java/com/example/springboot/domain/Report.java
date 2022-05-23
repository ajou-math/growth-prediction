package com.example.springboot.domain;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.Data;

@Entity
@Data
public class Report {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "report_id")
    private int reportid;
    @Column(name = "report_child_id", nullable = true)
    private String reportchildid;
    @Column(name = "report_doctor_id", nullable = true)
    private String reportdoctorid;
    @Column(name = "report_gender", nullable = true)
    private String reportgender;
    @Column(name = "report_born_age", nullable = true)
    private float reportbornage;
    @Column(name = "report_predict_tall", nullable = true)
    private float reportpredicttall;
    @Column(name = "report_date", nullable = true)
    private Timestamp reportdate;
    @Column(name = "report_xray", nullable = true)
    private String reportxray;

}
