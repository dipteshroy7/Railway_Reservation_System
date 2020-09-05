package in.diptesh.controller;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import in.diptesh.DAO.UserDAO;
import in.diptesh.entity.UserData;
import in.diptesh.serviceDAO.UserServiceDAO;

@WebServlet("/LoginController")
public class LoginController extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{	
		String upass = request.getParameter("upass");
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			md.update(upass.getBytes());
			byte[] digestedBytes = md.digest();
			
			upass = Base64.getEncoder().encodeToString(digestedBytes);
		}
		catch (NoSuchAlgorithmException e) {}
		
		UserData userLogin = UserData.getInstance();
		userLogin.UserDataInput(request.getParameter("uemail"),upass);
		UserDAO obj = new UserServiceDAO();
		String status = obj.authenticate(userLogin);
		
		if(status.equals("true"))
		{
			HttpSession session = request.getSession();
			session.setAttribute("uemail", userLogin.getLoginEmail());
			session.setAttribute("upnr", userLogin.getPnrID());
			session.setAttribute("uname", userLogin.getName());
			session.setAttribute("ugender", userLogin.getGender());
			session.setAttribute("uage", userLogin.getAge());
  			System.out.println("LOGIN - SUCCESSFULL\n");
  			
			response.sendRedirect("home");
		}
		else if(status.equals("false"))
		{
			System.out.println("LOGIN - FAIL! WRONG CREDENTIALS\n");
			response.sendRedirect("index?status=false");
		}
		else if(status.equals("error"))
		{
			System.out.println("LOGIN - UNKNOWN ERROR!\n");
			response.sendRedirect("index?status=error");
		}
	}
}
