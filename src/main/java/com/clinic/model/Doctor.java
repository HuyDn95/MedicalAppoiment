package com.clinic.model;

import jakarta.persistence.*;
import lombok.Data;
import java.util.List;

@Entity
@Table(name = "doctors")
@Data
public class Doctor {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, length = 100)
    private String fullName;

    @Column(length = 100)
    private String specialization;

    @Column(unique = true, length = 20)
    private String phoneNumber;

    @Column(unique = true, length = 100)
    private String email;

    @Column(name = "room_number", length = 20)
    private String roomNumber;

    @OneToMany(mappedBy = "doctor", cascade = CascadeType.ALL)
    private List<Appointment> appointments;
}
