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
 * Servlet implementation class ChangePassword
 */
public class ChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePassword() {
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
				String old=request.getParameter("old");
				String latest=request.getParameter("latest");
			
				//HttpSession session = request.getSession(true); // reuse existing
			
				//session.setAttribute("user",cid);
				Connection conn=DBconnect.getConnect();
			
				String sql="select * from farmer where mobile='"+UserInfo.getMobile()+"'";
			
				PreparedStatement ps=conn.prepareStatement(sql);
				ResultSet r= ps.executeQuery();
			
				if(r.next())
				{
					if(r.getString("password").equals(old))
					{
						PreparedStatement ps1=conn.prepareStatement("update farmer set password = ? where mobile = ?"); 
		      			ps1.setString(1,latest);
		                ps1.setString(2,UserInfo.getMobile());
		                int n1=ps1.executeUpdate();
		                if(n1>=1)
		                {
		                	request.getSession().setAttribute("msg", "Password reset successfully..!!");
			        		response.sendRedirect("changePassword.jsp");
		                }
		                else
		                {
		                	request.getSession().setAttribute("msg", "Failed to reset password..!!");
			        		response.sendRedirect("changePassword.jsp");
		                }
				
					}
					else
					{
						request.getSession().setAttribute("msg", "Old password is wrong..!!");
		        		response.sendRedirect("changePassword.jsp");
					}
					
				}
				else
				{
					
						request.getSession().setAttribute("msg", "Records Not Found..!!");
		        		response.sendRedirect("changePassword.jsp");
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
