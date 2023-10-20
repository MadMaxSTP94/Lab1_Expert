package com.expert.demo.repository;

import com.expert.demo.model.Disease;
import com.expert.demo.model.DiseaseType;
import com.expert.demo.model.Symptom;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

@Component
public class RepositoryDB {
    private final JdbcTemplate jdbcTemplate;

    @Autowired
    public RepositoryDB(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public List<Symptom> getSymptomsByDiseaseTypeId(Long typeId) {
        String sql = "SELECT DISTINCT * " +
                "FROM symptoms s " +
                "INNER JOIN diseases_symptoms ds ON s.id = ds.symptom_id " +
                "INNER JOIN diseases d ON ds.disease_id = d.id " +
                "WHERE d.type_id = " + typeId + ";";
        return jdbcTemplate.query(sql, new SymptomRowMapper());
    }

    public List<DiseaseType> getDiseaseTypes() {
        String sql = "SELECT * FROM disease_types;";
        return jdbcTemplate.query(sql, new DiseaseTypeRowMapper());
    }

    public List<Disease> getProbableDiseasesBySymptomsIds(List<Long> trueSymptomIds, long typeId) {
        String joinedIds = trueSymptomIds.stream().map(Object::toString).collect(Collectors.joining(","));
        String sql = "SELECT DISTINCT " +
                "d.id, " +
                "d.name, " +
                "a.text " +
                /*"(SELECT ds2.symptom_id " +
                "FROM diseases_symptoms ds2 " +
                "WHERE d.id = ds2.disease_id) AS symptoms_ids "*/
                "FROM diseases d " +
                "INNER JOIN diseases_symptoms ds ON d.id = ds.disease_id " +
                "INNER JOIN symptoms s ON ds.symptom_id = s.id " +
                "LEFT JOIN advices a ON d.id = a.disease_id " +
                "WHERE s.id IN (" + joinedIds + ") AND d.type_id = " + typeId + ";";
        List<Disease> probableDiseases = jdbcTemplate.query(sql, new DiseaseRowMapper(trueSymptomIds));
        probableDiseases.forEach(disease -> disease.calculateChance(trueSymptomIds));
        probableDiseases.sort(Comparator.comparing(Disease::getChance).reversed());
        return probableDiseases;
    }
}
