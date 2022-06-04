package com.example.springboot.config.auth;

import java.util.ArrayList;
import java.util.Collection;

import com.example.springboot.domain.Doctor;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class PrincipleDetails implements UserDetails {

    private Doctor doctor;

    public PrincipleDetails(Doctor doctor) {
        this.doctor = doctor;
    }

    // 해당 유저의 권한 리턴
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        Collection<GrantedAuthority> collect = new ArrayList<>();
        collect.add(
                new GrantedAuthority() {
                    @Override
                    public String getAuthority() {
                        return doctor.getRole();
                    }
                });
        return collect;
    }

    @Override
    public String getPassword() {
        return doctor.getDoctorpw();
    }

    @Override
    public String getUsername() {
        return doctor.getDoctorid();
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }

}
