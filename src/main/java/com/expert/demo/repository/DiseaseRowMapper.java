package com.expert.demo.repository;

import com.expert.demo.model.Disease;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class DiseaseRowMapper implements RowMapper<Disease> {
    private List<Long> symptomsIds;
    public DiseaseRowMapper(List<Long> symptomsIds) {
        this.symptomsIds = symptomsIds;
    }
    @Override
    public Disease mapRow(ResultSet rs, int rowNum) throws SQLException {
        return new Disease(rs.getLong("id"),
                rs.getString("name"),
                rs.getString("text"),
                symptomsIds);
    }


}
