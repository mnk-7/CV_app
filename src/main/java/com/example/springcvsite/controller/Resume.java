package com.example.springcvsite.controller;

import com.example.springcvsite.model.*;
import com.example.springcvsite.service.*;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.view.RedirectView;

import java.util.List;

@AllArgsConstructor
@Controller
public class Resume {

    private final PersonService personService;
    private final EducationService educationService;
    private final CourseService courseService;
    private final VolunteerWorkService volunteerWorkService;
    private final WorkExperienceService workExperienceService;
    private final DutyService dutyService;

    @GetMapping("/resume/{id}")
    public String getResume(@PathVariable("id") Long personId, Model model) {
        addAllResumeAttr(personId, model);
        return "resume/resume";
    }

    @GetMapping("/resume/{id}/edit")
    public String getEditResume(@PathVariable("id") Long personId, Model model) {
        addAllResumeAttr(personId, model);
        return "resume/editResume";
    }

    @GetMapping("/resume/{id}/edit/edu/add")
    public String getAddEducation(@PathVariable("id") Long personId, Model model) {
        addPersonAttr(personId, model);
        return "resume/addEducation";
    }

    @PostMapping("/resume/{id}/edit/edu/add")
    public RedirectView postAddEducation(@PathVariable("id") Long personId, @ModelAttribute Education education) {
        Person person = personService.getById(personId);
        educationService.create(person, education);
        return new RedirectView("/resume/{id}/edit");
    }

    @GetMapping("/resume/{id}/edit/course/add")
    public String getAddCourse(@PathVariable("id") Long personId, Model model) {
        addPersonAttr(personId, model);
        return "resume/addCourse";
    }

    @PostMapping("/resume/{id}/edit/course/add")
    public RedirectView postAddCourse(@PathVariable("id") Long personId, @ModelAttribute Course course) {
        Person person = personService.getById(personId);
        courseService.create(person, course);
        return new RedirectView("/resume/{id}/edit");
    }

    @GetMapping("/resume/{id}/edit/volunteer/add")
    public String getAddVoluntWork(@PathVariable("id") Long personId, Model model) {
        addPersonAttr(personId, model);
        return "resume/addVolunteerWork";
    }

    @PostMapping("/resume/{id}/edit/volunteer/add")
    public RedirectView postAddVoluntWork(@PathVariable("id") Long personId, @ModelAttribute VolunteerWork voluntWork) {
        Person person = personService.getById(personId);
        volunteerWorkService.create(person, voluntWork);
        return new RedirectView("/resume/{id}/edit");
    }

    @GetMapping("/resume/{id}/edit/work/add")
    public String getAddWorkExp(@PathVariable("id") Long personId, Model model) {
        addPersonAttr(personId, model);
        return "resume/addWorkExp";
    }

    @PostMapping("/resume/{id}/edit/work/add")
    public RedirectView postAddWorkExp(@PathVariable("id") Long personId, @ModelAttribute WorkExperience work) {
        Person person = personService.getById(personId);
        workExperienceService.create(person, work);
        return new RedirectView("/resume/{id}/edit");
    }

    @RequestMapping(value = {"/resume/{id}/edit/work/add/duty/add"}, method = {RequestMethod.POST, RequestMethod.GET})
    public RedirectView postAddWorkExpAddWorkDuty(@PathVariable("id") Long personId, @ModelAttribute WorkExperience work, Model model) {
        Person person = personService.getById(personId);
        Long workId = workExperienceService.create(person, work);
        addPersonAndWorkExpAttr(personId, workId, model);
        return new RedirectView("/resume/{id}/edit/work/" + workId + "/edit/duty/add");
    }

    @GetMapping("/resume/{id}/edit/work/{workId}/edit/duty/add")
    public String getAddWorkDuty(@PathVariable("id") Long personId, @PathVariable("workId") Long workId, Model model) {
        addPersonAndWorkExpAttr(personId, workId, model);
        return "resume/addWorkDuty";
    }

    @PostMapping("/resume/{id}/edit/work/{workId}/edit/duty/add")
    public RedirectView postAddWorkDuty(@PathVariable("id") Long personId, @PathVariable("workId") Long workId, @ModelAttribute Duty duty, Model model) {
        WorkExperience work = addPersonAndWorkExpAttr(personId, workId, model);
        dutyService.create(work, duty);
        return new RedirectView("/resume/{id}/edit/work/" + workId + "/edit");
    }

    @GetMapping("/resume/{id}/edit/edu/{eduId}/edit")
    public String getEditEducation(@PathVariable("id") Long personId, @PathVariable("eduId") Long eduId, Model model) {
        addPersonAndEducationAttr(personId, eduId, model);
        return "resume/editEducation";
    }

    @PostMapping("/resume/{id}/edit/edu/{eduId}/edit")
    public RedirectView postEditEducation(@PathVariable("id") Long personId, @PathVariable("eduId") Long eduId, @ModelAttribute Education newEducation) {
        Education oldEducation = educationService.getById(eduId);
        educationService.edit(oldEducation, newEducation);
        return new RedirectView("/resume/{id}/edit");
    }

    @GetMapping("/resume/{id}/edit/course/{courseId}/edit")
    public String getEditCourse(@PathVariable("id") Long personId, @PathVariable("courseId") Long courseId, Model model) {
        addPersonAndCourseAttr(personId, courseId, model);
        return "resume/editCourse";
    }

    @PostMapping("/resume/{id}/edit/course/{courseId}/edit")
    public RedirectView postEditCourse(@PathVariable("id") Long personId, @PathVariable("courseId") Long courseId, @ModelAttribute Course newCourse) {
        Course oldCourse = courseService.getById(courseId);
        courseService.edit(oldCourse, newCourse);
        return new RedirectView("/resume/{id}/edit");
    }

    @GetMapping("/resume/{id}/edit/volunteer/{volunteerId}/edit")
    public String getEditVoluntWork(@PathVariable("id") Long personId, @PathVariable("volunteerId") Long volunteerId, Model model) {
        addPersonAndVoluntWorkAttr(personId, volunteerId, model);
        return "resume/editVolunteerWork";
    }

    @PostMapping("/resume/{id}/edit/volunteer/{volunteerId}/edit")
    public RedirectView postEditVoluntWork(@PathVariable("id") Long personId, @PathVariable("volunteerId") Long volunteerId, @ModelAttribute VolunteerWork newVoluntWork) {
        VolunteerWork oldVoluntWork = volunteerWorkService.getById(volunteerId);
        volunteerWorkService.edit(oldVoluntWork, newVoluntWork);
        return new RedirectView("/resume/{id}/edit");
    }

    @GetMapping("/resume/{id}/edit/work/{workId}/edit")
    public String getEditWorkExp(@PathVariable("id") Long personId, @PathVariable("workId") Long workId, Model model) {
        addPersonAndWorkExpAttr(personId, workId, model);
        return "resume/editWorkExp";
    }

    @PostMapping("/resume/{id}/edit/work/{workId}/edit")
    public RedirectView postEditWorkExp(@PathVariable("id") Long personId, @PathVariable("workId") Long workId, @ModelAttribute WorkExperience newWork) {
        WorkExperience oldWork = workExperienceService.getById(workId);
        workExperienceService.edit(oldWork, newWork);
        return new RedirectView("/resume/{id}/edit/work/{workId}/edit");
    }

    @GetMapping("/resume/{id}/edit/work/{workId}/edit/duty/{dutyId}/edit")
    public String getEditWorkDuty(@PathVariable("id") Long personId, @PathVariable("workId") Long workId, @PathVariable("dutyId") Long dutyId, Model model) {
        addWorkExpAndWorkDutyAttr(personId, workId, dutyId, model);
        return "resume/editWorkDuty";
    }

    @PostMapping("/resume/{id}/edit/work/{workId}/edit/duty/{dutyId}/edit")
    public RedirectView postEditWorkDuty(@PathVariable("id") Long personId, @PathVariable("workId") Long workId, @PathVariable("dutyId") Long dutyId, @ModelAttribute Duty newDuty) {
        Duty oldDuty = dutyService.getById(dutyId);
        dutyService.edit(oldDuty, newDuty);
        return new RedirectView("/resume/{id}/edit/work/" + workId + "/edit");
    }

    @RequestMapping(value = {"/resume/{id}/edit/edu/{eduId}/delete"}, method = {RequestMethod.DELETE, RequestMethod.GET})
    public RedirectView deleteEducation(@PathVariable("id") Long personId, @PathVariable("eduId") Long eduId) {
        Education education = educationService.getById(eduId);
        personService.deleteEducation(personId, education);
        educationService.delete(eduId);
        return new RedirectView("/resume/{id}/edit");
    }

    @RequestMapping(value = {"/resume/{id}/edit/course/{courseId}/delete"}, method = {RequestMethod.DELETE, RequestMethod.GET})
    public RedirectView deleteCourse(@PathVariable("id") Long personId, @PathVariable("courseId") Long courseId) {
        Course course = courseService.getById(courseId);
        personService.deleteCourse(personId, course);
        courseService.delete(courseId);
        return new RedirectView("/resume/{id}/edit");
    }

    @RequestMapping(value = {"/resume/{id}/edit/volunteer/{volunteerId}/delete"}, method = {RequestMethod.DELETE, RequestMethod.GET})
    public RedirectView deleteVoluntWork(@PathVariable("id") Long personId, @PathVariable("volunteerId") Long volunteerId) {
        VolunteerWork voluntWork = volunteerWorkService.getById(volunteerId);
        personService.deleteVoluntWork(personId, voluntWork);
        volunteerWorkService.delete(volunteerId);
        return new RedirectView("/resume/{id}/edit");
    }

    @RequestMapping(value = {"/resume/{id}/edit/work/{workId}/delete"}, method = {RequestMethod.DELETE, RequestMethod.GET})
    public RedirectView deleteWorkExp(@PathVariable("id") Long personId, @PathVariable("workId") Long workId) {
        WorkExperience work = workExperienceService.getById(workId);
        personService.deleteWorkExp(personId, work);
        workExperienceService.delete(workId);
        return new RedirectView("/resume/{id}/edit");
    }

    @RequestMapping(value = {"/resume/{id}/edit/work/{workId}/edit/duty/{dutyId}/delete"}, method = {RequestMethod.DELETE, RequestMethod.GET})
    public RedirectView deleteWorkDuty(@PathVariable("id") Long personId, @PathVariable("workId") Long workId, @PathVariable("dutyId") Long dutyId) {
        Duty duty = dutyService.getById(dutyId);
        workExperienceService.deleteDuty(workId, duty);
        dutyService.delete(dutyId);
        return new RedirectView("/resume/{id}/edit/work/" + workId + "/edit");
    }

    private void addAllResumeAttr(Long personId, Model model) {
        Person person = addPersonAttr(personId, model);
        List<Education> education = educationService.getAll(personId);
        List<Course> courses = courseService.getAll(personId);
        List<VolunteerWork> voluntWork = volunteerWorkService.getAll(personId);
        List<WorkExperience> workExp = workExperienceService.getAll(personId);
        model.addAttribute("person", person);
        model.addAttribute("education", education);
        model.addAttribute("course", courses);
        model.addAttribute("volunteerWork", voluntWork);
        model.addAttribute("workExperience", workExp);

    }

    private Person addPersonAttr(Long personId, Model model) {
        Person person = personService.getById(personId);
        String background = personService.getEncodedBackground(person);
        model.addAttribute("person", person);
        model.addAttribute("background", background);
        return person;
    }

    private void addPersonAndEducationAttr(Long personId, Long eduId, Model model) {
        Person person = addPersonAttr(personId, model);
        Education education = personService.getEducationById(person, eduId);
        model.addAttribute("education", education);
    }

    private void addPersonAndCourseAttr(Long personId, Long courseId, Model model) {
        Person person = addPersonAttr(personId, model);
        Course course = personService.getCourseById(person, courseId);
        model.addAttribute("course", course);
    }

    private void addPersonAndVoluntWorkAttr(Long personId, Long volunteerId, Model model) {
        Person person = addPersonAttr(personId, model);
        VolunteerWork voluntWork = personService.getVoluntWorkById(person, volunteerId);
        model.addAttribute("volunteerWork", voluntWork);
    }

    private WorkExperience addPersonAndWorkExpAttr(Long personId, Long workId, Model model) {
        Person person = addPersonAttr(personId, model);
        WorkExperience work = personService.getWorkExpById(person, workId);
        model.addAttribute("workExperience", work);
        return work;
    }

    private void addWorkExpAndWorkDutyAttr(Long personId, Long workId, Long dutyId, Model model) {
        WorkExperience work = addPersonAndWorkExpAttr(personId, workId, model);
        Duty duty = workExperienceService.getDutyById(work, dutyId);
        model.addAttribute("duty", duty);
    }

}