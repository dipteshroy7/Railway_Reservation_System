package in.diptesh.entity;

import java.sql.ResultSet;

public class BookingData
{
	private String bname;
	private int b_age;
	private String bphone;
	private String bemail;
	private String departure;
	private String destination;
	private String departureDate;
	private String bookingDate;
	private String trainName;
	private String trainClass;
	private int adultNumber;
	private int childrenNumber;
	private int fare;
	private double baseFare;
	private double classFare;
	private double distance;
	private double payAmount;
	private ResultSet rs;
	
	private static BookingData instance = new BookingData();
	
	private BookingData() {}
	
	public static BookingData getInstance() {
		return instance;
	}
	
	public void BookingDataInput(String bname, int b_age, String bphone, String bemail, String departure, String destination,
						String departureDate, String bookingDate, String trainName, String trainClass, int adultNumber, int childrenNumber) {
		this.bname = bname;
		this.b_age = b_age;
		this.bphone = bphone;
		this.bemail = bemail;
		this.departure = departure;
		this.destination = destination;
		this.departureDate = departureDate;
		this.bookingDate = bookingDate;
		this.trainName = trainName;
		this.trainClass = trainClass;
		this.adultNumber = adultNumber;
		this.childrenNumber = childrenNumber;
	}

	public String getBname() {
		return bname;
	}
	public int getB_age() {
		return b_age;
	}
	public String getBphone() {
		return bphone;
	}
	public String getBemail() {
		return bemail;
	}
	public String getDeparture() {
		return departure;
	}
	public String getDestination() {
		return destination;
	}
	public String getDepartureDate() {
		return departureDate;
	}
	public String getBookingDate() {
		return bookingDate;
	}
	public String getTrainName() {
		return trainName;
	}
	public String getTrainClass() {
		return trainClass;
	}
	public int getAdultNumber() {
		return adultNumber;
	}
	public int getChildrenNumber() {
		return childrenNumber;
	}
	public int getFare() {
		return fare;
	}
	public void setFare(int fare) {
		this.fare = fare;
	}
	public double getBaseFare() {
		return baseFare;
	}
	public void setBaseFare(double baseFare) {
		this.baseFare = baseFare;
	}
	public double getClassFare() {
		return classFare;
	}
	public void setClassFare(double classFare) {
		this.classFare = classFare;
	}
	public double getDistance() {
		return distance;
	}
	public void setDistance(double distance) {
		this.distance = distance;
	}
	public double getPayAmount() {
		return payAmount;
	}
	public void setPayAmount(double payAmount) {
		this.payAmount = payAmount;
	}
	
	public ResultSet getResTable() {
		return rs;
	}
	public void setResTable(ResultSet rs) {
		this.rs = rs;
	}
}
