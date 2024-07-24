package com.sharkfit.sharkfit.controller;


import com.sharkfit.sharkfit.entity.Admin;
import com.sharkfit.sharkfit.entity.User;
import com.sharkfit.sharkfit.entity.Utilisateur;
import com.sharkfit.sharkfit.service.EmailService;
import com.sharkfit.sharkfit.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@CrossOrigin(origins = "http://localhost:4200")
@RequestMapping("/api/v1")
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private EmailService emailService;


    @PostMapping("/registrer/utilisateur")
    public ResponseEntity<?> inscriptionUtilisateur(@RequestBody Utilisateur utilisateur){
        try{
            User savedUser = userService.inscription(utilisateur);

            String subject = "Confirmation d'inscription";
            String content = "Bonjour," + "\n" + utilisateur.getPrenom() + ",\n\n"
                    + "Votre compte a été crée avec succès" +",\n\n" + "Cordialement,\n" + "L'équipe Sharkfit";
            emailService.sendEmail(utilisateur.getEmail(),subject,content);
            return ResponseEntity.ok(savedUser);
            // return ResponseEntity.ok(userService.inscription(utilisateur));
        } catch (IllegalArgumentException e){
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
        }
    }

    @PostMapping("/registrer/admin")
    public ResponseEntity<?> inscriptionAdmin(@RequestBody Admin admin){
        try{
            return ResponseEntity.ok(userService.inscription(admin));
        } catch (IllegalArgumentException e){
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
        }
    }

    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody Map<String, String> loginData){
        String email = loginData.get("email");
        String password = loginData.get("password");
        User user = userService.login(email, password);
        if(user != null){
            String token = generateToken(user);
            Map<String, Object> res = new HashMap<>();
            res.put("token", token);
            res.put("user",user);
            return ResponseEntity.ok(res);
        }
        return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
    }

    private String generateToken(User user) {
        return "dummyToken";
    }

    @PostMapping("/login-admin")
    public ResponseEntity<User> loginAdmin(@RequestBody Map<String,String> loginData){
        String email = loginData.get("email");
        String password = loginData.get("password");
        User user = userService.loginAdmin(email, password);
        if (user != null){
            return ResponseEntity.ok(user);
        }
        return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
    }

    @GetMapping("/all")
    public ResponseEntity<List<User>> getAllUsers(){
        try{
            return ResponseEntity.status(HttpStatus.OK).body(userService.getAllUsers());
        } catch (Exception e){
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    @GetMapping("/admins")
    public ResponseEntity<List<Admin>> getAllAdmins(){
        List<Admin>admins = userService.getAllAdmins();
        return new ResponseEntity<>(admins,HttpStatus.OK);
    }

    @GetMapping("/utilisateurs")
    public ResponseEntity<List<Utilisateur>> getAllUtilisateurs(){
        List<Utilisateur>utilisateurs = userService.getAllUtilisateurs();
        return new ResponseEntity<>(utilisateurs,HttpStatus.OK);
    }

    @DeleteMapping("/{userId}")
    public ResponseEntity<Void> deleteUser(@PathVariable Long userId) {
        userService.deleteUserById(userId);
        return ResponseEntity.noContent().build();
    }

    @PutMapping("/{userId}")
    public ResponseEntity<User> updateUser(@PathVariable Long userId, @RequestBody User updatedUser) {
        if (!userId.equals(updatedUser.getId())){
            return ResponseEntity.badRequest().build();
        }

        User savedUser = userService.updateUser(updatedUser);
        return ResponseEntity.ok(savedUser);
    }
}
