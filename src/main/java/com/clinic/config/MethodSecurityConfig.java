package com.clinic.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;

@Configuration
@EnableMethodSecurity(prePostEnabled = true)
public class MethodSecurityConfig {
    // Kích hoạt @PreAuthorize / @PostAuthorize ở tầng Service/Controller
}
