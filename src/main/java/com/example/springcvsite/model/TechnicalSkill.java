package com.example.springcvsite.model;

import lombok.NoArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.Entity;
import javax.persistence.Table;

@NoArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "technical_skills")
public class TechnicalSkill extends Skill {

    public TechnicalSkill(Long skillId, String name, Integer percentage, Person person) {
        super(skillId, name, percentage, person);
    }

}