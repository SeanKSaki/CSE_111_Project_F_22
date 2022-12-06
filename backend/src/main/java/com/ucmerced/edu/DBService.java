package com.ucmerced.edu;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.web.bind.annotation.*;

import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@CrossOrigin()
@RestController
@RequestMapping("/database")
@Slf4j
//@Transactional
public class DBService {

    @Autowired
    @Qualifier("localdatabase")
    JdbcTemplate localtemplate;

    //getting all data
    static final String tables = "SELECT name from sqlite_schema where type = 'table';";
    static final String display = "select * from display;";

    @GetMapping("getDisplay")
    public List<CPUObject> getall(){
        log.info("Content from display");
        List<CPUObject> output = localtemplate.query(display, new RowMapper<CPUObject>() {
            @Override
            public CPUObject mapRow(ResultSet rs, int rowNum) throws SQLException {
                return new CPUObject(rs.getInt(1), rs.getString(2),rs.getInt(3),
                rs.getInt(4), rs.getString(5), rs.getString(6), rs.getInt(7),
                rs.getInt(8), rs.getInt(9), rs.getInt(10), rs.getInt(11),
                rs.getInt(12), rs.getInt(13), rs.getInt(14), rs.getString(15),
                rs.getString(16), rs.getString(17), rs.getString(18), rs.getString(19),
                rs.getInt(20), rs.getInt(21));
            }
        });
        return output;
    }

    public List<String> allTable(){
        log.info("all table names");
        List<String> output = localtemplate.queryForList(tables, String.class);
        return output;
    }
}