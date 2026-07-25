package services;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connectDB.*;

/**
 * Servlet implementation class Login
 */
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public Login() {
        // TODO Auto-generated constructor stub
    	super();
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
		
		String email=request.getParameter("email");
		String pass=request.getParameter("password");
		if(email.equals("admin@gmail.com") && pass.equals("admin"))
		{
			response.sendRedirect("addCanal.jsp");
		}
		else
		{
			try
			{
				Connection conn=DBconnect.getConnect();
				PreparedStatement ps = conn.prepareStatement("select * from  farmer where mobile=? and password=?");
				ps.setString(1, email);
				ps.setString(2, pass);
				ResultSet rs = ps.executeQuery();
				if(rs.next())
				{
					UserInfo.setFname(rs.getString("name"));
					UserInfo.setMobile(rs.getString("mobile"));
					UserInfo.setAddress(rs.getString("address"));
					UserInfo.setCid(rs.getString("cid"));
					response.sendRedirect("viewCanalFarmer.jsp");
				}
				else
				{
					request.getSession().setAttribute("msg", "Wrong User Credentials..!!");
					response.sendRedirect("login.jsp");
				}
			}
			catch (Exception e)
			{
				e.printStackTrace();
			}
		}
	}
}
