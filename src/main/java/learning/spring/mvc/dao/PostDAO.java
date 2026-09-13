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


    public void savePost(Post post) {

        Session session =
                sessionFactory.getCurrentSession();

        session.persist(post);
    }


    public Post getPostById(int id) {

        Session session =
                sessionFactory.getCurrentSession();

        return session.get(Post.class, id);
    }


    public List<Post> getAllPosts() {

        Session session =
                sessionFactory.getCurrentSession();

        return session
                .createQuery(
                    "from Post order by createdAt desc",
                    Post.class)
                .getResultList();
    }


    public List<Post> searchPosts(String query) {

        Session session =
                sessionFactory.getCurrentSession();

        return session.createQuery(
                "from Post " +
                "where lower(title) like lower(:query) " +
                "or lower(content) like lower(:query)",
                Post.class)
                .setParameter(
                    "query",
                    "%" + query + "%")
                .getResultList();
    }


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
