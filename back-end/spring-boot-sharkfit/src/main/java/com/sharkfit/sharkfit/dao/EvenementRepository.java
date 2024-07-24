package com.sharkfit.sharkfit.dao;

import com.sharkfit.sharkfit.entity.Evenement;
import org.springframework.data.jpa.repository.JpaRepository;

public interface EvenementRepository extends JpaRepository<Evenement, Long> {
}
