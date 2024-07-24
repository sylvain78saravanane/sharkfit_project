package com.sharkfit.sharkfit.service;

import com.sharkfit.sharkfit.entity.Evenement;

import java.util.List;

public interface EvenementService {
    Evenement saveEvenement(Evenement evenement);

    List<Evenement> getAllEvenement();

    Evenement getEvenementById(Long evenementId);

    Evenement updateEvenement(Long evenementId, Evenement updatedEvenement);

    void deleteEvenement(Long evenementId);
}
