package com.sharkfit.sharkfit.controller;

import com.sharkfit.sharkfit.entity.Recette;
import com.sharkfit.sharkfit.service.RecetteService;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("api/recette")
public class RecetteController {

    @Autowired
    private RecetteService recetteService;

    @PostMapping
    public ResponseEntity<?> createRecette (@RequestBody Recette recette){
        try{
            Recette createdRecette = recetteService.saveRecette(recette);
            return ResponseEntity.status(HttpStatus.CREATED).body(createdRecette);
        } catch (Exception e){
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    @GetMapping
    public ResponseEntity<List<Recette>> getAllRecette(){
        try{
            return ResponseEntity.status(HttpStatus.OK).body(recetteService.getAllRecette());
        }catch (Exception e){
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    @GetMapping("/{recetteId}")
    public ResponseEntity<?> getRecetteById(@PathVariable Long recetteId){
        try{
            Recette recette = recetteService.getRecetteById(recetteId);
            return ResponseEntity.ok(recette);
        } catch (EntityNotFoundException e){
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(e.getMessage());
        }
    }

    @DeleteMapping("/{recetteId}")
    public ResponseEntity<?> deleteRecette(@PathVariable Long recetteId){
        try{
            recetteService.deleteRecette(recetteId);
            return ResponseEntity.status(HttpStatus.NO_CONTENT).build();
        } catch (EntityNotFoundException e){
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(e.getMessage());
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("erreur lors de la suppression de la recette" + e.getMessage());
        }
    }

    @PutMapping("/{recetteId}")
    public ResponseEntity<?> updateRecette(@PathVariable Long recetteId, @RequestBody Recette updatedRecette){
        try {
            Recette recette = recetteService.updateRecette(recetteId, updatedRecette);
            return ResponseEntity.ok(recette);
        } catch (EntityNotFoundException e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(e.getMessage());
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Une erreur a été produite lors de la modification de votre recette:"+e.getMessage());
        }
    }


}
