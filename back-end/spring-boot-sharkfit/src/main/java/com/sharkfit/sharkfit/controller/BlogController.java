package com.sharkfit.sharkfit.controller;

import com.sharkfit.sharkfit.entity.Avis;
import com.sharkfit.sharkfit.entity.Blog;
import com.sharkfit.sharkfit.entity.Recette;
import com.sharkfit.sharkfit.service.BlogService;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/blogs")
public class BlogController {

    @Autowired
    private BlogService blogService;

    @PostMapping
    public ResponseEntity<?> createBlog(@RequestBody Blog blog){
        try{
            Blog createdBlog = blogService.saveBlog(blog);
            return ResponseEntity.status(HttpStatus.CREATED).body(createdBlog);
        } catch (Exception e){
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    @GetMapping
    public ResponseEntity<List<Blog>> getAllBlog(){
        try {
            return ResponseEntity.status(HttpStatus.OK).body(blogService.getAllBlog());
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    @GetMapping("/{blogId}")
    public ResponseEntity<?> getBlogById(@PathVariable Long blogId){
        try{
            Blog blog = blogService.getBlogById(blogId);
            return ResponseEntity.ok(blog);
        } catch (EntityNotFoundException e){
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(e.getMessage());
        }
    }

    @DeleteMapping("/{blogId}")
    public ResponseEntity<?> deleteBlog(@PathVariable Long blogId){
        try{
            blogService.deleteBlog(blogId);
            return ResponseEntity.status(HttpStatus.NO_CONTENT).build();
        } catch (EntityNotFoundException e){
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(e.getMessage());
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("erreur lors de la suppression du blog" + e.getMessage());
        }
    }

    @PutMapping("/{blogId}")
    public ResponseEntity<?> updateBlog(@PathVariable Long blogId, @RequestBody Blog updatedBlog){
        try {
            Blog blog = blogService.updateBlog(blogId, updatedBlog);
            return ResponseEntity.ok(blog);
        } catch (EntityNotFoundException e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(e.getMessage());
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Une erreur a été produite lors de la modification de votre blog:"+e.getMessage());
        }
    }
}
