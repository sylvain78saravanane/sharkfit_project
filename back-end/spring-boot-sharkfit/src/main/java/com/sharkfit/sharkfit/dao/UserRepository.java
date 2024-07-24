package com.sharkfit.sharkfit.dao;

import com.sharkfit.sharkfit.entity.Admin;
import com.sharkfit.sharkfit.entity.Customer;
import com.sharkfit.sharkfit.entity.User;
import com.sharkfit.sharkfit.entity.Utilisateur;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User,Long> {
    User findByEmail(String email);

    @Query("SELECT u FROM User u WHERE TYPE(u) = Admin")
    List<Admin> findAllAdmins();

    @Query("SELECT u FROM User u WHERE TYPE(u) = Utilisateur ")
    List<Utilisateur> findAllUtilisateurs();

}
