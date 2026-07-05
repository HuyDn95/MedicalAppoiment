package com.clinic.repository;

import com.clinic.model.Patient;
import java.util.List;
import java.util.Optional;

public interface PatientRepository {
    Patient save(Patient patient);
    Optional<Patient> findById(Long id);
    Optional<Patient> findByPhoneNumber(String phoneNumber);
    List<Patient> findAll();
    void deleteById(Long id);
}
