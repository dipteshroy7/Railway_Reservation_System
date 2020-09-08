package in.diptesh.serviceDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import in.diptesh.DAO.TicketDAO;
import in.diptesh.database.DatabaseConnection;
import in.diptesh.entity.BookingData;
import in.diptesh.entity.UserData;

public class TicketServiceDAO implements TicketDAO
{
	public void ticket()
	{
		try
		{
			UserData user = UserData.getInstance();
			String loginEmail = user.getLoginEmail();
			BookingData b1 = BookingData.getInstance();
			Connection con = DatabaseConnection.getInstance().connect();
			if(con==null)
				System.out.println("Database Connection Not created - Ticket");
			else
			{
				System.out.println("Database Connection Created - Ticket");
				PreparedStatement ps = con.prepareStatement("INSERT INTO RRS_TICKETS (PNR_ID, NAME, AGE, PHONE_NUMBER, EMAIL, DEPARTURE_LOCATION, DESTINATION_LOCATION, BOOKING_DATE, DEPARTURE_DATE, TRAIN_NAME, TRAIN_CLASS, NUMBER_OF_ADULTS, NUMBER_OF_CHILDREN, DISTANCE, TOTAL_AMOUNT) VALUES ((SELECT PNR_ID FROM RRS_USERS WHERE EMAIL = ?),?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
				ps.setString(1, loginEmail);
				ps.setString(2, b1.getBname());
				ps.setInt(3, b1.getB_age());
				ps.setString(4, b1.getBphone());
				ps.setString(5, b1.getBemail());
				ps.setString(6, b1.getDeparture());
				ps.setString(7, b1.getDestination());
				ps.setString(8, b1.getBookingDate());
				ps.setString(9, b1.getDepartureDate());
				ps.setString(10, b1.getTrainName());
				ps.setString(11, b1.getTrainClass());
				ps.setInt(12, b1.getAdultNumber());
				ps.setInt(13, b1.getChildrenNumber());
				ps.setDouble(14, b1.getDistance());
				ps.setDouble(15, b1.getPayAmount());
				int x=ps.executeUpdate();
				if(x>0)
					System.out.println("BOOKING DATA RECORDED");
				con.close();
				System.out.println("Database Connection Closed - Ticket");
				System.out.println("TICKET BOOKED!\n");
			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}

	public int show(int pnr)
	{
		try
		{
			Connection con = DatabaseConnection.getInstance().connect();
			if(con==null)
				System.out.println("Database Connection Not created - Ticket");
			else
			{
				System.out.println("Database Connection Created - Ticket");
				
				int numTicket = 0;
				PreparedStatement ps = con.prepareStatement("SELECT COUNT(*) FROM RRS_TICKETS WHERE PNR_ID = ?");
				ps.setInt(1, pnr);
				ResultSet rs = ps.executeQuery();
				if(rs.next())
					numTicket = rs.getInt(1);
				System.out.println(numTicket+" Data Available...");
				
				con.close();
				System.out.println("Database Connection Closed - Ticket\n");
				return numTicket;
			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return 0;
	}
}
