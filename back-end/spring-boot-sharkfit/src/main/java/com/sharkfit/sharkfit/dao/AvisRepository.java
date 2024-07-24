package com.sharkfit.sharkfit.dao;

import com.sharkfit.sharkfit.entity.Avis;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AvisRepository extends JpaRepository<Avis, Long> {

    /**
     * get all avis by title
     * @param title de l'avis
     * @return list Of avis
     */
    List<Avis> findAllByTitleContaining(String title);
}


