package com.example.app_money_manager.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Service;

import com.example.app_money_manager.dto.AuthResponse;
import com.example.app_money_manager.model.Login;

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

        // Load user và generate JWT tokens
        UserDetails userDetails = userDetailsService.loadUserByUsername(login.getUsername());
        String accessToken = jwtService.generateToken(userDetails);
        String refreshToken = jwtService.generateRefreshToken(userDetails);

        return new AuthResponse(accessToken, refreshToken, "Login success");
    }
    
    public AuthResponse refreshToken(String refreshToken) {
        // Validate refresh token
        if (!jwtService.validateRefreshToken(refreshToken)) {
            throw new RuntimeException("Invalid refresh token");
        }
        
        // Extract username from refresh token
        String username = jwtService.extractUsername(refreshToken);
        UserDetails userDetails = userDetailsService.loadUserByUsername(username);
        
        // Generate new access token và refresh token
        String newAccessToken = jwtService.generateToken(userDetails);
        String newRefreshToken = jwtService.generateRefreshToken(userDetails);
        
        return new AuthResponse(newAccessToken, newRefreshToken, "Token refreshed successfully");
    }
}

