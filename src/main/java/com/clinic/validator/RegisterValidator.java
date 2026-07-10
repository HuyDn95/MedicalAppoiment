package com.clinic.validator;

import com.clinic.dto.RegisterRequestDTO;
import com.clinic.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Component
public class RegisterValidator implements Validator {

    @Autowired
    private UserRepository userRepository;

    @Override
    public boolean supports(Class<?> clazz) {
        return RegisterRequestDTO.class.isAssignableFrom(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        RegisterRequestDTO dto = (RegisterRequestDTO) target;

        if (dto.getUsername() == null || dto.getUsername().trim().isEmpty()) {
            errors.rejectValue("username", "field.required", "Tên đăng nhập không được để trống");
        } else if (userRepository.existsByUsername(dto.getUsername())) {
            errors.rejectValue("username", "field.duplicate", "Tên đăng nhập đã tồn tại");
        }

        if (dto.getPassword() == null || dto.getPassword().length() < 6) {
            errors.rejectValue("password", "field.invalid", "Mật khẩu phải có ít nhất 6 ký tự");
        }

        if (dto.getConfirmPassword() == null || !dto.getConfirmPassword().equals(dto.getPassword())) {
            errors.rejectValue("confirmPassword", "field.mismatch", "Mật khẩu xác nhận không khớp");
        }

        if (dto.getFullName() == null || dto.getFullName().trim().isEmpty()) {
            errors.rejectValue("fullName", "field.required", "Họ tên không được để trống");
        }
    }
}
