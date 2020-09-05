package in.diptesh.serviceDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Random;

import in.diptesh.DAO.UserDAO;
import in.diptesh.database.DatabaseConnection;
import in.diptesh.entity.UserData;

public class UserServiceDAO implements UserDAO
{
	public String authenticate(UserData u2)
	{
		try
		{
			Connection con = DatabaseConnection.getInstance().connect();
			if(con==null)
				System.out.println("Database connection not created - Login");
			else
			{
				System.out.println("Database connection created - Login");
				PreparedStatement ps = con.prepareStatement("SELECT * FROM RRS_USERS WHERE EMAIL=? AND PASSWORD=?");
				ps.setString(1, u2.getLoginEmail());
				ps.setString(2, u2.getLoginPassword());
				ResultSet rs = ps.executeQuery();
				if(rs.next())
				{
					u2.UserDataInput(rs.getInt("PNR_ID"), rs.getString("NAME"), rs.getString("GENDER"), rs.getInt("AGE"));
					System.out.println("Credentials Matched");
					con.close();
					System.out.println("Database connection closed - Login");
					return "true";
				}
				else
				{
					System.out.println("Credentials Didn't Matched");
					con.close();
					System.out.println("Database connection closed - Login");
					return "false";
				}
			}
		}
		catch(Exception e)
		{
			System.out.println("Some exception occured"+e);
			return "error";
		}
		return null;
	}
	
	public String registration(UserData u1)
	{
		try
		{
			Connection con = DatabaseConnection.getInstance().connect();
			if(con==null)
				System.out.println("Database connection not created - Registration");
			else
			{
				System.out.println("Database connection created - Registration");
				PreparedStatement ps1 = con.prepareStatement("SELECT EMAIL FROM RRS_USERS WHERE EMAIL = ?");
				ps1.setString(1, u1.getRegistrationEmail());
				ResultSet rs = ps1.executeQuery();
				if(rs.next()) {
					System.out.println("Email Already Exist...");
					return "dublicate_email";
				}
				else
				{
					PreparedStatement ps=con.prepareStatement("INSERT INTO RRS_USERS VALUES (?,?,?,?,?,?)");
					Random r = new Random();
					ps.setInt(1, r.nextInt(999999999)+1000000000);
					ps.setString(2, u1.getRegistrationName());
					ps.setString(3, u1.getRegistrationGender());
					ps.setString(4, u1.getRegistrationAge());
					ps.setString(5, u1.getRegistrationEmail());
					ps.setString(6, u1.getRegistrationPassword());
					int x = ps.executeUpdate();
					if(x>0) {
						System.out.println("Registration Data Recorded");
						con.close();
						System.out.println("Database connection closed - Registration");
						return "registered";
					}
					else {
						System.out.println("Some error occured inserting Data");
						return "error";
					}
				}
			}
		}
		catch(Exception e){
			System.out.println("Some Exception Occured"+e);
			return "error";
		}
		return null;
	}
	
	public String delete(UserData u3)
	{
		try
		{
			Connection con = DatabaseConnection.getInstance().connect();
			if(con==null)
				System.out.println("Database connection not created - Delete Password Check");
			else
			{
				System.out.println("Database Connection Created - Delete Password Check");
				String dPassword = u3.getDpassword();
				String userEmail = u3.getLoginEmail();
				PreparedStatement ps = con.prepareStatement("SELECT PASSWORD FROM RRS_USERS WHERE EMAIL=?");
				ps.setString(1, userEmail);
				ResultSet rs = ps.executeQuery();
				if(rs.next())
				{
					if(dPassword.equals(rs.getString("PASSWORD")))
					{
						PreparedStatement ps2 = con.prepareStatement("DELETE FROM RRS_USERS WHERE EMAIL=?");
						ps2.setString(1, userEmail);
						ps2.executeUpdate();
						System.out.println("Password Matched");
						con.close();
						System.out.println("Database Connection Closed - Delete Password Check");
						return "true";
					}
					else
					{
						System.out.println("Password Didn't Matched");
						con.close();
						System.out.println("Database Connection Closed - Delete Password Check");
						return "false";
					}
				}
				else
				{
					System.out.println("Some error occured while checking password");
					con.close();
					System.out.println("Database Connection Closed - Delete Password Check");
					return "error";
				}
			}
		}
		catch(Exception e)
		{
			System.out.println("Some Exception Occured"+e);
			return "error";
		}
		return null;
	}
	
	public String checkPnr(int pnr)
	{
		try
		{
			Connection con = DatabaseConnection.getInstance().connect();
			if(con==null)
				System.out.println("Database connection not created - PNR Check");
			else
			{
				String pStatus = null;
				System.out.println("Database Connection Created - PNR Check");
				PreparedStatement ps = con.prepareStatement("SELECT COUNT(*) FROM RRS_USERS WHERE PNR_ID = ?");
				ps.setInt(1, pnr);
				ResultSet rs = ps.executeQuery();
				int x = 0;
				if(rs.next())
					x = rs.getInt(1);
					
				if(x == 1)
					pStatus = "YES";
				
				System.out.println("PNR Checking...");
				con.close();
				System.out.println("Database Connection Closed - PNR Check");
				return pStatus;
			}
		}
		catch(Exception e)
		{
			System.out.println("Some Exception Occured"+e);
			return "error";
		}
		return null;
	}
}
