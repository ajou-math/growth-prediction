package com.example.springboot.controller.appapi;

import com.example.springboot.domain.Child;
import com.example.springboot.repository.ChildRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ChildApiController {
    @Autowired
    private ChildRepository childRepository;

    @Autowired
    public BCryptPasswordEncoder bCryptPasswordEncoder;

    @GetMapping("/child/firstlogin")
    public String firstlogin(String childid, String childpw) {

        Child child = new Child();
        child = childRepository.findByChildid(childid);
        if (child == null) {
            return "iderror";
        }

        if (bCryptPasswordEncoder.matches(childpw, child.getChildpw())) {
            return "login";
        }

        return "pwerror";
    }

    @GetMapping("/child/{childid}")
    public Child child(@PathVariable("childid") String childid) {
        Child child = new Child();
        child = childRepository.findByChildid(childid);
        System.out.println(child);

        return child;
    }

}
