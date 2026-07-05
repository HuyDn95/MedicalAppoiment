package com.clinic.service;

import com.clinic.dto.AppointmentRequestDTO;
import com.clinic.model.Appointment;
import java.util.List;

public interface AppointmentService {
    Appointment bookAppointment(AppointmentRequestDTO request);
    List<Appointment> getAppointmentsByPatient(Long patientId);
    Appointment cancelAppointment(Long appointmentId);
    Appointment confirmAppointment(Long appointmentId);
    List<Appointment> getAllAppointments();
}
