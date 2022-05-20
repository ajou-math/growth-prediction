package com.example.springboot.repository;

import com.example.springboot.domain.Report;

import org.springframework.data.jpa.repository.JpaRepository;

public interface ReportRepository extends JpaRepository<Report, Integer> {

}
