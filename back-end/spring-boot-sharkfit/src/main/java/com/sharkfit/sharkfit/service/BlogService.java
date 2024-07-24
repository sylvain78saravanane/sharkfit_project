package com.sharkfit.sharkfit.service;

import com.sharkfit.sharkfit.entity.Blog;

import java.util.List;

public interface BlogService {
    Blog saveBlog(Blog blog);

    List<Blog> getAllBlog();

    Blog getBlogById(Long blogId);

    Blog updateBlog(Long blogId, Blog updatedBlog);

    void deleteBlog(Long blogId);

}
