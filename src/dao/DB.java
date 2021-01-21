package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DB {
	static Connection con = null;

	public static Connection getConnection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); 
			// jar file path (located in java resource-libraries-apache tomcat)
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/classroom?useSSL=false", "root", "password");
            // driver manager establishes connection between database and user
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();   
			//prints error on console 
		}

		return con; 
	}   

}
