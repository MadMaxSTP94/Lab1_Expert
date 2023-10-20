package com.expert.demo.model;

public class DiseaseType {
    private long id;
    private String name;

    public DiseaseType(long id, String name) {
        this.id = id;
        this.name = name;
    }

    public long getId() {
        return id;
    }

    public String getName() {
        return name;
    }
}
