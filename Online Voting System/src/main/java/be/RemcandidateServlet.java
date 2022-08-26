package be;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class RemcandidateServlet
 */
@WebServlet("/RemcandidateServlet")
public class RemcandidateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RemcandidateServlet() {
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
		String cid = request.getParameter("cid");
		System.out.println(cid);
		try
        {
        	Class.forName("com.mysql.cj.jdbc.Driver");
        	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ovs","root","");
            PreparedStatement statement = con.prepareStatement("DELETE FROM `candidate` WHERE `regno` = ?");
            statement.setString(1, cid);
            int ack=statement.executeUpdate();
            RequestDispatcher dis=request.getRequestDispatcher("admincontrol.jsp");
			if(ack!=0)
			{
				System.out.println("Record deleted");
				request.setAttribute("info","Candidate removed");
			}
			else
			{
				System.out.println("Record not deleted");
				request.setAttribute("info", "Candidate Doesn't exist");
			}
			dis.forward(request, response);
			
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		
	}
    
	}

}
