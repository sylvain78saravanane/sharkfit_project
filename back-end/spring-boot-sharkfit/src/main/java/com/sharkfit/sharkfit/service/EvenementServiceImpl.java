package com.sharkfit.sharkfit.service;

import com.sharkfit.sharkfit.dao.EvenementRepository;
import com.sharkfit.sharkfit.entity.Evenement;
import com.sharkfit.sharkfit.entity.Recette;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
public class EvenementServiceImpl implements EvenementService{

    @Autowired
    private EvenementRepository evenementRepository;

    public Evenement saveEvenement(Evenement evenement){
        evenement.setDate(new Date());

        return evenementRepository.save(evenement);
    }

    public List<Evenement> getAllEvenement(){
        return evenementRepository.findAll();
    }

    public Evenement getEvenementById(Long evenementId){
        Optional<Evenement> optionalEvenement = evenementRepository.findById(evenementId);
        if(optionalEvenement.isPresent()){
            Evenement evenement = optionalEvenement.get();
            return evenementRepository.save(evenement);
        }else{
            throw new EntityNotFoundException("L'évènement n'a pas été trouvé");
        }
    }

    public Evenement updateEvenement(Long evenementId, Evenement updatedEvenement){
        Evenement existingEvenement = evenementRepository.findById(evenementId).orElseThrow(() -> new EntityNotFoundException("Pas d'evenement avec l'id : " + evenementId));
        existingEvenement.setTitle(updatedEvenement.getTitle());
        existingEvenement.setContent(updatedEvenement.getContent());
        existingEvenement.setLieu_event(updatedEvenement.getLieu_event());
        existingEvenement.setDate_event(updatedEvenement.getDate_event());
        existingEvenement.setHours_event(updatedEvenement.getHours_event());
        existingEvenement.setPostedBy(updatedEvenement.getPostedBy());
        return evenementRepository.save(existingEvenement);
    }

    public void deleteEvenement(Long evenementId) {
        Evenement evenement = evenementRepository.findById(evenementId)
                .orElseThrow(() -> new EntityNotFoundException("L'evenement n'a pas été trouvé"));
        evenementRepository.delete(evenement);
    }
}
