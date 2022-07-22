package com.example.springcvsite.service;

import com.example.springcvsite.model.Person;
import com.example.springcvsite.model.TechnicalSkill;
import com.example.springcvsite.repository.TechnicalSkillRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@AllArgsConstructor
@Service
public class TechnicalSkillService {

    private final TechnicalSkillRepository technicalSkillRepository;

    public TechnicalSkill getById(Long id) {
        return Optional.of(technicalSkillRepository.getById(id)).orElseThrow();
    }

    public List<TechnicalSkill> getAll(Long personId) {
        return technicalSkillRepository.findAllByPerson_PersonId(personId);
    }

    public void create(Person person, TechnicalSkill skill) {
        skill.setPerson(person);
        technicalSkillRepository.save(skill);
    }

    public void edit(TechnicalSkill oldSkill, TechnicalSkill newSkill) {
        TechnicalSkill editedSkill = new TechnicalSkill(
                oldSkill.getSkillId(),
                newSkill.getName(),
                newSkill.getPercentage(),
                oldSkill.getPerson()
        );
        technicalSkillRepository.save(editedSkill);
    }

    public void delete(Long id) {
        technicalSkillRepository.deleteById(id);
    }

}