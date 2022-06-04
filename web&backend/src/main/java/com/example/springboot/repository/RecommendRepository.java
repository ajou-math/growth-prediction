package com.example.springboot.repository;

import java.util.List;

import com.example.springboot.domain.Recommend;

import org.springframework.data.jpa.repository.JpaRepository;

public interface RecommendRepository extends JpaRepository<Recommend, Integer> {

    public List<Recommend> findAllByRecommendchildid(String recommendid);
}
