package com.example.springcvsite.repository;

import com.example.springcvsite.model.WorkExperience;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface WorkExperienceRepository extends JpaRepository<WorkExperience, Long> {

    List<WorkExperience> findAllByPerson_PersonIdOrderByWorkIdDesc(Long personId);

}