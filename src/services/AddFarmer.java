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
 * Servlet implementation class AddFarmer
 */
public class AddFarmer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddFarmer() {
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
				String aadhar=request.getParameter("aadhar");
				String fname=request.getParameter("fname");
				String address=request.getParameter("address");
				String mobile=request.getParameter("mobile");
				String crops=request.getParameter("crops");
				String cid=request.getParameter("cid");
				String password=request.getParameter("password");
			
				HttpSession session = request.getSession(true); // reuse existing
			
				session.setAttribute("user",aadhar);
				Connection conn=DBconnect.getConnect();
			
				String sql="select aadhar from farmer where aadhar='"+aadhar+"'";
			
				PreparedStatement ps=conn.prepareStatement(sql);
				ResultSet r= ps.executeQuery();
			
				if(r.next())
				{
					request.getSession().setAttribute("msg", "Duplicate Aadhar ID, Records Already Exist..!!");
	        		response.sendRedirect("addFarmer.jsp"); 
				}
				else
				{
					PreparedStatement ps1=conn.prepareStatement("insert into farmer values(?,?,?,?,?,?,?,?,?)");
					ps1.setString(1,aadhar);
					ps1.setString(2,fname);
					ps1.setString(3,mobile);
					ps1.setString(4,address);
					ps1.setString(5,crops);
					ps1.setString(6,cid);
					ps1.setString(7,password);
					//ps1.setString(8,null);
					ps1.setString(8,"0");
					ps1.setString(9,"False");
					
					int n= ps1.executeUpdate();
					System.out.println("Recort inserted");
					
					if(n>=1)
					{
						request.getSession().setAttribute("msg", "Record Inserted Successfully..!!");
						response.sendRedirect("addFarmer.jsp"); 
					}
					else
					{
						request.getSession().setAttribute("msg", "Record Failed To Insert..!!");
						response.sendRedirect("addFarmer.jsp"); 
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
