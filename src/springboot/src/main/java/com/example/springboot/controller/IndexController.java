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

@Controller
public class IndexController {

    @Autowired
    private DoctorRepository doctorRepository;

    @Autowired
    public BCryptPasswordEncoder bCryptPasswordEncoder;

    @GetMapping({ "", "/" })
    public String index() {
        return "index";
    }

    @GetMapping("/sign")
    public String sign() {
        return "signup";
    }

    @PostMapping("/signup")
    public String signup(Model model, Doctor doctor) {

        doctor.setRole("D");
        String rawPassword = doctor.getDoctorpw();
        String encPassword = bCryptPasswordEncoder.encode(rawPassword);
        doctor.setDoctorpw(encPassword);

        doctorRepository.save(doctor);

        return "redirect:/";
    }

    @GetMapping("/signin/main")
    public String main() {

        return "signin/main";
    }
}
