package com.clinic.repository;

import com.clinic.model.Doctor;
import java.util.List;
import java.util.Optional;

public interface DoctorRepository {
    Doctor save(Doctor doctor);
    Optional<Doctor> findById(Long id);
    List<Doctor> findBySpecialization(String specialization);
    List<Doctor> findAll();
    void deleteById(Long id);
}
