package com.example.springboot.config.auth;

import com.example.springboot.domain.Doctor;
import com.example.springboot.repository.DoctorRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

//loginProcessingUrl 이 요청되면 여기로 옴

@Service
public class PrincipleDetailsService implements UserDetailsService {

    @Autowired
    private DoctorRepository doctorRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        Doctor doctorEntity = doctorRepository.findByDoctorid(username);

        if (doctorEntity != null) {
            return new PrincipleDetails(doctorEntity);
        }
        return null;
    }

}
