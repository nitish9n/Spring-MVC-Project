package learning.spring.mvc.configuration;

import java.util.Properties;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.jpa.hibernate.HibernateTransactionManager;
import org.springframework.orm.jpa.hibernate.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

@EnableWebMvc
@EnableTransactionManagement
@ComponentScan(basePackages = "learning.spring.mvc")
@Configuration
public class SpringConfig implements WebMvcConfigurer {

    // =========================================================
    // VIEW RESOLVER
    // =========================================================

    @Bean
    public ViewResolver viewResolver() {

        InternalResourceViewResolver viewResolver =
                new InternalResourceViewResolver();

        viewResolver.setViewClass(JstlView.class);
        viewResolver.setPrefix("/WEB-INF/VIEWS/");
        viewResolver.setSuffix(".jsp");

        return viewResolver;
    }


    // =========================================================
    // DATABASE CONNECTION
    // =========================================================

    @Bean
    public DataSource dataSource() {

        DriverManagerDataSource dataSource =
                new DriverManagerDataSource();

        dataSource.setDriverClassName(
                "com.mysql.cj.jdbc.Driver");

        dataSource.setUrl(
                "jdbc:mysql://localhost:3306/iblog");

        dataSource.setUsername("root");
        dataSource.setPassword("root");

        return dataSource;
    }


    // =========================================================
    // HIBERNATE SESSION FACTORY
    // =========================================================

    @Bean
    public LocalSessionFactoryBean sessionFactory() {

        LocalSessionFactoryBean sessionFactory =
                new LocalSessionFactoryBean();

        sessionFactory.setDataSource(dataSource());

        sessionFactory.setPackagesToScan(
                "learning.spring.mvc");

        Properties hibernateProperties =
                new Properties();

        hibernateProperties.put(
                "hibernate.dialect",
                "org.hibernate.dialect.MySQLDialect");

        hibernateProperties.put(
                "hibernate.show_sql",
                "true");

        hibernateProperties.put(
                "hibernate.hbm2ddl.auto",
                "update");

        sessionFactory.setHibernateProperties(
                hibernateProperties);

        return sessionFactory;
    }


    // =========================================================
    // TRANSACTION MANAGER
    // =========================================================

    @Bean
    public HibernateTransactionManager transactionManager(
            SessionFactory sessionFactory) {

        return new HibernateTransactionManager(
                sessionFactory);
    }


    // =========================================================
    // MULTIPART RESOLVER
    // =========================================================

    @Bean
    public StandardServletMultipartResolver multipartResolver() {

        return new StandardServletMultipartResolver();
    }


    // =========================================================
    // STATIC RESOURCES
    // =========================================================

    @Override
    public void addResourceHandlers(
            ResourceHandlerRegistry registry) {

        registry.addResourceHandler("/css/**")
                .addResourceLocations("/css/");

        registry.addResourceHandler("/img/**")
                .addResourceLocations("/img/");
    }
}