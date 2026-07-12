package com.clinic.config;

import com.clinic.security.CustomUserDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;

@Configuration
@EnableWebSecurity
@ComponentScan(basePackages = "com.clinic.security")
public class SecurityConfig {

    @Autowired
    private CustomUserDetailsService userDetailsService;

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public DaoAuthenticationProvider authenticationProvider() {
        DaoAuthenticationProvider provider = new DaoAuthenticationProvider();
        provider.setUserDetailsService(userDetailsService);
        provider.setPasswordEncoder(passwordEncoder());
        return provider;
    }

    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration config) throws Exception {
        return config.getAuthenticationManager();
    }

    @Bean
    public AccessDeniedHandler accessDeniedHandler() {
        return (request, response, ex) -> response.sendRedirect(request.getContextPath() + "/access-denied");
    }

    /**
     * Ma trận phân quyền (Authorization Matrix):
     *
     * | Chức năng                     | ADMIN | DOCTOR | RECEPTIONIST |
     * |--------------------------------|-------|--------|--------------|
     * | Xem trang chủ / login / register | x     | x      | x            |
     * | Xem danh sách bác sĩ            | x     | x      | x            |
     * | Thêm / sửa / xóa bác sĩ         | x     |        |              |
     * | Xem danh sách bệnh nhân         | x     | x      | x            |
     * | Thêm / sửa bệnh nhân            | x     |        | x            |
     * | Đặt lịch khám                   | x     |        | x            |
     * | Xác nhận / hủy lịch hẹn         | x     | x      |              |
     * | Quản lý tài khoản người dùng    | x     |        |              |
     */
    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
                .authorizeHttpRequests(auth -> auth
                        .requestMatchers("/", "/css/**", "/js/**", "/images/**", "/register", "/login", "/access-denied").permitAll()

                        // Quản lý bác sĩ: chỉ ADMIN được thêm/sửa/xóa
                        .requestMatchers("/doctors/new", "/doctors/save", "/doctors/delete/**", "/doctors/edit/**").hasRole("ADMIN")
                        .requestMatchers("/doctors", "/doctors/**").hasAnyRole("ADMIN", "DOCTOR", "RECEPTIONIST")

                        // Quản lý bệnh nhân: ADMIN và RECEPTIONIST được thêm/sửa
                        .requestMatchers("/patients/new", "/patients/save").hasAnyRole("ADMIN", "RECEPTIONIST")
                        .requestMatchers("/patients", "/patients/**").hasAnyRole("ADMIN", "DOCTOR", "RECEPTIONIST")

                        // Đặt lịch khám: ADMIN và RECEPTIONIST
                        .requestMatchers("/appointments/new", "/appointments/book").hasAnyRole("ADMIN", "RECEPTIONIST")
                        // Xác nhận / hủy lịch: ADMIN và DOCTOR
                        .requestMatchers("/appointments/*/confirm", "/appointments/*/cancel").hasAnyRole("ADMIN", "DOCTOR")
                        // Xem danh sách lịch hẹn: tất cả role đã đăng nhập
                        .requestMatchers("/appointments", "/appointments/**").hasAnyRole("ADMIN", "DOCTOR", "RECEPTIONIST")

                        // Quản lý người dùng: chỉ ADMIN
                        .requestMatchers("/users/**").hasRole("ADMIN")

                        .anyRequest().authenticated()
                )
                .formLogin(form -> form
                        .loginPage("/login")
                        .loginProcessingUrl("/login")
                        .defaultSuccessUrl("/appointments", true)
                        .failureUrl("/login?error=true")
                        .permitAll()
                )
                .logout(logout -> logout
                        .logoutUrl("/logout")
                        .logoutSuccessUrl("/login?logout=true")
                        .permitAll()
                )
                .exceptionHandling(ex -> ex.accessDeniedHandler(accessDeniedHandler()));
        return http.build();
    }
}
