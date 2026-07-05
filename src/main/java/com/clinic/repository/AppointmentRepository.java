package com.clinic.repository;

import com.clinic.model.Appointment;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

public interface AppointmentRepository {
    Appointment save(Appointment appointment);
    Optional<Appointment> findById(Long id);
    List<Appointment> findByPatientId(Long patientId);
    List<Appointment> findByDoctorIdAndTimeBetween(Long doctorId, LocalDateTime start, LocalDateTime end);
    List<Appointment> findAll();
}
