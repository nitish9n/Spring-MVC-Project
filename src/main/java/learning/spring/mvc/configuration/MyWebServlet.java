package learning.spring.mvc.configuration;

import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.servlet.DispatcherServlet;

import jakarta.servlet.MultipartConfigElement;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRegistration;

public class MyWebServlet implements WebApplicationInitializer {

    @Override
    public void onStartup(ServletContext servletContext) throws ServletException {

        AnnotationConfigWebApplicationContext annWebConfig =
                new AnnotationConfigWebApplicationContext();

        annWebConfig.register(SpringConfig.class);
        annWebConfig.setServletContext(servletContext);

        ServletRegistration.Dynamic servlet =
                servletContext.addServlet(
                        "dispatcher",
                        new DispatcherServlet(annWebConfig)
                );

        servlet.setLoadOnStartup(1);
        servlet.addMapping("/");

        // Enable multipart/form-data requests
        servlet.setMultipartConfig(
                new MultipartConfigElement(
                        System.getProperty("java.io.tmpdir"),
                        10 * 1024 * 1024,   // Maximum file size: 10 MB
                        20 * 1024 * 1024,   // Maximum request size: 20 MB
                        0
                )
        );
    }
}