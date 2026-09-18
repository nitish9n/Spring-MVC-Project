package learning.spring.mvc.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import learning.spring.mvc.model.Post;

@Repository
public class PostDAO {

    @Autowired
    private SessionFactory sessionFactory;


    // =========================================================
    // SAVE NEW POST
    // =========================================================

    public void savePost(Post post) {

        Session session =
                sessionFactory.getCurrentSession();

        session.persist(post);
    }


    // =========================================================
    // GET POST BY ID
    // Returns post regardless of status
    // Used by owner/admin
    // =========================================================

    public Post getPostById(int id) {

        Session session =
                sessionFactory.getCurrentSession();

        return session.get(Post.class, id);
    }


    // =========================================================
    // GET APPROVED POST BY ID
    // Used when public user opens a blog
    // =========================================================

    public Post getApprovedPostById(int id) {

        Session session =
                sessionFactory.getCurrentSession();

        return session.createQuery(
                "from Post " +
                "where id = :id " +
                "and status = :status",
                Post.class)
                .setParameter("id", id)
                .setParameter("status", "APPROVED")
                .uniqueResult();
    }


    // =========================================================
    // GET ALL POSTS
    // Used when admin needs all posts
    // =========================================================

    public List<Post> getAllPosts() {

        Session session =
                sessionFactory.getCurrentSession();

        return session.createQuery(
                "from Post order by createdAt desc",
                Post.class)
                .getResultList();
    }


    // =========================================================
    // GET ONLY APPROVED POSTS
    // These are visible to public users
    // =========================================================

    public List<Post> getApprovedPosts() {

        Session session =
                sessionFactory.getCurrentSession();

        return session.createQuery(
                "from Post " +
                "where status = :status " +
                "order by createdAt desc",
                Post.class)
                .setParameter("status", "APPROVED")
                .getResultList();
    }


    // =========================================================
    // SEARCH ONLY APPROVED POSTS
    // =========================================================

    public List<Post> searchApprovedPosts(String query) {

        Session session =
                sessionFactory.getCurrentSession();

        return session.createQuery(
                "from Post " +
                "where status = :status " +
                "and (" +
                "lower(title) like lower(:query) " +
                "or lower(content) like lower(:query)" +
                ") " +
                "order by createdAt desc",
                Post.class)
                .setParameter("status", "APPROVED")
                .setParameter(
                        "query",
                        "%" + query + "%")
                .getResultList();
    }


    // =========================================================
    // GET PENDING POSTS
    // These are waiting for admin approval
    // =========================================================

    public List<Post> getPendingPosts() {

        Session session =
                sessionFactory.getCurrentSession();

        return session.createQuery(
                "from Post " +
                "where status = :status " +
                "order by createdAt desc",
                Post.class)
                .setParameter("status", "PENDING")
                .getResultList();
    }


    // =========================================================
    // APPROVE POST
    // =========================================================

    public void approvePost(int id) {

        Session session =
                sessionFactory.getCurrentSession();

        Post post =
                session.get(Post.class, id);

        if (post != null) {

            post.setStatus("APPROVED");
        }
    }


    // =========================================================
    // REJECT POST
    // =========================================================

    public void rejectPost(int id) {

        Session session =
                sessionFactory.getCurrentSession();

        Post post =
                session.get(Post.class, id);

        if (post != null) {

            post.setStatus("REJECTED");
        }
    }


    // =========================================================
    // UPDATE POST
    // =========================================================

    public void updatePost(Post post) {

        Session session =
                sessionFactory.getCurrentSession();

        session.merge(post);
    }


    // =========================================================
    // DELETE POST
    // =========================================================

    public void deletePost(int id) {

        Session session =
                sessionFactory.getCurrentSession();

        Post post =
                session.get(Post.class, id);

        if (post != null) {

            session.remove(post);
        }
    }
}