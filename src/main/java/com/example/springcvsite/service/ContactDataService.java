package com.example.springcvsite.service;

import com.example.springcvsite.model.ContactData;
import com.example.springcvsite.model.Person;
import com.example.springcvsite.repository.ContactDataRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@AllArgsConstructor
@Service
public class ContactDataService {

    private final ContactDataRepository contactDataRepository;

    public void create(Person person, ContactData contact) {
        contact.setPerson(person);
        contactDataRepository.save(contact);
    }

    public void edit(ContactData oldContact, ContactData newContact) {
        ContactData editedContact = new ContactData(
                oldContact.getContactId(),
                newContact.getEmail(),
                newContact.getPhone(),
                newContact.getLocation(),
                newContact.getGithub(),
                newContact.getLinkedin(),
                oldContact.getPerson());
        contactDataRepository.save(editedContact);
    }

}