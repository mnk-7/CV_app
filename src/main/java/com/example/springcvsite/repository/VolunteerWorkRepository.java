package com.example.springcvsite.repository;

import com.example.springcvsite.model.VolunteerWork;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface VolunteerWorkRepository extends JpaRepository<VolunteerWork, Long> {

    List<VolunteerWork> findAllByPerson_PersonIdOrderByVolunteerIdDesc(Long personId);

}