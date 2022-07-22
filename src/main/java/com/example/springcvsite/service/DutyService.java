package com.example.springcvsite.service;

import com.example.springcvsite.model.Duty;
import com.example.springcvsite.model.WorkExperience;
import com.example.springcvsite.repository.DutyRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Optional;

@AllArgsConstructor
@Service
public class DutyService {

    private final DutyRepository dutyRepository;

    public Duty getById(Long id) {
        return Optional.of(dutyRepository.getById(id)).orElseThrow();
    }

    public void create(WorkExperience work, Duty duty) {
        duty.setWorkExperience(work);
        dutyRepository.save(duty);
    }

    public void edit(Duty oldDuty, Duty newDuty) {
        Duty editedDuty = new Duty(
                oldDuty.getDutyId(),
                newDuty.getDescription(),
                oldDuty.getWorkExperience());
        dutyRepository.save(editedDuty);
    }

    public void delete(Long id) {
        dutyRepository.deleteById(id);
    }

}