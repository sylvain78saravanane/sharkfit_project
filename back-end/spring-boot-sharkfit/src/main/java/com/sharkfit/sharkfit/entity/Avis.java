package com.sharkfit.sharkfit.entity;

import jakarta.persistence.*;
import lombok.Data;

import java.util.Date;
import java.util.List;

@Entity
@Data
public class Avis {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String title;

    @Column(length = 5000)
    private String content;

    private String postedBy;

    private Date date;

    private int likeCount;

    private int viewCount;

    @ElementCollection
    private List<String> tags;
}
