package in.diptesh.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import in.diptesh.DAO.UserDAO;
import in.diptesh.entity.UserData;
import in.diptesh.serviceDAO.UserServiceDAO;

@WebServlet("/ProfileDeleteController")
public class ProfileDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		UserData user = UserData.getInstance();
		user.setDpassword(request.getParameter("dpassword"));
		UserDAO obj = new UserServiceDAO();
		String status = obj.delete(user);
		HttpSession session = request.getSession();
		
		if("true".equals(status))
		{
  			System.out.println("ACCOUNT DELETE - SUCCESSFULL");
  			RequestDispatcher rd = request.getRequestDispatcher("LogoutServlet");
  			rd.forward(request, response);
		}
		else if("false".equals(status))
		{
			session.setAttribute("dPassword", "false");
			System.out.println("PROFILE DELETE - PASSWORD DIDN'T MATCHED\n");
			response.sendRedirect("profile_delete");
		}
		else if("error".equals(status))
		{
			session.setAttribute("dPassword", "error");
			System.out.println("PROFILE DELETE - UNKNOWN ERROR!\n");
			response.sendRedirect("profile_delete");
		}
	}

}
