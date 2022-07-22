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
@Table(name = "language_skills")
public class LanguageSkill extends Skill {

    private String levelLabel;

    public LanguageSkill(Long skillId, String name, Integer percentage, Person person, String levelLabel) {
        super(skillId, name, percentage, person);
        this.levelLabel = levelLabel;
    }

}