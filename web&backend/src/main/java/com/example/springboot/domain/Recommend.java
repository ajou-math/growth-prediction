package com.example.springboot.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.Data;

@Entity
@Data
public class Recommend {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "recommend_id")
    private int recommendid;
    @Column(name = "recommend_child_id", nullable = true)
    private String recommendchildid;
    @Column(name = "recommend_doctor_id", nullable = true)
    private String recommenddoctorid;
    @Column(name = "recommend_walk", nullable = true)
    private String recommendwalk;
    @Column(name = "recommend_workout", nullable = true)
    private String recommendworkout;
    @Column(name = "recommend_sleep", nullable = true)
    private String recommendsleep;
    @Column(name = "recommend_comment", nullable = true)
    private String recommendcomment;
}
