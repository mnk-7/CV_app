package com.example.springcvsite.controller;

import com.example.springcvsite.model.LanguageSkill;
import com.example.springcvsite.model.Person;
import com.example.springcvsite.model.TechnicalSkill;
import com.example.springcvsite.service.LanguageSkillService;
import com.example.springcvsite.service.PersonService;
import com.example.springcvsite.service.TechnicalSkillService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.view.RedirectView;

import java.util.List;

@AllArgsConstructor
@Controller
public class Skills {

    private final PersonService personService;
    private final TechnicalSkillService technicalSkillService;
    private final LanguageSkillService languageSkillService;

    @GetMapping("/skills/{id}")
    public String getSkills(@PathVariable("id") Long personId, Model model) {
        addAllSkillsAttr(personId, model);
        return "skills/skills";
    }

    @GetMapping("/skills/{id}/edit")
    public String getEditSkills(@PathVariable("id") Long personId, Model model) {
        addAllSkillsAttr(personId, model);
        return "skills/editSkills";
    }

    @GetMapping("/skills/{id}/edit/tech/add")
    public String getAddTechSkill(@PathVariable("id") Long personId, Model model) {
        addPersonAttr(personId, model);
        return "skills/addTechSkill";
    }

    @PostMapping("/skills/{id}/edit/tech/add")
    public RedirectView postAddTechSkill(@PathVariable("id") Long personId, @ModelAttribute TechnicalSkill skill) {
        Person person = personService.getById(personId);
        technicalSkillService.create(person, skill);
        return new RedirectView("/skills/{id}/edit");
    }

    @GetMapping("/skills/{id}/edit/lang/add")
    public String getAddLangSkill(@PathVariable("id") Long personId, Model model) {
        addPersonAttr(personId, model);
        return "skills/addLangSkill";
    }

    @PostMapping("/skills/{id}/edit/lang/add")
    public RedirectView postAddLangSkill(@PathVariable("id") Long personId, @ModelAttribute LanguageSkill skill) {
        Person person = personService.getById(personId);
        languageSkillService.create(person, skill);
        return new RedirectView("/skills/{id}/edit");
    }

    @GetMapping("/skills/{id}/edit/tech/{techId}/edit")
    public String getEditTechSkill(@PathVariable("id") Long personId, @PathVariable("techId") Long techId, Model model) {
        addPersonAndTechSkillAttr(personId, techId, model);
        return "skills/editTechSkill";
    }

    @PostMapping("/skills/{id}/edit/tech/{techId}/edit")
    public RedirectView postEditTechSkill(@PathVariable("id") Long personId, @PathVariable("techId") Long techId, @ModelAttribute TechnicalSkill newSkill) {
        TechnicalSkill oldSkill = technicalSkillService.getById(techId);
        technicalSkillService.edit(oldSkill, newSkill);
        return new RedirectView("/skills/{id}/edit");
    }

    @GetMapping("/skills/{id}/edit/lang/{langId}/edit")
    public String getEditLangSkill(@PathVariable("id") Long personId, @PathVariable("langId") Long langId, Model model) {
        addPersonAndLangSkillAttr(personId, langId, model);
        return "skills/editLangSkill";
    }

    @PostMapping("/skills/{id}/edit/lang/{langId}/edit")
    public RedirectView postEditLangSkill(@PathVariable("id") Long personId, @PathVariable("langId") Long langId, @ModelAttribute LanguageSkill newSkill) {
        LanguageSkill oldSkill = languageSkillService.getById(langId);
        languageSkillService.edit(oldSkill, newSkill);
        return new RedirectView("/skills/{id}/edit");
    }

    @RequestMapping(value = {"/skills/{id}/edit/tech/{techId}/delete"}, method = {RequestMethod.DELETE, RequestMethod.GET})
    public RedirectView deleteTechSkill(@PathVariable("id") Long personId, @PathVariable("techId") Long techId) {
        TechnicalSkill skill = technicalSkillService.getById(techId);
        personService.deleteTechSkill(personId, skill);
        technicalSkillService.delete(techId);
        return new RedirectView("/skills/{id}/edit");
    }

    @RequestMapping(value = {"/skills/{id}/edit/lang/{langId}/delete"}, method = {RequestMethod.DELETE, RequestMethod.GET})
    public RedirectView deleteLangSkill(@PathVariable("id") Long personId, @PathVariable("langId") Long langId) {
        LanguageSkill skill = languageSkillService.getById(langId);
        personService.deleteLangSkill(personId, skill);
        languageSkillService.delete(langId);
        return new RedirectView("/skills/{id}/edit");
    }

    private void addAllSkillsAttr(Long personId, Model model) {
        addPersonAttr(personId, model);
        List<TechnicalSkill> techSkills = technicalSkillService.getAll(personId);
        List<LanguageSkill> langSkills = languageSkillService.getAll(personId);
        model.addAttribute("technicalSkill", techSkills);
        model.addAttribute("languageSkill", langSkills);
    }

    private Person addPersonAttr(Long personId, Model model) {
        Person person = personService.getById(personId);
        String background = personService.getEncodedBackground(person);
        model.addAttribute("person", person);
        model.addAttribute("background", background);
        return person;
    }

    private void addPersonAndTechSkillAttr(Long personId, Long techId, Model model) {
        Person person = addPersonAttr(personId, model);
        TechnicalSkill skill = personService.getTechSkillById(person, techId);
        model.addAttribute("technicalSkill", skill);
    }

    private void addPersonAndLangSkillAttr(Long personId, Long langId, Model model) {
        Person person = addPersonAttr(personId, model);
        LanguageSkill skill = personService.getLangSkillById(person, langId);
        model.addAttribute("languageSkill", skill);
    }

}