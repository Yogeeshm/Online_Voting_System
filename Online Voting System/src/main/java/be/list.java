package be;


import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class list
 */
@WebServlet("/list")
public class list extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public list() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Candidate> store=new ArrayList<Candidate>();// dynamic storage to keep objects
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ovs","root","");
			String qry="select * from candidate";
			PreparedStatement ps=con.prepareStatement(qry);
			ResultSet rs = ps.executeQuery();
			Candidate tmp=null;// initalize
			while(rs.next())
			{
				// convert row into object
				tmp=new Candidate();
				//tmp=new Student(rs.getString("name"), rs.getString("dept"), qry, qry, qry, qry, qry, qry, qry, serialVersionUID, serialVersionUID, null, null);
				// rs.getType("columnname")
				tmp.setCname(rs.getString("cname"));tmp.setAddress(rs.getString("address"));
				tmp.setContact(rs.getLong("contact"));tmp.setPname(rs.getString("pname"));
				tmp.setEmail(rs.getString("email"));tmp.setGender(rs.getString("gender"));
				tmp.setRegno(rs.getLong("regno"));tmp.setAge(rs.getLong("age"));
				store.add(tmp);
			}
			RequestDispatcher dis=request.getRequestDispatcher("list.jsp");
			request.setAttribute("data", store);
			dis.forward(request, response);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
