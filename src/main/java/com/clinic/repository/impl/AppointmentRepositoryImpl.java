package com.clinic.repository.impl;

import com.clinic.model.Appointment;
import com.clinic.repository.AppointmentRepository;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Repository
public class AppointmentRepositoryImpl implements AppointmentRepository {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public Appointment save(Appointment appointment) {
        sessionFactory.getCurrentSession().saveOrUpdate(appointment);
        return appointment;
    }

    @Override
    public Optional<Appointment> findById(Long id) {
        return Optional.ofNullable(sessionFactory.getCurrentSession().get(Appointment.class, id));
    }

    @Override
    public List<Appointment> findByPatientId(Long patientId) {
        return sessionFactory.getCurrentSession()
                .createQuery("FROM Appointment WHERE patient.id = :pid", Appointment.class)
                .setParameter("pid", patientId)
                .list();
    }

    @Override
    public List<Appointment> findByDoctorIdAndTimeBetween(Long doctorId, LocalDateTime start, LocalDateTime end) {
        return sessionFactory.getCurrentSession()
                .createQuery("FROM Appointment WHERE doctor.id = :did AND appointmentTime BETWEEN :start AND :end",
                        Appointment.class)
                .setParameter("did", doctorId)
                .setParameter("start", start)
                .setParameter("end", end)
                .list();
    }

    @Override
    public List<Appointment> findAll() {
        return sessionFactory.getCurrentSession()
                .createQuery("FROM Appointment", Appointment.class)
                .list();
    }
}
