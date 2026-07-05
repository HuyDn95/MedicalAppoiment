package com.clinic.repository.impl;

import com.clinic.model.Doctor;
import com.clinic.repository.DoctorRepository;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public class DoctorRepositoryImpl implements DoctorRepository {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public Doctor save(Doctor doctor) {
        sessionFactory.getCurrentSession().saveOrUpdate(doctor);
        return doctor;
    }

    @Override
    public Optional<Doctor> findById(Long id) {
        return Optional.ofNullable(sessionFactory.getCurrentSession().get(Doctor.class, id));
    }

    @Override
    public List<Doctor> findBySpecialization(String specialization) {
        return sessionFactory.getCurrentSession()
                .createQuery("FROM Doctor WHERE specialization LIKE :spec", Doctor.class)
                .setParameter("spec", "%" + specialization + "%")
                .list();
    }

    @Override
    public List<Doctor> findAll() {
        return sessionFactory.getCurrentSession()
                .createQuery("FROM Doctor", Doctor.class)
                .list();
    }

    @Override
    public void deleteById(Long id) {
        findById(id).ifPresent(d -> sessionFactory.getCurrentSession().delete(d));
    }
}
