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
import java.util.Map;

@AllArgsConstructor
@Controller
public class Profiles {

    private final PersonService personService;
    private final ContactDataService contactDataService;

    @GetMapping("/profiles")
    public String getProfiles(Model model) {
        Map<Person, String> profiles = personService.getAllWithEncodedPhotos();
        model.addAttribute("map", profiles);
        return "profile/profiles";
    }

    @GetMapping("/profiles/edit/person/add")
    public String getAddProfile() {
        return "profile/addPerson";
    }

    @PostMapping("/profiles/edit/person/add")
    public RedirectView postAddProfile(@RequestParam("imagePhoto") MultipartFile photo, @RequestParam("imageBackground") MultipartFile background, @ModelAttribute Person person, @ModelAttribute ContactData contact) throws IOException {
        personService.create(person, photo, background);
        contactDataService.create(person, contact);
        return new RedirectView("/home/" + person.getPersonId());
    }

    @RequestMapping(value = {"/profiles/edit/person/{id}/delete"}, method = {RequestMethod.DELETE, RequestMethod.GET})
    public RedirectView deleteProfile(@PathVariable("id") Long personId) {
        personService.delete(personId);
        return new RedirectView("/profiles");
    }

}