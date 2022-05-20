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
public class Privacy {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "privacy_id")
    private int privacyid;
    @Column(name = "privacy_child_id", nullable = true)
    private String privacychildid;
    @Column(name = "privacy_gender", nullable = true)
    private String privacygender;
    @Column(name = "privacy_birth", nullable = true)
    private String privacybirth; // 19980921
    @Column(name = "privacy_tall", nullable = true)
    private float privacytall;
    @Column(name = "privacy_weight", nullable = true)
    private float privacyweight;
    @Column(name = "privacy_born_age", nullable = true)
    private float privacybornage;
    @Column(name = "privacy_predict_tall", nullable = true)
    private float privacypredicttall;
    @Column(name = "privacy_enterday", nullable = true)
    private Timestamp privacyenterday;

}
