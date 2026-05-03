package com.veta.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    public static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            String url = System.getenv("DATABASE_URL");
            String user = System.getenv("DATABASE_USERNAME");
            String password = System.getenv("DATABASE_PASSWORD");

            if (url == null) url = "jdbc:mysql://localhost:3347/veta_college?useSSL=false&allowPublicKeyRetrieval=true";
            if (user == null) user = "root";
            if (password == null) password = "";

            con = DriverManager.getConnection(url, user, password);

            if (con != null) {
                System.out.println("Database Connected Successfully!");
            }

        } catch (ClassNotFoundException e) {
            System.out.println("Driver haijaonekana!");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("Imeshindwa kuunganisha na Database!");
            e.printStackTrace();
        }
        return con;
    }
}