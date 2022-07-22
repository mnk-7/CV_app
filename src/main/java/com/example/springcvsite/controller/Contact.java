package com.example.springcvsite.controller;

import com.example.springcvsite.model.ContactData;
import com.example.springcvsite.model.Person;
import com.example.springcvsite.service.ContactDataService;
import com.example.springcvsite.service.PersonService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.view.RedirectView;

@AllArgsConstructor
@Controller
public class Contact {

    private final PersonService personService;
    private final ContactDataService contactDataService;

    @GetMapping("/contact/{id}")
    public String getContact(@PathVariable("id") Long personId, Model model) {
        addAllContactAttr(personId, model);
        return "contact/contact";
    }

    @GetMapping("/contact/{id}/edit")
    public String getEditContact(@PathVariable("id") Long personId, Model model) {
        addAllContactAttr(personId, model);
        return "contact/editContact";
    }

    @PostMapping("/contact/{id}/edit")
    public RedirectView postEditContact(@PathVariable("id") Long personId, @ModelAttribute ContactData newContact) {
        Person person = personService.getById(personId);
        ContactData oldContact = person.getContact();
        contactDataService.edit(oldContact, newContact);
        return new RedirectView("/contact/{id}");
    }

    private void addAllContactAttr(Long personId, Model model) {
        Person person = personService.getById(personId);
        String background = personService.getEncodedBackground(person);
        ContactData contact = person.getContact();
        model.addAttribute("person", person);
        model.addAttribute("background", background);
        model.addAttribute("contactData", contact);
    }

}