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
public class About {

    private final PersonService personService;
    private final ContactDataService contactDataService;

    @GetMapping("/about/{id}")
    public String getAbout(@PathVariable("id") Long personId, Model model) {
        addAllAboutAttr(personId, model);
        return "about/about";
    }

    @GetMapping("/about/{id}/edit")
    public String getEditAbout(@PathVariable("id") Long personId, Model model) {
        addAllAboutAttr(personId, model);
        return "about/editAbout";
    }

    @PostMapping("/about/{id}/edit")
    public RedirectView postEditAbout(@RequestParam("imagePhoto") MultipartFile newPhoto, @RequestParam("imageBackground") MultipartFile newBackground, @PathVariable("id") Long personId, @ModelAttribute Person newPerson, @ModelAttribute ContactData newContact) throws IOException {
        Person oldPerson = personService.getById(personId);
        personService.editWithImages(oldPerson, newPerson, newPhoto, newBackground);
        ContactData oldContact = oldPerson.getContact();
        contactDataService.edit(oldContact, newContact);
        return new RedirectView("/about/{id}");
    }

    private void addAllAboutAttr(Long personId, Model model) {
        Person person = personService.getById(personId);
        String photo = personService.getEncodedPhoto(person);
        String background = personService.getEncodedBackground(person);
        ContactData contact = person.getContact();
        model.addAttribute("person", person);
        model.addAttribute("photo", photo);
        model.addAttribute("background", background);
        model.addAttribute("contactData", contact);
    }

}