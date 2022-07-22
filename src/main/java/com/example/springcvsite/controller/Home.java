package com.example.springcvsite.controller;

import com.example.springcvsite.model.ContactData;
import com.example.springcvsite.model.Person;
import com.example.springcvsite.service.ContactDataService;
import com.example.springcvsite.service.PersonService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.view.RedirectView;

import java.io.IOException;

@AllArgsConstructor
@Controller
public class Home {

    private final PersonService personService;
    private final ContactDataService contactDataService;

    @GetMapping("/home/{id}")
    public String getHome(@PathVariable("id") Long personId, Model model) {
        addAllHomeAttr(personId, model);
        return "home/home";
    }

    @GetMapping("/home/{id}/edit")
    public String getEditHome(@PathVariable("id") Long personId, Model model) {
        addAllHomeAttr(personId, model);
        return "home/editHome";
    }

    @PostMapping("/home/{id}/edit")
    public RedirectView postEditHome(@RequestParam("imagePhoto") MultipartFile newPhoto, @RequestParam("imageBackground") MultipartFile newBackground, @PathVariable("id") Long personId, @ModelAttribute Person newPerson, @ModelAttribute ContactData newContact) throws IOException {
        Person oldPerson = personService.getById(personId);
        personService.editWithImages(oldPerson, newPerson, newPhoto, newBackground);
        ContactData oldContact = oldPerson.getContact();
        contactDataService.edit(oldContact, newContact);
        return new RedirectView("/home/{id}");
    }

    private void addAllHomeAttr(Long personId, Model model) {
        Person person = personService.getById(personId);
        String background = personService.getEncodedBackground(person);
        ContactData contact = person.getContact();
        model.addAttribute("person", person);
        model.addAttribute("background", background);
        model.addAttribute("contactData", contact);
    }

}