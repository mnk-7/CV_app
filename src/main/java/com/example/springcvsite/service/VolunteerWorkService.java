package com.example.springcvsite.service;

import com.example.springcvsite.model.Person;
import com.example.springcvsite.model.VolunteerWork;
import com.example.springcvsite.repository.VolunteerWorkRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@AllArgsConstructor
@Service
public class VolunteerWorkService {

    private final VolunteerWorkRepository volunteerWorkRepository;

    public VolunteerWork getById(Long id) {
        return Optional.of(volunteerWorkRepository.getById(id)).orElseThrow();
    }

    public List<VolunteerWork> getAll(Long personId) {
        return volunteerWorkRepository.findAllByPerson_PersonIdOrderByVolunteerIdDesc(personId);
    }

    public void create(Person person, VolunteerWork voluntWork) {
        voluntWork.setPerson(person);
        volunteerWorkRepository.save(voluntWork);
    }

    public void edit(VolunteerWork oldVoluntWork, VolunteerWork newVoluntWork) {
        VolunteerWork editedVoluntWork = new VolunteerWork(
                oldVoluntWork.getVolunteerId(),
                newVoluntWork.getPosition(),
                newVoluntWork.getOrganization(),
                newVoluntWork.getTimeRange(),
                newVoluntWork.getDescription(),
                oldVoluntWork.getPerson());
        volunteerWorkRepository.save(editedVoluntWork);
    }

    public void delete(Long id) {
        volunteerWorkRepository.deleteById(id);
    }

}