package com.rob.onlineshop.config;

import com.rob.onlineshop.entity.Product;
import com.rob.onlineshop.entity.ProductCategory;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.rest.core.config.RepositoryRestConfiguration;
import org.springframework.data.rest.webmvc.config.RepositoryRestConfigurer;
import org.springframework.http.HttpMethod;
import org.springframework.web.servlet.config.annotation.CorsRegistry;

@Configuration
public class MyDataRestConfig implements RepositoryRestConfigurer {
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
    }
} 
