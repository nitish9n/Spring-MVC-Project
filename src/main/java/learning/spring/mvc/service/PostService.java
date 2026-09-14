package learning.spring.mvc.service;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import learning.spring.mvc.dao.PostDAO;
import learning.spring.mvc.model.Post;

@Service
public class PostService {

    @Autowired
    private PostDAO postDAO;


    @Transactional
    public void addPost(Post post) {

        post.setCreatedAt(
                LocalDateTime.now());

        postDAO.savePost(post);
    }


    @Transactional(readOnly = true)
    public Post getPostById(int id) {

        return postDAO.getPostById(id);
    }


    @Transactional(readOnly = true)
    public List<Post> getAllPosts() {

        return postDAO.getAllPosts();
    }


    @Transactional(readOnly = true)
    public List<Post> searchPosts(String query) {

        return postDAO.searchPosts(query);
    }


    @Transactional
    public void updatePost(Post post) {

        postDAO.updatePost(post);
    }


    @Transactional
    public void deletePost(int id) {

        postDAO.deletePost(id);
    }
}