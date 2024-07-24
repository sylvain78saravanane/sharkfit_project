package com.sharkfit.sharkfit.service;

import com.sharkfit.sharkfit.entity.Admin;
import com.sharkfit.sharkfit.entity.User;
import com.sharkfit.sharkfit.entity.Utilisateur;

import java.util.List;

public interface UserService {

    User inscription(User user);

    User login(String email, String password);

    List<User> getAllUsers();

    User loginAdmin(String email, String password);

    List<Utilisateur> getAllUtilisateurs();

    List<Admin> getAllAdmins();

    void deleteUserById(Long userId);

    User updateUser(User updatedUser);
}
