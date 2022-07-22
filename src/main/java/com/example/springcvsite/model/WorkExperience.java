package com.example.springcvsite.model;

import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.*;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Entity
public class WorkExperience {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long workId;

    private String position;
    private String company;
    private String timeRange;

    @OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL, mappedBy = "workExperience")
    private Set<Duty> duties = new HashSet<>();

    @OneToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "person_id")
    private Person person;

    public List<Duty> getDutyList() {
        List<Duty> duties = new ArrayList<>(getDuties());
        duties.sort(Comparator.comparing(Duty::getDutyId));
        return duties;
    }

}