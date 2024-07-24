package com.sharkfit.sharkfit.service;

import com.sharkfit.sharkfit.dao.RecetteRepository;
import com.sharkfit.sharkfit.entity.Avis;
import com.sharkfit.sharkfit.entity.Evenement;
import com.sharkfit.sharkfit.entity.Recette;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class RecetteServiceImpl implements RecetteService{

    @Autowired
    private RecetteRepository recetteRepository;

    public Recette saveRecette (Recette recette){
        return recetteRepository.save(recette);
    }

    public List<Recette> getAllRecette(){
        return recetteRepository.findAll();
    }

    public Recette getRecetteById(Long recetteId){
        Optional<Recette> optionalRecette = recetteRepository.findById(recetteId);
        if(optionalRecette.isPresent()){
            Recette recette = optionalRecette.get();
            return recetteRepository.save(recette);
        }else{
            throw new EntityNotFoundException("La recette n'a pas été trouvé");
        }
    }

    public Recette updateRecette(Long recetteId, Recette updatedRecette){
        Recette existingRecette = recetteRepository.findById(recetteId).orElseThrow(() -> new EntityNotFoundException("Pas de recette avec l'id : " + recetteId));
        existingRecette.setTitle(updatedRecette.getTitle());
        existingRecette.setVeggie(updatedRecette.getVeggie());
        existingRecette.setContent(updatedRecette.getContent());
        existingRecette.setIngredients(updatedRecette.getIngredients());
        return recetteRepository.save(existingRecette);
    }

    public void deleteRecette(Long recetteId) {
        Recette recette = recetteRepository.findById(recetteId)
                .orElseThrow(() -> new EntityNotFoundException("L'avis n'a pas été trouvé"));
        recetteRepository.delete(recette);
    }
}
