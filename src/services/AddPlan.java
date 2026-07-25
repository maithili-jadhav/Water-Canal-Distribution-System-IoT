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
 * Servlet implementation class AddPlan
 */
public class AddPlan extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddPlan() {
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
				int pid=Integer.parseInt(request.getParameter("pid"));
				String pname=request.getParameter("pname");
				String pprice=request.getParameter("pprice");
				String phours=request.getParameter("phours");
			
				HttpSession session = request.getSession(true); // reuse existing
			
				session.setAttribute("user",pid);
				Connection conn=DBconnect.getConnect();
			
				String sql="select pid from plan where pid='"+pid+"'";
			
				PreparedStatement ps=conn.prepareStatement(sql);
				ResultSet r= ps.executeQuery();
			
				if(r.next())
				{
					request.getSession().setAttribute("msg", "Duplicate Plan ID, Records Already Exist..!!");
	        		response.sendRedirect("addPlan.jsp"); 
				}
				else
				{
					PreparedStatement ps1=conn.prepareStatement("insert into plan values(?,?,?,?)");
					ps1.setInt(1,pid);
					ps1.setString(2,pname);
					ps1.setString(3,pprice);
					ps1.setString(4,phours);
					
					int n= ps1.executeUpdate();
					System.out.println("Recort inserted");
					
					if(n>=1)
					{
						request.getSession().setAttribute("msg", "Record Inserted Successfully..!!");
						response.sendRedirect("addPlan.jsp"); 
					}
					else
					{
						request.getSession().setAttribute("msg", "Record Failed To Insert..!!");
						response.sendRedirect("addPlan.jsp"); 
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
