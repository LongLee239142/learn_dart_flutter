package com.example.app_money_manager.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Service;

import com.example.app_money_manager.dto.AuthResponse;
import com.example.app_money_manager.model.Login;
import com.example.app_money_manager.security.JwtService;

@Service
public class AuthenticationService {

    @Autowired
    private AuthenticationManager authenticationManager;

    @Autowired
    private UserDetailsService userDetailsService;

    @Autowired
    private JwtService jwtService;

    public AuthResponse authenticate(Login login) {
        // Xác thực user bằng Spring Security
        authenticationManager.authenticate(
            new UsernamePasswordAuthenticationToken(
                login.getUsername(),
                login.getPassword()
            )
        );

        // Load user và generate JWT token
        UserDetails userDetails = userDetailsService.loadUserByUsername(login.getUsername());
        String token = jwtService.generateToken(userDetails);

        return new AuthResponse(token, "Login success");
    }
}
