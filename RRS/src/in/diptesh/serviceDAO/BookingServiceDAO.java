package in.diptesh.serviceDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import in.diptesh.DAO.BookingDAO;
import in.diptesh.database.DatabaseConnection;
import in.diptesh.entity.BookingData;

public class BookingServiceDAO implements BookingDAO
{
	public String billPricing(BookingData b1)
	{
		try
		{
			String departure = b1.getDeparture();
			String destination = b1.getDestination();
			String trainName = b1.getTrainName();
			String trainClass = b1.getTrainClass();
			int adultNumber = b1.getAdultNumber();
			int childrenNumber = b1.getChildrenNumber();		

			Connection con = DatabaseConnection.getInstance().connect();
			if(con==null)
				System.out.println("Database Connection Not Created - Billing");
			else
			{
				System.out.println("Database Connection Created - Billing");
				PreparedStatement ps= con.prepareStatement("SELECT FARE,DISTANCE FROM RRS_ROUTE_FARE WHERE DEPARTURE_LOCATION=? AND DESTINATION_LOCATION=?");
				ps.setString(1, departure);
				ps.setString(2, destination);
				ResultSet rs= ps.executeQuery();
				int fare = 0;Double distance = 0.0;
				while(rs.next())
				{
					fare = rs.getInt("FARE");
					distance = rs.getDouble("DISTANCE");
				}
				PreparedStatement ps2= con.prepareStatement("SELECT * FROM RRS_TRAINS WHERE TRAIN_NAME=?");					
				ps2.setString(1, trainName);
				ResultSet rs2= ps2.executeQuery();
				Double baseFare = 0.0, classFare = 0.0;
				
				if(trainClass.equals("Sleeper Class (SL)"))
					trainClass = "SLEEPER_CLASS";
				
				else if(trainClass.equals("AC Third Class (3A)"))
					trainClass = "THIRD_CLASS";
				
				else if(trainClass.equals("AC Second Class (2A)"))
					trainClass = "SECOND_CLASS";
				
				else if(trainClass.equals("AC First Class (1A)"))
					trainClass = "FIRST_CLASS";
				
				while(rs2.next()){
					baseFare = rs2.getDouble("SLEEPER_CLASS");
					classFare = rs2.getDouble(trainClass);
				}
								
				b1.setFare(fare);
				b1.setBaseFare(baseFare);
				b1.setClassFare(classFare);
				b1.setDistance(distance);
				b1.setPayAmount((fare*classFare*adultNumber)+(fare*classFare*0.8*childrenNumber));
				
				System.out.println("Collecting Billing Info");
				System.out.println("Database Connection Closed - Billing");
				con.close();
				
				return "done";
			}
		}
		catch(Exception e)
		{
			return "error";
		}
	return null;
	}
}
