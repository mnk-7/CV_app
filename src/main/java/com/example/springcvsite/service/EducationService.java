package com.example.springcvsite.service;

import com.example.springcvsite.model.Person;
import com.example.springcvsite.model.Education;
import com.example.springcvsite.repository.EducationRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@AllArgsConstructor
@Service
public class EducationService {

    private final EducationRepository educationRepository;

    public Education getById(Long id) {
        return Optional.of(educationRepository.getById(id)).orElseThrow();
    }

    public List<Education> getAll(Long personId) {
        return educationRepository.findAllByPerson_PersonIdOrderByEduIdDesc(personId);
    }

    public void create(Person person, Education education) {
        education.setPerson(person);
        educationRepository.save(education);
    }

    public void edit(Education oldEducation, Education newEducation) {
        Education editedEducation = new Education(
                oldEducation.getEduId(),
                newEducation.getFieldOfStudy(),
                newEducation.getUniversity(),
                newEducation.getTimeRange(),
                newEducation.getDescription(),
                oldEducation.getPerson());
        educationRepository.save(editedEducation);
    }

    public void delete(Long id) {
        educationRepository.deleteById(id);
    }

}