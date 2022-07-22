package com.example.springcvsite.repository;

import com.example.springcvsite.model.ContactData;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ContactDataRepository extends JpaRepository<ContactData, Long> {
}