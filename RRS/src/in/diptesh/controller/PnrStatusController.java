package in.diptesh.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import in.diptesh.DAO.TicketDAO;
import in.diptesh.DAO.UserDAO;
import in.diptesh.entity.UserData;
import in.diptesh.serviceDAO.TicketServiceDAO;
import in.diptesh.serviceDAO.UserServiceDAO;

@WebServlet("/PnrStatusController")
public class PnrStatusController extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		HttpSession session = request.getSession();
		int pnr = Integer.parseInt(request.getParameter("pnr"));
		UserDAO userObj = new UserServiceDAO();
		String pStatus = userObj.checkPnr(pnr);
		if(pStatus != null)
		{
			if("YES".equals(pStatus))
			{
				System.out.println("PNR PRESENT");
				TicketDAO ticketObj = new TicketServiceDAO();
				int n = ticketObj.show(pnr);
				if(n==0)
				{
					session.setAttribute("pStatus", "NODATA");
					response.sendRedirect("pnr_status");
				}
				else
				{
					UserData u1 = UserData.getInstance();
					u1.setPnrStatusNum(pnr);
					session.setAttribute("pnrResPass", "YES");
					session.setAttribute("numTicket", n);
					response.sendRedirect("pnr_result");
				}
			}
			else if("error".equals(pStatus))
			{
				System.out.println("ERROR!!!\n");
				session.setAttribute("pStatus", "error");
				response.sendRedirect("pnr_status");
			}
		}
		else
		{
			System.out.println("PNR NOT PRESENT\n");
			session.setAttribute("pStatus", "NO");
			response.sendRedirect("pnr_status");
		}
	}
}
