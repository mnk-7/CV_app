package com.example.springcvsite.repository;

import com.example.springcvsite.model.Course;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CourseRepository extends JpaRepository<Course, Long> {

    List<Course> findAllByPerson_PersonIdOrderByCourseIdDesc(Long personId);

}