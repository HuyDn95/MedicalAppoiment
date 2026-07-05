package com.clinic.controller;

import com.clinic.dto.AppointmentRequestDTO;
import com.clinic.model.Appointment;
import com.clinic.service.AppointmentService;
import com.clinic.validator.AppointmentValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/appointments")
public class AppointmentController {

    @Autowired
    private AppointmentService appointmentService;

    @Autowired
    private AppointmentValidator appointmentValidator;

    @GetMapping
    public String listAppointments(Model model) {
        List<Appointment> appointments = appointmentService.getAllAppointments();
        model.addAttribute("appointments", appointments);
        return "appointment/list";
    }

    @GetMapping("/new")
    public String showBookingForm(Model model) {
        model.addAttribute("appointmentRequest", new AppointmentRequestDTO());
        return "appointment/form";
    }

    @PostMapping("/book")
    public String bookAppointment(@ModelAttribute("appointmentRequest") AppointmentRequestDTO request,
                                  BindingResult bindingResult, Model model) {
        appointmentValidator.validate(request, bindingResult);
        if (bindingResult.hasErrors()) {
            return "appointment/form";
        }
        appointmentService.bookAppointment(request);
        return "redirect:/appointments";
    }

    @GetMapping("/patient/{patientId}")
    public String getByPatient(@PathVariable Long patientId, Model model) {
        model.addAttribute("appointments", appointmentService.getAppointmentsByPatient(patientId));
        return "appointment/list";
    }

    @PostMapping("/{id}/confirm")
    public String confirm(@PathVariable Long id) {
        appointmentService.confirmAppointment(id);
        return "redirect:/appointments";
    }

    @PostMapping("/{id}/cancel")
    public String cancel(@PathVariable Long id) {
        appointmentService.cancelAppointment(id);
        return "redirect:/appointments";
    }
}
