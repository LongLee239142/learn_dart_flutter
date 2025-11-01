package com.example.app_money_manager.security;

import java.util.ArrayList;

import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {
    
    // BCrypt hash của password "758"
    // Generated using: new BCryptPasswordEncoder().encode("758")
    private static final String PASSWORD_HASH = "$2a$10$/ZS37upkrGFhRDv0u9RAq.ounenTsKiKHm1tJT2ul/dmYGHIQvndS";

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        // Kiểm tra user từ database hoặc memory
        // Hiện tại sử dụng hardcoded user
        if ("long_lee".equals(username)) {
            return User.builder()
                    .username("long_lee")
                    .password(PASSWORD_HASH)
                    .authorities(new ArrayList<>())
                    .build();
        }
        throw new UsernameNotFoundException("User not found: " + username);
    }
}
