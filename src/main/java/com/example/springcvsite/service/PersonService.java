package com.example.springcvsite.service;

import com.example.springcvsite.model.LanguageSkill;
import com.example.springcvsite.model.Person;
import com.example.springcvsite.model.TechnicalSkill;
import com.example.springcvsite.model.Course;
import com.example.springcvsite.model.Education;
import com.example.springcvsite.model.VolunteerWork;
import com.example.springcvsite.model.WorkExperience;
import com.example.springcvsite.repository.PersonRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.*;

@AllArgsConstructor
@Service
public class PersonService {

    private final PersonRepository personRepository;

    public Person getById(Long id) {
        return Optional.of(personRepository.getById(id)).orElseThrow();
    }

    private List<Person> getAll() {
        return personRepository.findAll();
    }

    public Map<Person, String> getAllWithEncodedPhotos() {
        List<Person> people = getAll();
        people.sort(Comparator.comparing(Person::getPersonId));
        Map<Person, String> profiles = new LinkedHashMap<>();
        for (Person person : people) {
            String photo = getEncodedPhoto(person);
            profiles.put(person, photo);
        }
        return profiles;
    }

    public void create(Person person, MultipartFile imagePhoto, MultipartFile imageBackground) throws IOException {
        byte[] photo = imagePhoto.getBytes();
        byte[] background = imageBackground.getBytes();
        person.setPhoto(photo);
        person.setBackground(background);
        personRepository.save(person);
    }

    private void edit(Person oldPerson, Person newPerson) {
        Person editedPerson = new Person(
                oldPerson.getPersonId(),
                newPerson.getFirstName(),
                newPerson.getLastName(),
                newPerson.getJobTitle(),
                newPerson.getShortDescription(),
                newPerson.getLongDescription(),
                oldPerson.getPhoto(),
                oldPerson.getBackground(),
                oldPerson.getContact(),
                oldPerson.getTechnicalSkills(),
                oldPerson.getLanguageSkills(),
                oldPerson.getEducation(),
                oldPerson.getCourses(),
                oldPerson.getVolunteerWork(),
                oldPerson.getWorkExperience());
        personRepository.save(editedPerson);
    }

    public void editWithImages(Person oldPerson, Person newPerson, MultipartFile imagePhoto, MultipartFile imageBackground) throws IOException {
        byte[] photo = imagePhoto.getBytes();
        if (photo.length > 0) {
            oldPerson.setPhoto(photo);
        }
        byte[] background = imageBackground.getBytes();
        if (background.length > 0) {
            oldPerson.setBackground(background);
        }
        edit(oldPerson, newPerson);
    }

    public String getEncodedPhoto(Person person) {
        byte[] encodeBase64 = Base64.getEncoder().encode(person.getPhoto());
        return new String(encodeBase64, StandardCharsets.UTF_8);
    }

    public String getEncodedBackground(Person person) {
        byte[] encodeBase64 = Base64.getEncoder().encode(person.getBackground());
        return new String(encodeBase64, StandardCharsets.UTF_8);
    }

    public TechnicalSkill getTechSkillById(Person person, Long techId) {
        return person.getTechnicalSkills().stream()
                .filter((tech) -> tech.getSkillId().equals(techId))
                .findFirst()
                .orElseThrow();
    }

    public LanguageSkill getLangSkillById(Person person, Long langId) {
        return person.getLanguageSkills().stream()
                .filter((lang) -> lang.getSkillId().equals(langId))
                .findFirst()
                .orElseThrow();
    }

    public Education getEducationById(Person person, Long eduId) {
        return person.getEducation().stream()
                .filter((edu) -> edu.getEduId().equals(eduId))
                .findFirst()
                .orElseThrow();
    }

    public Course getCourseById(Person person, Long courseId) {
        return person.getCourses().stream()
                .filter((course) -> course.getCourseId().equals(courseId))
                .findFirst()
                .orElseThrow();
    }

    public VolunteerWork getVoluntWorkById(Person person, Long volunteerId) {
        return person.getVolunteerWork().stream()
                .filter((volunteer) -> volunteer.getVolunteerId().equals(volunteerId))
                .findFirst()
                .orElseThrow();
    }

    public WorkExperience getWorkExpById(Person person, Long workId) {
        return person.getWorkExperience().stream()
                .filter((work) -> work.getWorkId().equals(workId))
                .findFirst()
                .orElseThrow();
    }

    public void delete(Long id) {
        personRepository.deleteById(id);
    }

    public void deleteTechSkill(Long id, TechnicalSkill skill) {
        Person person = getById(id);
        person.getTechnicalSkills().remove(skill);
    }

    public void deleteLangSkill(Long id, LanguageSkill skill) {
        Person person = getById(id);
        person.getLanguageSkills().remove(skill);
    }

    public void deleteEducation(Long id, Education education) {
        Person person = getById(id);
        person.getEducation().remove(education);
    }

    public void deleteCourse(Long id, Course course) {
        Person person = getById(id);
        person.getCourses().remove(course);
    }

    public void deleteVoluntWork(Long id, VolunteerWork volunteering) {
        Person person = getById(id);
        person.getVolunteerWork().remove(volunteering);
    }

    public void deleteWorkExp(Long id, WorkExperience work) {
        Person person = getById(id);
        person.getWorkExperience().remove(work);
    }

}