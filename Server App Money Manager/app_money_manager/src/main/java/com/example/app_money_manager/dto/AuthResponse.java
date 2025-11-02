package com.example.app_money_manager.dto;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
public class AuthResponse {
    private String refreshToken;
    private String accessToken;
    private String message;

    public AuthResponse() {}

    public AuthResponse(String token, String message) {
        this.accessToken = token;
        this.message = message;
    }
    
    public AuthResponse(String accessToken, String refreshToken, String message) {
        this.accessToken = accessToken;
        this.refreshToken = refreshToken;
        this.message = message;
    }

}

