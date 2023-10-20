package com.expert.demo;

import com.expert.demo.configuration.AppConfig;
import com.expert.demo.repository.DBProperties;
import com.expert.demo.repository.RepositoryDB;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class Test {
    public static void main(String[] args) {
        var context = new AnnotationConfigApplicationContext(AppConfig.class);
        var props = context.getBean(DBProperties.class);
        var repository = context.getBean(RepositoryDB.class);
        var disease_types = repository.getDiseaseTypes();
        var symptoms = repository.getSymptomsByDiseaseTypeId(1L);
        Set<Long> ids = new HashSet<>();
        for(var sympt : symptoms) {
            ids.add(sympt.getId());
        }
        List<Long> list = new ArrayList<>();
        for (var id : ids) {
            list.add(id);
        }
        var diseases = repository.getProbableDiseasesBySymptomsIds(list, 1L);
        System.out.println();
    }
}
