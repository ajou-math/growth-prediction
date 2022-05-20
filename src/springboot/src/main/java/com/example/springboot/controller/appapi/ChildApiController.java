package com.example.springboot.controller.appapi;

import java.util.List;

import com.example.springboot.domain.Child;
import com.example.springboot.domain.Privacy;
import com.example.springboot.domain.Recommend;
import com.example.springboot.domain.dto.AppLogin;
import com.example.springboot.repository.ChildRepository;
import com.example.springboot.repository.PrivacyRepository;
import com.example.springboot.repository.RecommendRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestBody;

@RestController
public class ChildApiController {
    @Autowired
    private ChildRepository childRepository;

    @Autowired
    private PrivacyRepository privacyRepository;

    @Autowired
    private RecommendRepository recommendRepository;

    @Autowired
    public BCryptPasswordEncoder bCryptPasswordEncoder;

    @PostMapping("/child-login")
    public String firstlogin(@RequestBody AppLogin appLogin) {

        Child child = new Child();
        child = childRepository.findByChildid(appLogin.getChildid());
        if (child == null) {
            return "iderror";
        }

        if (bCryptPasswordEncoder.matches(child.getChildnumber(), child.getChildpw())) {
            return "changepw";
        } else if (bCryptPasswordEncoder.matches(appLogin.getChildpw(), child.getChildpw())) {
            return "login";
        }

        return "error";
    }

    @PostMapping("/child-changepw")
    public void changepw(@RequestBody AppLogin appLogin) {
        Child child = new Child();
        child = childRepository.findByChildid(appLogin.getChildid());

        String rawPassword = appLogin.getChildpw();
        String encPassword = bCryptPasswordEncoder.encode(rawPassword);
        child.setChildpw(encPassword);
        childRepository.save(child);
    }

    @GetMapping("/child/{childid}")
    public Child child(@PathVariable("childid") String childid) {
        Child child = new Child();
        child = childRepository.findByChildid(childid);
        System.out.println(child);

        return child;
    }

    @GetMapping("/child/{childid}/privacy")
    public List<Privacy> privacy(@PathVariable("childid") String childid) {

        List<Privacy> privacy = privacyRepository.findAllByPrivacychildid(childid);
        System.out.println(privacy);

        return privacy;
    }

    @GetMapping("/child/{childid}/recommend")
    public List<Recommend> recommend(@PathVariable("childid") String childid) {

        List<Recommend> recommend = recommendRepository.findAllByRecommendchildid(childid);
        System.out.println(recommend);

        return recommend;
    }

}
