package com.example.springcvsite.repository;

import com.example.springcvsite.model.TechnicalSkill;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TechnicalSkillRepository extends JpaRepository<TechnicalSkill, Long> {

    List<TechnicalSkill> findAllByPerson_PersonId(Long personId);

}