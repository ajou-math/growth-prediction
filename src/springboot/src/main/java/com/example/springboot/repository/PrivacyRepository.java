package com.example.springboot.repository;

import java.util.List;

import com.example.springboot.domain.Privacy;

import org.springframework.data.jpa.repository.JpaRepository;

public interface PrivacyRepository extends JpaRepository<Privacy, Integer> {

    public List<Privacy> findAllByPrivacychildid(String privacychildid);

    public Privacy findByPrivacychildid(String privacychildid);
}
