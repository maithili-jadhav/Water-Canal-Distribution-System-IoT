package services;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import connectDB.*;

/**
 * Servlet implementation class Recharge
 */
public class Recharge extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Recharge() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
PrintWriter out=response.getWriter();
		
		{
			try
			{
				String cno=request.getParameter("cno");
		        String cvc=request.getParameter("cvv");
		        String edate=request.getParameter("day");
		        String month=request.getParameter("month");
		        String year=request.getParameter("year");
		        String cname=request.getParameter("cname");
			
				//HttpSession session = request.getSession(true); // reuse existing
			
				//session.setAttribute("user",cid);
				Connection conn=DBconnect.getConnect();
			
				PreparedStatement ps1=conn.prepareStatement("update farmer set pid = ? where mobile = ?"); 
      			ps1.setString(1,UserInfo.getPlanHours());
                ps1.setString(2,UserInfo.getMobile());
                int n1=ps1.executeUpdate();
					
					if(n1>=1)
					{
						request.getSession().setAttribute("msg", "Payment Successful..!!");
						SendSMS.SMS(UserInfo.getPlanHours(),UserInfo.getMobile());
						response.sendRedirect("rechargePlan.jsp"); 
					}
					else
					{
						request.getSession().setAttribute("msg", "Payment Unsuccessful..!!");
						response.sendRedirect("rechargePlan.jsp"); 
					}
			}
			catch (SQLException e)
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
