package com.sharkfit.sharkfit.entity;


import jakarta.persistence.*;
import lombok.Data;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import java.math.BigDecimal;
import java.util.Date;

@Entity
@Table(name="product")
@Data
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)

    @Column(name = "id")
    private Long id;


    @ManyToOne
    @JoinColumn(name="category_id", nullable = false, unique = true)
    private ProductCategory category;

    @Column(name = "code_produit")
    private String codeProduit;

    @Column(name = "name")
    private String name;

    @Column(name = "description")
    private String description;

    @Column(name = "unit_price")
    private BigDecimal unitPrice;

    @Column(name = "image_url")
    private String imageUrl;

    @Column(name = "active")
    private boolean active;

    @Column(name = "units_in_stock")
    private int unitsInStock;

    @Column(name = "date_created")
    @CreationTimestamp // Hibernate va automatiquement mettre à jour le temps (horodatage)
    private Date dateCreated;

    @Column(name = "last_updated")
    @UpdateTimestamp // Hibernate va automatiquement mettre à jour le temps (horodatage)
    private Date lastUptaded;


}
