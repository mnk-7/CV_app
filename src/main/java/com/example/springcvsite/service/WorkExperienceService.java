package com.example.springcvsite.service;

import com.example.springcvsite.model.Person;
import com.example.springcvsite.model.Duty;
import com.example.springcvsite.model.WorkExperience;
import com.example.springcvsite.repository.WorkExperienceRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@AllArgsConstructor
@Service
public class WorkExperienceService {

    private final WorkExperienceRepository workExperienceRepository;

    public WorkExperience getById(Long id) {
        return Optional.of(workExperienceRepository.getById(id)).orElseThrow();
    }

    public List<WorkExperience> getAll(Long personId) {
        return workExperienceRepository.findAllByPerson_PersonIdOrderByWorkIdDesc(personId);
    }

    public Long create(Person person, WorkExperience work) {
        work.setPerson(person);
        workExperienceRepository.save(work);
        return work.getWorkId();
    }

    public void edit(WorkExperience oldWork, WorkExperience newWork) {
        WorkExperience editedWorkExperience = new WorkExperience(
                oldWork.getWorkId(),
                newWork.getPosition(),
                newWork.getCompany(),
                newWork.getTimeRange(),
                oldWork.getDuties(),
                oldWork.getPerson());
        workExperienceRepository.save(editedWorkExperience);
    }

    public void delete(Long id) {
        workExperienceRepository.deleteById(id);
    }

    public Duty getDutyById(WorkExperience work, Long dutyId) {
        return work.getDuties().stream()
                .filter((duty) -> duty.getDutyId().equals(dutyId))
                .findFirst()
                .orElseThrow();
    }

    public void deleteDuty(Long id, Duty duty) {
        WorkExperience work = getById(id);
        work.getDuties().remove(duty);
    }

}