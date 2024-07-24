package com.sharkfit.sharkfit.controller;

import com.sharkfit.sharkfit.entity.Avis;
import com.sharkfit.sharkfit.entity.Recette;
import com.sharkfit.sharkfit.service.AvisService;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/avis")
public class AvisController {

    @Autowired
    private AvisService avisService;

    @PostMapping
    public ResponseEntity<?> createAvis(@RequestBody Avis avis){
        try{
            Avis createdAvis = avisService.saveAvis(avis);
            return ResponseEntity.status(HttpStatus.CREATED).body(createdAvis);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    @GetMapping
    public ResponseEntity<List<Avis>> getAllAvis(){
        try {
            return ResponseEntity.status(HttpStatus.OK).body(avisService.getAllAvis());
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    @GetMapping("/{avisId}")
    public ResponseEntity<?> getAvisById(@PathVariable Long avisId){
        try{
            Avis avis = avisService.getAvisById(avisId);
            return ResponseEntity.ok(avis);
        } catch (EntityNotFoundException e){
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(e.getMessage());
        }
    }

    @DeleteMapping("/{avisId}")
    public ResponseEntity<?> deleteAvis(@PathVariable Long avisId){
        try{
            avisService.deleteAvis(avisId);
            return ResponseEntity.status(HttpStatus.NO_CONTENT).build();
        } catch (EntityNotFoundException e){
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(e.getMessage());
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("erreur lors de la suppression" + e.getMessage());
        }
    }

    @PutMapping("/{avisId}")
    public ResponseEntity<?> updateAvis(@PathVariable Long avisId, @RequestBody Avis updatedAvis){
        try {
            Avis avis = avisService.updateAvis(avisId, updatedAvis);
            return ResponseEntity.ok(avis);
        } catch (EntityNotFoundException e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(e.getMessage());
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Une erreur a été produite lors de la modification de votre avis:"+e.getMessage());
        }
    }

    @PutMapping("/{avisId}/like")
    public ResponseEntity<?> likeAvis(@PathVariable Long avisId){
        try{
            avisService.likeAvis(avisId);
            return ResponseEntity.ok(new String[]{"L'avis a été liké."});
        } catch (EntityNotFoundException e){
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(e.getMessage());
        }
    }

    @GetMapping("/search/{title}")
    public ResponseEntity<?> searchByTitle(@PathVariable String title) {
        try {
            return ResponseEntity.status(HttpStatus.OK).body(avisService.searchByTitle(title));
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }
}
