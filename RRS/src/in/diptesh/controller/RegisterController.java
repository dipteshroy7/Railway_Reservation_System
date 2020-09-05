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

import in.diptesh.entity.UserData;
import in.diptesh.serviceDAO.UserServiceDAO;

@WebServlet("/RegisterController")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String pass = request.getParameter("rpass");
		String passcon = request.getParameter("rconpass");
		
		if(pass.equals(passcon))
		{
			try {
				MessageDigest md = MessageDigest.getInstance("SHA-256");
				md.update(pass.getBytes());
				byte[] digestedBytes = md.digest();
				pass = Base64.getEncoder().encodeToString(digestedBytes);
			}
			catch (NoSuchAlgorithmException e) {}
			
			UserData userRegistration = UserData.getInstance();
			userRegistration.UserDataInput(request.getParameter("rname"),request.getParameter("rgender"),request.getParameter("r_age"),request.getParameter("remail"),pass);
			UserServiceDAO obj = new UserServiceDAO();
			String status = obj.registration(userRegistration);
			
			if(status.equals("dublicate_email"))
			{
				System.out.println("Registraion - DUPLICATE EMAIL ERROR\n");
				response.sendRedirect("signup?status=dublicate_email");
			}
			else if(status.equals("registered"))
			{
				System.out.println("Registraion - SUCCESSFULL\n");
				response.sendRedirect("index?status=registered");
			}
			else if(status.equals("error"))
			{
				System.out.println("Registraion - UNKNOWN ERROR\n");
				response.sendRedirect("signup?status=error");
			}
		}
		else
		{
			System.out.println("Registraion - ERROR! CONFIRM PASSWORD DIDN'T MATCH\n");
			response.sendRedirect("signup?status=password_mismatch");
		}
			
	}

}
