package be;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Types;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CandidateServlet
 */
@WebServlet("/CandidateServlet")
public class CandidateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CandidateServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String cname = request.getParameter("Cname");
		String address = request.getParameter("Address");
		String contact = request.getParameter("Contact");
		String mail = request.getParameter("Email");
		String gender = request.getParameter("Gender");
		String age = request.getParameter("Age");
		String pname = request.getParameter("Pname");
		long pno = Long.parseLong(contact);

		try {
			// Driver
			Class.forName("com.mysql.cj.jdbc.Driver");
			// connection: url, username,pass
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ovs", "root", "");
			// writing query
			String qry = "INSERT INTO `candidate` (`regno`, `cname`, `address`, `contact`, `email`, `gender`, `age`, `pname`) VALUES (?,?,?,?,?,?,?,?);";
			// Writing statement
			PreparedStatement ps = con.prepareStatement(qry);
			ps.setNull(1, Types.NULL);
			ps.setString(2, cname);
			ps.setString(3, address);
			ps.setLong(4, pno);
			ps.setString(5, mail);
			ps.setString(6, gender);
			ps.setString(7, age);
			ps.setString(8, pname);

			// execute
			int ack = ps.executeUpdate();
			RequestDispatcher dis = request.getRequestDispatcher("admincan.jsp");
			if (ack != 0) {
				System.out.println("Record inserted");
				request.setAttribute("info", "Successful");
			} else {
				System.out.println("Record not inserted");
				request.setAttribute("info", "Unsuccessful");
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
