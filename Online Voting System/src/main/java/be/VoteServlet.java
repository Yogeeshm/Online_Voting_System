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
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class VoteServlet
 */
@WebServlet("/VoteServlet")
public class VoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VoteServlet() {
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
		HttpSession session2=request.getSession();
		String uid=(String)session2.getAttribute("uname");
		String canid=request.getParameter("cid");
		long cid=Long.parseLong(canid);
		try {
			// Driver
			Class.forName("com.mysql.cj.jdbc.Driver");
			// connection: url, username,pass
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ovs","root","");
			// writing query
			String qry="insert into vote(uid,cid) values(?,?)";
			// Writing statement
			PreparedStatement ps=con.prepareStatement(qry);
			ps.setString(1, uid);ps.setLong(2, cid);
			
			//execute 
			int ack=ps.executeUpdate();
			RequestDispatcher dis=request.getRequestDispatcher("vote.jsp");
			if(ack!=0)
			{
				System.out.println("Vote Successful");
				request.setAttribute("info","Vote Successful");
			}
			else
			{
				System.out.println("You already voted or The candidate doesn't exist ");
				request.setAttribute("info", "You already voted or The candidate doesn't exist ");
			}
			dis.forward(request, response);
			
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (SQLException e1) {
			RequestDispatcher dis=request.getRequestDispatcher("vote.jsp");
			System.out.println("Record not inserted");
			request.setAttribute("info", "You have already voted");
			dis.forward(request, response);
			e1.printStackTrace();
		
	}

	}

}
