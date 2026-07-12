package com.clinic.service;

import com.clinic.dto.RegisterRequestDTO;
import com.clinic.model.User;

public interface UserService {
    User registerUser(RegisterRequestDTO request);
    User findByUsername(String username);
}
