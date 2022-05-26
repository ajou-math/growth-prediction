package com.example.springboot.controller.appapi;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class Callpy {
    @PostMapping("/tospring/{filename}/{male}/{height}")
    public void Callpython(@PathVariable("filename") String filename, @PathVariable("height") String male,
            @PathVariable("height") String height) {
        String url = "http://127.0.0.1:5000/tospring/" + filename + "/" + male + "/" + height;
        System.out.println(url);

    }

}