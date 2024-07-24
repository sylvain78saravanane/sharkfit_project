package com.sharkfit.sharkfit.service;

import com.sharkfit.sharkfit.entity.Avis;

import java.util.List;

public interface AvisService {

    Avis saveAvis(Avis avis);

    List<Avis> getAllAvis();

    Avis getAvisById(Long avisId);

    void deleteAvis(Long avisId);

    Avis updateAvis(Long avisId, Avis updatedAvis);

    void likeAvis(Long avisId);

    List<Avis> searchByTitle(String title);
}
