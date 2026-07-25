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

import connectDB.DBconnect;
import connectDB.UserInfo;

/**
 * Servlet implementation class PostFeedback
 */
public class PostFeedback extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostFeedback() {
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
				String feedback=request.getParameter("feedback");
			
				HttpSession session = request.getSession(true); // reuse existing
			
				//session.setAttribute("user",cid);
				Connection conn=DBconnect.getConnect();
			
					PreparedStatement ps1=conn.prepareStatement("insert into feedback values(?,?,?,?,?,?)");
					ps1.setString(1,UserInfo.getFname());
					ps1.setString(2,UserInfo.getMobile());
					ps1.setString(3,UserInfo.getAddress());
					ps1.setString(4,UserInfo.getCid());
					ps1.setString(5,feedback);
					ps1.setString(6,"process");
					
					int n= ps1.executeUpdate();
					System.out.println("Recort inserted");
					
					if(n>=1)
					{
						request.getSession().setAttribute("msg", "Record Inserted Successfully..!!");
						response.sendRedirect("postFeedback.jsp"); 
					}
					else
					{
						request.getSession().setAttribute("msg", "Record Failed To Insert..!!");
						response.sendRedirect("postFeedback.jsp"); 
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
