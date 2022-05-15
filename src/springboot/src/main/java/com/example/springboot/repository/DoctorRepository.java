package com.example.springboot.repository;

import com.example.springboot.domain.Doctor;

import org.springframework.data.jpa.repository.JpaRepository;

public interface DoctorRepository extends JpaRepository<Doctor, String> {

    public Doctor findByDoctorid(String doctorid);

}
