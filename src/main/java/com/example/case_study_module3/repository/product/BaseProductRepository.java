package com.example.case_study_module3.repository.product;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class BaseProductRepository {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/case_study_web_group3";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "hau2409202";

    public BaseProductRepository() {
    }
    public static Connection getConnection(){
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(JDBC_URL,USERNAME,PASSWORD);
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }
        return connection;
    }
}
