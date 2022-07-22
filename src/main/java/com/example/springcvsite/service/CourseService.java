package com.example.springcvsite.service;

import com.example.springcvsite.model.Person;
import com.example.springcvsite.model.Course;
import com.example.springcvsite.repository.CourseRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@AllArgsConstructor
@Service
public class CourseService {

    private final CourseRepository courseRepository;

    public Course getById(Long id) {
        return Optional.of(courseRepository.getById(id)).orElseThrow();
    }

    public List<Course> getAll(Long personId) {
        return courseRepository.findAllByPerson_PersonIdOrderByCourseIdDesc(personId);
    }

    public void create(Person person, Course course) {
        course.setPerson(person);
        courseRepository.save(course);
    }

    public void edit(Course oldCourse, Course newCourse) {
        Course editedCourse = new Course(
                oldCourse.getCourseId(),
                newCourse.getName(),
                newCourse.getTimeRange(),
                newCourse.getOrganization(),
                newCourse.getDescription(),
                oldCourse.getPerson());
        courseRepository.save(editedCourse);
    }

    public void delete(Long id) {
        courseRepository.deleteById(id);
    }

}