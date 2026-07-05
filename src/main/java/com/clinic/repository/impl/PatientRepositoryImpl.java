package com.clinic.repository.impl;

import com.clinic.model.Patient;
import com.clinic.repository.PatientRepository;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public class PatientRepositoryImpl implements PatientRepository {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public Patient save(Patient patient) {
        sessionFactory.getCurrentSession().saveOrUpdate(patient);
        return patient;
    }

    @Override
    public Optional<Patient> findById(Long id) {
        return Optional.ofNullable(sessionFactory.getCurrentSession().get(Patient.class, id));
    }

    @Override
    public Optional<Patient> findByPhoneNumber(String phoneNumber) {
        List<Patient> results = sessionFactory.getCurrentSession()
                .createQuery("FROM Patient WHERE phoneNumber = :phone", Patient.class)
                .setParameter("phone", phoneNumber)
                .list();
        return results.isEmpty() ? Optional.empty() : Optional.of(results.get(0));
    }

    @Override
    public List<Patient> findAll() {
        return sessionFactory.getCurrentSession()
                .createQuery("FROM Patient", Patient.class)
                .list();
    }

    @Override
    public void deleteById(Long id) {
        findById(id).ifPresent(p -> sessionFactory.getCurrentSession().delete(p));
    }
}
