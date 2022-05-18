package com.example.springboot.domain;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Data;

@Entity
@Data
public class Child {

    @Id
    @Column(name = "child_id")
    private String childid;
    @Column(name = "child_pw", nullable = true)
    private String childpw;
    @Column(name = "child_name", nullable = true)
    private String childname;
    @Column(name = "child_email", nullable = true)
    private String childemail;
    @Column(name = "child_phone_number", nullable = true)
    private String childnumber;
    @Column(name = "child_registration_date", nullable = true)
    private Timestamp childregistrationdate;
    @Column(name = "child_parent_name", nullable = true)
    private String childparentname;
    @Column(name = "child_parent_phone_number", nullable = true)
    private String childparentnumber;

}
