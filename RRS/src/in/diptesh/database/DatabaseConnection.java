package in.diptesh.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection
{
	private static DatabaseConnection instance = new DatabaseConnection();
	
	private DatabaseConnection() {}
	
	public static DatabaseConnection getInstance()	{
		return instance;
	}
	
	public Connection connect() throws ClassNotFoundException, SQLException
	{
//		Class.forName("oracle.jdbc.driver.OracleDriver");
//		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:rrsdata","hr","hr");
//		Class.forName("com.mysql.jdbc.Driver");  
		Connection con = DriverManager.getConnection("jdbc:mysql://remotemysql.com:3306/0ZSpTR6lw5","0ZSpTR6lw5","Buw1FCRbJw");
		return con;
	}
	
}
