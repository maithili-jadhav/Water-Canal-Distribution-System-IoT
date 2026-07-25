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

/**
 * Servlet implementation class AddCanal
 */
public class AddCanal extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCanal() {
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
				int cid=Integer.parseInt(request.getParameter("cid"));
				String cname=request.getParameter("cname");
				String croute=request.getParameter("croute");
				String clength=request.getParameter("clength");
			
				HttpSession session = request.getSession(true); // reuse existing
			
				session.setAttribute("user",cid);
				Connection conn=DBconnect.getConnect();
			
				String sql="select cid from canal where cid='"+cid+"'";
			
				PreparedStatement ps=conn.prepareStatement(sql);
				ResultSet r= ps.executeQuery();
			
				if(r.next())
				{
					request.getSession().setAttribute("msg", "Duplicate Canal ID, Records Already Exist..!!");
	        		response.sendRedirect("addCanal.jsp"); 
				}
				else
				{
					PreparedStatement ps1=conn.prepareStatement("insert into canal(cid, name, length, route) values(?,?,?,?)");
					ps1.setInt(1,cid);
					ps1.setString(2,cname);
					ps1.setString(3,clength);
					ps1.setString(4,croute);
					
					int n= ps1.executeUpdate();
					System.out.println("Recort inserted");
					
					if(n>=1)
					{
						request.getSession().setAttribute("msg", "Record Inserted Successfully..!!");
						response.sendRedirect("addCanal.jsp"); 
					}
					else
					{
						request.getSession().setAttribute("msg", "Record Failed To Insert..!!");
						response.sendRedirect("addCanal.jsp"); 
					}
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
