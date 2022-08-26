package be;


import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SignupServlet
 */
@WebServlet("/SignupServlet")
public class SignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignupServlet() {
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
		String fname=request.getParameter("fname");
		String lname=request.getParameter("lname");
		String UID=request.getParameter("uid");
		String mail=request.getParameter("email");
		String phone=request.getParameter("pno");
		String pass=request.getParameter("pass");
		String gender=request.getParameter("gender");
		long pno=Long.parseLong(phone);
		
		try {
			// Driver
			Class.forName("com.mysql.cj.jdbc.Driver");
			// connection: url, username,pass
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ovs","root","");
			// writing query
			String qry="insert into login(fname,lname,UID,email,phno,pass,gender) values(?,?,?,?,?,?,?)";
			// Writing statement
			PreparedStatement ps=con.prepareStatement(qry);
			ps.setString(1, fname);ps.setString(2, lname);ps.setString(3, UID);ps.setString(4, mail);
			ps.setLong(5, pno);ps.setString(6, pass);ps.setString(7, gender);
			
			//execute 
			int ack=ps.executeUpdate();
			RequestDispatcher dis=request.getRequestDispatcher("signup.jsp");
			if(ack!=0)
			{
				System.out.println("Record inserted");
				request.setAttribute("info","account created");
			}
			else
			{
				System.out.println("Record not inserted");
				request.setAttribute("info", "account not created");
			}
			dis.forward(request, response);
			
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (SQLException e1) {
			RequestDispatcher dis=request.getRequestDispatcher("signup.jsp");
			System.out.println("Record not inserted");
			request.setAttribute("info", "Account already exists");
			dis.forward(request, response);
			e1.printStackTrace();
		
	}

	}

}
