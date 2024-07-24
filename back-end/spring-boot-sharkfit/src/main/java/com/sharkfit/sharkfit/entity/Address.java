package com.sharkfit.sharkfit.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "address")
@Getter
@Setter
public class Address {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "country")
    private String country;

    @Column(name = "state")
    private String state;

    @Column(name = "numero_rue")
    private int numero_rue;

    @Column(name = "adresse_postale")
    private String adresse_postale;

    @Column(name = "ville")
    private String ville;

    @Column(name = "code_postale")
    private String code_postale;

    @OneToOne
    @PrimaryKeyJoinColumn
    private Order order;

}
