package com.expert.demo.repository;

import com.expert.demo.model.Symptom;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class SymptomRowMapper implements RowMapper<Symptom> {
    @Override
    public Symptom mapRow(ResultSet rs, int rowNum) throws SQLException {
        return new Symptom(rs.getLong("id"),
                rs.getString("description"));
    }
}
