package com.example.springboot.repository;

import com.example.springboot.domain.Image;

import org.springframework.data.jpa.repository.JpaRepository;

public interface ImageRepository extends JpaRepository<Image, String> {

    public String findByFilename(String filename);

}
