package com.sharkfit.sharkfit.entity;

import jakarta.persistence.*;
import lombok.Data;

import java.util.Date;

@Entity
@Data
public class Evenement {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String title;

    @Column(length = 5000)
    private String content;

    private String date_event;

    private String hours_event;

    private String img;

    private String lieu_event;

    private String postedBy;

    private Date date;
}
