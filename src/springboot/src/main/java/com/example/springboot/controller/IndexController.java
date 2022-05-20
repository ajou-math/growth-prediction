package com.example.springboot.controller;

import com.example.springboot.domain.Doctor;
//import com.example.springboot.service.DoctorService;
import com.example.springboot.repository.DoctorRepository;

import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.access.annotation.Secured;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class IndexController {

    @Autowired
    private DoctorRepository doctorRepository;

    @Autowired
    public BCryptPasswordEncoder bCryptPasswordEncoder;

    @GetMapping("/")
    public String index() {
        return "index";
    }

    @GetMapping("/sign")
    public String sign() {
        return "signup";
    }

    @PostMapping("/signup")
    public String signup(Model model, Doctor doctor) {

        doctor.setRole("ROLE_NONE");
        String rawPassword = doctor.getDoctorpw();
        String encPassword = bCryptPasswordEncoder.encode(rawPassword);
        doctor.setDoctorpw(encPassword);

        doctorRepository.save(doctor);

        return "redirect:/";
    }

    @RequestMapping(value = "/error/403", method = RequestMethod.GET)
    public String error() {
        return "error/403";
    }

}
