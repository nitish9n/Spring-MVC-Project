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


    // =========================================================
    // ADD NEW BLOG
    // =========================================================

    @Transactional
    public void addPost(Post post) {

        // Set current date and time
        post.setCreatedAt(
                LocalDateTime.now());

        // New blogs need admin approval
        post.setStatus("PENDING");

        postDAO.savePost(post);
    }


    // =========================================================
    // GET POST BY ID
    // Returns post regardless of status
    // Used for owner/admin operations
    // =========================================================

    @Transactional(readOnly = true)
    public Post getPostById(int id) {

        return postDAO.getPostById(id);
    }


    // =========================================================
    // GET APPROVED POST BY ID
    // Used when public user opens a blog
    // =========================================================

    @Transactional(readOnly = true)
    public Post getApprovedPostById(int id) {

        return postDAO.getApprovedPostById(id);
    }


    // =========================================================
    // GET ALL POSTS
    // Used by admin
    // =========================================================

    @Transactional(readOnly = true)
    public List<Post> getAllPosts() {

        return postDAO.getAllPosts();
    }


    // =========================================================
    // GET ONLY APPROVED POSTS
    // Used on public homepage/blog page
    // =========================================================

    @Transactional(readOnly = true)
    public List<Post> getApprovedPosts() {

        return postDAO.getApprovedPosts();
    }


    // =========================================================
    // SEARCH APPROVED POSTS
    // Public search only searches approved blogs
    // =========================================================

    @Transactional(readOnly = true)
    public List<Post> searchApprovedPosts(
            String query) {

        return postDAO.searchApprovedPosts(query);
    }


    // =========================================================
    // GET PENDING POSTS
    // Used by admin
    // =========================================================

    @Transactional(readOnly = true)
    public List<Post> getPendingPosts() {

        return postDAO.getPendingPosts();
    }


    // =========================================================
    // APPROVE POST
    // =========================================================

    @Transactional
    public void approvePost(int id) {

        postDAO.approvePost(id);
    }


    // =========================================================
    // REJECT POST
    // =========================================================

    @Transactional
    public void rejectPost(int id) {

        postDAO.rejectPost(id);
    }


    // =========================================================
    // UPDATE POST
    // =========================================================

    @Transactional
    public void updatePost(Post post) {

        postDAO.updatePost(post);
    }


    // =========================================================
    // DELETE POST
    // =========================================================

    @Transactional
    public void deletePost(int id) {

        postDAO.deletePost(id);
    }
}