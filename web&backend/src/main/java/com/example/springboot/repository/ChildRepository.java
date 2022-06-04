package com.example.springboot.repository;

import com.example.springboot.domain.Child;

import org.springframework.data.jpa.repository.JpaRepository;

public interface ChildRepository extends JpaRepository<Child, String> {

    public Child findByChildid(String childid);

    public Child findAllByChildid(String childid);

}
