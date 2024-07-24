package com.sharkfit.sharkfit.service;

import com.sharkfit.sharkfit.entity.Recette;

import java.util.List;

public interface RecetteService {

    Recette saveRecette (Recette recette);

    List<Recette> getAllRecette();

    Recette getRecetteById(Long recetteId);

    Recette updateRecette(Long recetteId, Recette updatedRecette);

    void deleteRecette(Long recetteId);
}
