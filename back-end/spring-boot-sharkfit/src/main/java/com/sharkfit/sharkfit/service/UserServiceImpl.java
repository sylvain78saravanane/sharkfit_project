package com.sharkfit.sharkfit.service;

import com.sharkfit.sharkfit.dao.UserRepository;
import com.sharkfit.sharkfit.entity.Admin;
import com.sharkfit.sharkfit.entity.User;
import com.sharkfit.sharkfit.entity.Utilisateur;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class UserServiceImpl implements UserService{

    @Autowired
    private UserRepository userRepository;




    public User inscription(User user){
        user.setPassword(BCrypt.hashpw(user.getPassword(), BCrypt.gensalt()));
        try{
            User savedUser = userRepository.save(user);
            return savedUser;
        } catch (DataIntegrityViolationException e){
            throw new IllegalArgumentException("L'email existe déjà !");
        }
    }

    public User login(String email, String password){
        User user = userRepository.findByEmail(email);
        if (user != null && BCrypt.checkpw(password, user.getPassword())){
            return user;
        }

        return null;
    }


    public User loginAdmin(String email, String password){
        User user = userRepository.findByEmail(email);
        if (user !=null && BCrypt.checkpw(password, user.getPassword()) && user instanceof Admin){
            return user;
        }
        return null;
    }

    public List<User> getAllUsers(){
        return userRepository.findAll();
    }

    public List<Admin> getAllAdmins(){
        return userRepository.findAllAdmins();
    }


    public List<Utilisateur> getAllUtilisateurs() {
        return userRepository.findAllUtilisateurs();
    }

    public void deleteUserById(Long userId){
        userRepository.deleteById(userId);
    }

    public User updateUser(User updatedUser){
        User existingUser = userRepository.findById(updatedUser.getId())
                .orElseThrow(() -> new IllegalArgumentException("Utilisateur non trouvé"));

        existingUser.setPrenom(updatedUser.getPrenom());
        existingUser.setNom(updatedUser.getNom());
        existingUser.setEmail(updatedUser.getEmail());

        return userRepository.save(existingUser);
    }

}
