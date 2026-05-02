package com.veta.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;



public class DBConnection {
	public static Connection getConnection() {
	    Connection con = null;
	    try {
	        Class.forName("com.mysql.cj.jdbc.Driver"); 
	        
	        // Jaribu port 3306 kwanza (Port ya kawaida ya XAMPP)
	        String url = "jdbc:mysql://localhost:3347/veta_college?useSSL=false&allowPublicKeyRetrieval=true";
	        String user = "root";
	        String password = ""; // Hakikisha password ni tupu kama hujaweka kwenye XAMPP
	        
	        con = DriverManager.getConnection(url, user, password);
	        
	        if(con != null) {
	            System.out.println("Database Connected Successfully!");
	        }
	                
	    } catch (ClassNotFoundException e) {
	        System.out.println("Driver haijaonekana! Hakikisha .jar file lipo kwenye lib folder.");
	        e.printStackTrace();
	    } catch (SQLException e) {
	        System.out.println("Imeshindwa kuunganisha na Database! Angalia Port, Jina la DB, au Password.");
	        e.printStackTrace();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return con;
	}
}