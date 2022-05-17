package com.example.springboot.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Data;

@Entity
@Data
public class Doctor {

    @Id
    @Column(name = "doctor_id")
    private String doctorid;
    @Column(name = "doctor_pw", nullable = true)
    private String doctorpw;
    @Column(name = "doctor_name", nullable = true)
    private String doctorname;
    @Column(name = "doctor_email", nullable = true)
    private String doctoremail;
    @Column(name = "doctor_hospital", nullable = true)
    private String hospital;
    @Column(name = "doctor_phone_number", nullable = true)
    private String doctornumber;
    @Column(name = "role", nullable = true)
    private String role;
}
