package com.sharkfit.sharkfit.controller;

import com.sharkfit.sharkfit.entity.Evenement;
import com.sharkfit.sharkfit.entity.Recette;
import com.sharkfit.sharkfit.service.EvenementService;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/evenement")
public class EvenementController {

    @Autowired
    private EvenementService evenementService;

    @PostMapping
    public ResponseEntity<?> createEvent(@RequestBody Evenement evenement){
        try{
            Evenement createdEvent = evenementService.saveEvenement(evenement);
            return ResponseEntity.status(HttpStatus.CREATED).body(createdEvent);
        } catch (Exception e){
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    @GetMapping
    public ResponseEntity<List<Evenement>> getAllEvenement(){
        try{
            return ResponseEntity.status(HttpStatus.OK).body(evenementService.getAllEvenement());
        }catch (Exception e){
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    @GetMapping("/{evenementId}")
    public ResponseEntity<?> getEvenementById(@PathVariable Long evenementId){
        try{
            Evenement evenement = evenementService.getEvenementById(evenementId);
            return ResponseEntity.ok(evenement);
        } catch (EntityNotFoundException e){
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(e.getMessage());
        }
    }

    @DeleteMapping("/{evenementId}")
    public ResponseEntity<?> deleteEvenement(@PathVariable Long evenementId){
        try{
            evenementService.deleteEvenement(evenementId);
            return ResponseEntity.status(HttpStatus.NO_CONTENT).build();
        } catch (EntityNotFoundException e){
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(e.getMessage());
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("erreur lors de la suppression de l'evenement'" + e.getMessage());
        }
    }

    @PutMapping("/{evenementId}")
    public ResponseEntity<?> updateEvenement(@PathVariable Long evenementId, @RequestBody Evenement updatedEvenement){
        try {
            Evenement evenement = evenementService.updateEvenement(evenementId, updatedEvenement);
            return ResponseEntity.ok(evenement);
        } catch (EntityNotFoundException e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(e.getMessage());
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Une erreur a été produite lors de la modification de votre evenement:"+e.getMessage());
        }
    }
}
