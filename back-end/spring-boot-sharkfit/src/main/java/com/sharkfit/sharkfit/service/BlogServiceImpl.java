package com.sharkfit.sharkfit.service;

import com.sharkfit.sharkfit.dao.BlogRepository;
import com.sharkfit.sharkfit.entity.Blog;
import com.sharkfit.sharkfit.entity.Evenement;
import com.sharkfit.sharkfit.entity.Recette;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
public class BlogServiceImpl implements BlogService{

    @Autowired
    private BlogRepository blogRepository;

    public Blog saveBlog(Blog blog){
        blog.setDate(new Date());

        return blogRepository.save(blog);
    }

    public List<Blog> getAllBlog(){
        return blogRepository.findAll();
    }

    public Blog getBlogById(Long blogId){
        Optional<Blog> optionalBlog = blogRepository.findById(blogId);
        if(optionalBlog.isPresent()){
            Blog blog = optionalBlog.get();
            return blogRepository.save(blog);
        }else{
            throw new EntityNotFoundException("Le blog n'a pas été trouvé");
        }
    }

    public Blog updateBlog(Long blogId, Blog updatedBlog){
        Blog existingBlog = blogRepository.findById(blogId).orElseThrow(() -> new EntityNotFoundException("Pas de blog avec l'id : " + blogId));
        existingBlog.setContent(updatedBlog.getContent());
        existingBlog.setTitle(updatedBlog.getTitle());
        existingBlog.setPostedBy(updatedBlog.getPostedBy());
        return blogRepository.save(existingBlog);
    }

    public void deleteBlog(Long blogId) {
        Blog blog = blogRepository.findById(blogId)
                .orElseThrow(() -> new EntityNotFoundException("La recette n'a pas été trouvé"));
        blogRepository.delete(blog);
    }

}
