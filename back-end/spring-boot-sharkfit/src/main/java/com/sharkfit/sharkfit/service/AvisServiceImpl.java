package com.sharkfit.sharkfit.service;

import com.sharkfit.sharkfit.dao.AvisRepository;
import com.sharkfit.sharkfit.entity.Avis;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
public class AvisServiceImpl implements AvisService{

    @Autowired
    private AvisRepository avisRepository;

    public Avis saveAvis(Avis avis){
        avis.setLikeCount(0);
        avis.setViewCount(0);
        avis.setDate(new Date());

        return avisRepository.save(avis);
    }

    public List<Avis> getAllAvis(){
        return avisRepository.findAll();
    }

    public Avis getAvisById(Long avisId){
        Optional<Avis> optionalAvis = avisRepository.findById(avisId);
        if(optionalAvis.isPresent()){
            Avis avis = optionalAvis.get();
            avis.setViewCount(avis.getViewCount()+1);
            return avisRepository.save(avis);
        }else{
            throw new EntityNotFoundException("L'avis n'a pas été trouvé");
        }
    }

    public Avis updateAvis(Long avisId, Avis updatedAvis){
        Avis existingAvis = avisRepository.findById(avisId).orElseThrow(() -> new EntityNotFoundException("Pas d'avis avec l'id : " + avisId));
        existingAvis.setContent(updatedAvis.getContent());
        existingAvis.setTitle(updatedAvis.getTitle());
        existingAvis.setTags(updatedAvis.getTags());
        return avisRepository.save(existingAvis);
    }

    public void deleteAvis(Long avisId) {
        Avis avis = avisRepository.findById(avisId)
                .orElseThrow(() -> new EntityNotFoundException("L'avis n'a pas été trouvé"));
        avisRepository.delete(avis);
    }

    public void likeAvis(Long avisId){
        Optional<Avis> optionalAvis = avisRepository.findById(avisId);
        if (optionalAvis.isPresent()){
            Avis avis = optionalAvis.get();

            avis.setLikeCount(avis.getLikeCount()+1);
            avisRepository.save(avis);
        } else{
            throw new EntityNotFoundException("L'avis n'a pas été trouvé" + avisId);
        }
    }

    public List<Avis> searchByTitle(String title){
        return avisRepository.findAllByTitleContaining(title);
    }

}
