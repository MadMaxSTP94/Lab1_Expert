package com.expert.demo.repository;

import com.expert.demo.model.DiseaseType;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class DiseaseTypeRowMapper implements RowMapper<DiseaseType> {
    @Override
    public DiseaseType mapRow(ResultSet rs, int rowNum) throws SQLException {
        return new DiseaseType(rs.getLong("id"),
                rs.getString("name"));
    }
}
