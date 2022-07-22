package com.example.springcvsite.service;

import com.example.springcvsite.model.LanguageSkill;
import com.example.springcvsite.model.Person;
import com.example.springcvsite.repository.LanguageSkillRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@AllArgsConstructor
@Service
public class LanguageSkillService {

    private final LanguageSkillRepository languageSkillRepository;

    public LanguageSkill getById(Long id) {
        return Optional.of(languageSkillRepository.getById(id)).orElseThrow();
    }

    public List<LanguageSkill> getAll(Long personId) {
        return languageSkillRepository.findAllByPerson_PersonId(personId);
    }

    public void create(Person person, LanguageSkill skill) {
        Integer percentage = determinePercentage(skill);
        skill.setPercentage(percentage);
        skill.setPerson(person);
        languageSkillRepository.save(skill);
    }

    public void edit(LanguageSkill oldSkill, LanguageSkill newSkill) {
        Integer percentage = determinePercentage(newSkill);
        LanguageSkill editedSkill = new LanguageSkill(
                oldSkill.getSkillId(),
                newSkill.getName(),
                percentage,
                oldSkill.getPerson(),
                newSkill.getLevelLabel()
        );
        languageSkillRepository.save(editedSkill);
    }

    public void delete(Long id) {
        languageSkillRepository.deleteById(id);
    }

    private Integer determinePercentage(LanguageSkill skill) {
        switch (skill.getLevelLabel()) {
            case "A1":
                return 15;
            case "A2":
                return 30;
            case "B1":
                return 45;
            case "B2":
                return 65;
            case "C1":
                return 80;
            case "C2":
                return 95;
            case "native":
                return 100;
            default:
                return 0;
        }
    }

}