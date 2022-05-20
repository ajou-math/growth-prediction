package com.example.springboot.controller;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import com.example.springboot.domain.Child;
import com.example.springboot.domain.Privacy;
import com.example.springboot.repository.ChildRepository;
import com.example.springboot.repository.PrivacyRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class MainController {

    @Autowired
    private ChildRepository childRepository;

    @Autowired
    private PrivacyRepository privacyRepository;

    @Autowired
    public BCryptPasswordEncoder bCryptPasswordEncoder;

    @GetMapping("/signin/main")
    public String main(Model model) {
        List<Child> child = childRepository.findAll();
        model.addAttribute("child", child);
        return "signin/main";
    }

    @PostMapping("/signin/client")
    public String signup(Model model,
            String childname, String childnumber,
            String parentname, String parentnumber) {

        Child child = new Child();

        System.out.println("IN signin/client");

        child.setChildname(childname);
        child.setChildnumber(childnumber);
        child.setChildid(childname + childnumber.substring(childnumber.length() - 4, childnumber.length()));
        child.setChildpw(childnumber);
        child.setChildparentname(parentname);
        child.setChildparentnumber(parentnumber);

        java.util.Date date = new Date();
        long time = date.getTime();
        Timestamp ts = new Timestamp(time);
        child.setChildregistrationdate(ts);

        String crawPassword = child.getChildpw();
        String cencPassword = bCryptPasswordEncoder.encode(crawPassword);
        // cencPassword = cencPassword.replace("$2y", "$2a");
        // cencPassword = cencPassword.replace("$2a", "$2y"); 비밀번호 보안 변경
        child.setChildpw(cencPassword);

        childRepository.save(child);

        return "redirect:/signin/main";
    }

    @PostMapping("/signin/result")
    public String result(Model model,
            String privacychildid, String privacygender, String privacybirth, float privacytall, int privacyweight) {

        Privacy privacy = new Privacy();
        privacy.setPrivacychildid(privacychildid);
        privacy.setPrivacygender(privacygender);
        privacy.setPrivacybirth(privacybirth);
        privacy.setPrivacytall(privacytall);
        privacy.setPrivacyweight(privacyweight);
        privacy.setPrivacybornage(0);
        privacy.setPrivacypredicttall(0);

        privacyRepository.save(privacy);

        model.addAttribute("privacy", privacy);
        model.addAttribute("privacychildid", privacychildid);

        return "signin/result";
    }

}
