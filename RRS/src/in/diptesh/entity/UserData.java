package in.diptesh.entity;

public class UserData
{
	//for login process
	private String loginEmail;
	private String loginPassword;
	
	private static UserData instance = new UserData(); 
	
	private UserData() {}
	
	public static UserData getInstance() {	return instance;	}
	
	
	public void UserDataInput(String email, String password) {
		this.loginEmail = email;
		this.loginPassword = password;
	}
	public String getLoginEmail() {
		return loginEmail;
	}
	public String getLoginPassword() {
		return loginPassword;
	}
	
	//profile
	private int pnrID;
	private String name;
	private String gender;
	private int age;
	
	public void UserDataInput(int pnrID, String name, String gender, int age) {
		this.pnrID = pnrID;
		this.name = name;
		this.gender = gender;
		this.age = age;
	}
	
	public int getPnrID() {
		return pnrID;
	}
	public String getName() {
		return name;
	}
	public String getGender() {
		return gender;
	}
	public int getAge() {
		return age;
	}
	
	//for PNR Status
	private int pnrStatusNum;
	public int getPnrStatusNum() {
		return pnrStatusNum;
	}
	public void setPnrStatusNum(int pnrStatusNum) {
		this.pnrStatusNum = pnrStatusNum;
	}

	//for delete process
	private String dpassword;
	
	public String getDpassword() {
		return dpassword;
	}
	public void setDpassword(String dpassword) {
		this.dpassword = dpassword;
	}

	
	//for registration process
	private String registrationName;
	private String registrationGender;
	private String registrationAge;
	private String registrationEmail;
	private String registrationPassword;
	
	public void UserDataInput(String registrationName, String registrationGender, String registrationAge, String registrationEmail, String registrationPassword)
	{
		this.registrationName = registrationName;
		this.registrationGender = registrationGender;
		this.registrationAge = registrationAge;
		this.registrationEmail = registrationEmail;
		this.registrationPassword = registrationPassword;
	}
	
	public String getRegistrationName() {
		return registrationName;
	}
	public String getRegistrationGender() {
		return registrationGender;
	}
	public String getRegistrationAge() {
		return registrationAge;
	}
	public String getRegistrationEmail() {
		return registrationEmail;
	}
	public String getRegistrationPassword() {
		return registrationPassword;
	}

}
