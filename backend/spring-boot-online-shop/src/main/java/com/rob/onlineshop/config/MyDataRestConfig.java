package com.rob.onlineshop.config;

import com.rob.onlineshop.entity.Product;
import com.rob.onlineshop.entity.ProductCategory;
import org.hibernate.type.Type;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.rest.core.config.RepositoryRestConfiguration;
import org.springframework.data.rest.webmvc.config.RepositoryRestConfigurer;
import org.springframework.http.HttpMethod;
import org.springframework.web.servlet.config.annotation.CorsRegistry;

import javax.persistence.EntityManager;
import javax.persistence.metamodel.EntityType;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@Configuration
public class MyDataRestConfig implements RepositoryRestConfigurer {
    private EntityManager entityManager;

    @Autowired
    public MyDataRestConfig(EntityManager theEntityManager) {
        entityManager = theEntityManager;
    }

    @Override
    public void configureRepositoryRestConfiguration(RepositoryRestConfiguration config, CorsRegistry cors) {
        HttpMethod[] theSupportedActions = {HttpMethod.PUT, HttpMethod.POST, HttpMethod.DELETE};

        //disable above HTTP methods for Product class
        config.getExposureConfiguration()
                .forDomainType(Product.class)
                .withItemExposure((metdata, httpMethods) -> httpMethods.disable(theSupportedActions))
                .withCollectionExposure((metdata, httpMethods) -> httpMethods.disable(theSupportedActions));

        //disable above easy to be methods for ProductCategory class
        config.getExposureConfiguration()
                .forDomainType(ProductCategory.class)
                .withItemExposure((metdata, httpMethods) -> httpMethods.disable(theSupportedActions))
                .withCollectionExposure((metdata, httpMethods) -> httpMethods.disable(theSupportedActions));

        cors.addMapping("/api/**").allowedOrigins("http://localhost:4200");
        //helper method below is called to expose the id
        exposeIds(config);
    }
    private void exposeIds(RepositoryRestConfiguration config){
        //Expose entity IDs

        //get a list of all entity classes from the entity manager
        Set<EntityType<?>> entities = entityManager.getMetamodel().getEntities();

        //Create an array of the entity types
        List<Class> entityClasses = new ArrayList<>();

        //Get the entity types for the entities
        for(EntityType tempEntityType : entities){
            entityClasses.add(tempEntityType.getJavaType());
        }

        //expose the entity IDs for the array of entity/domain types
        //Better to use new Class[0] than new Class[entityClasses.size()]
        Class[] domainTypes = entityClasses.toArray(new Class[0]);
        config.exposeIdsFor(domainTypes);
    }
} 
