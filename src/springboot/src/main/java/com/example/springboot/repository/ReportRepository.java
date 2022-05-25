package com.example.springboot.repository;

import java.util.List;

import com.example.springboot.domain.Report;

import org.springframework.data.jpa.repository.JpaRepository;

public interface ReportRepository extends JpaRepository<Report, Integer> {
    public List<Report> findAllByReportchildid(String reportchildid);

}
