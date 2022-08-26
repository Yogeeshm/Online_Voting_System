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
 * Servlet implementation class ResultServlet
 */
@WebServlet("/ResultServlet")
public class ResultServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResultServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Votecount> store=new ArrayList<Votecount>();// dynamic storage to keep objects
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ovs","root","");
			String qry="SELECT cid, COUNT(cid) AS 'VO',cname,pname FROM result GROUP BY cid HAVING VO>0;";
			PreparedStatement ps=con.prepareStatement(qry);
			ResultSet rs = ps.executeQuery();
			Votecount tmp=null;// initalize
			while(rs.next())
			{
				// convert row into object
				tmp=new Votecount();
				tmp.setCid(rs.getString("cid"));tmp.setCname(rs.getString("cname"));
				tmp.setPname(rs.getString("pname"));tmp.setVO(rs.getLong("VO"));
				store.add(tmp);
			}
			RequestDispatcher dis=request.getRequestDispatcher("result.jsp");
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
