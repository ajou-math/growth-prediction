package com.example.springboot.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Lob;

import lombok.Data;

@Entity
@Data
public class Image {
    @Id
    @Column(name = "filename", nullable = true)
    private String filename;
    @Lob
    @Column(name = "image", nullable = true)
    private String image;
}
