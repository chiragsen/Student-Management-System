

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class QueryBlock
 */
public class QueryBlock extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QueryBlock() {
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
		PrintWriter out=response.getWriter();
		
		String name=request.getParameter("uname");
		String ucno=request.getParameter("ucno");
		String email=request.getParameter("uemail");
		String message=request.getParameter("umessage");
		
		try{
			Class.forName("oracle.jdbc.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/db1",
					"scott","tiger");
				PreparedStatement ps=conn.prepareStatement("insert into query values(?,?,?,?)");
				ps.setString(1, name);
				ps.setString(2, ucno);
				ps.setString(3, email);
				ps.setString(4, message);
				ResultSet rs=ps.executeQuery();
				out.print("Successfully Submited");
				request.getRequestDispatcher("contactus.html").include(request,response);
				rs.close();
				ps.close();
				conn.close();
				out.close();
			}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}

}
