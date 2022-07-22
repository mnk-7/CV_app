package com.example.springcvsite.repository;

import com.example.springcvsite.model.LanguageSkill;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface LanguageSkillRepository extends JpaRepository<LanguageSkill, Long> {

    List<LanguageSkill> findAllByPerson_PersonId(Long personId);

}