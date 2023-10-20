package com.expert.demo.model;

public class Symptom {
    private long id;
    private String description;

    public Symptom(long id, String description) {
        this.id = id;
        this.description = description;
    }

    public long getId() {
        return id;
    }

    public String getDescription() {
        return description;
    }
}
