package com.clinic.validator;

import com.clinic.dto.AppointmentRequestDTO;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import java.time.LocalDateTime;

@Component
public class AppointmentValidator implements Validator {

    @Override
    public boolean supports(Class<?> clazz) {
        return AppointmentRequestDTO.class.isAssignableFrom(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        AppointmentRequestDTO dto = (AppointmentRequestDTO) target;

        if (dto.getPatientId() == null) {
            errors.rejectValue("patientId", "field.required", "Patient ID không được để trống");
        }
        if (dto.getDoctorId() == null) {
            errors.rejectValue("doctorId", "field.required", "Doctor ID không được để trống");
        }
        if (dto.getAppointmentTime() == null) {
            errors.rejectValue("appointmentTime", "field.required", "Thời gian khám không được để trống");
        } else if (dto.getAppointmentTime().isBefore(LocalDateTime.now())) {
            errors.rejectValue("appointmentTime", "field.invalid", "Thời gian khám phải ở tương lai");
        }
    }
}
