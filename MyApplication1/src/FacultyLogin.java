

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
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class FacultyLogin
 */
public class FacultyLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FacultyLogin() {
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
		
		String id=request.getParameter("sid");
		String pass=request.getParameter("spass");
		try{
			Class.forName("oracle.jdbc.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/db1",
					"scott","tiger");
				PreparedStatement ps=conn.prepareStatement("select * from faculty where ft_id=? and ft_password=?");
				ps.setString(1, id);
				ps.setString(2, pass);
				ResultSet rs=ps.executeQuery();
				if(rs.next())
				{
					HttpSession session1=request.getSession();
					session1.setAttribute("id", id);
					session1.setAttribute("pass", pass);
					request.getRequestDispatcher("Faculty_dashboard.jsp").forward(request, response);
				}
				else
				{
					out.print("password is not valid");
					request.getRequestDispatcher("faculty_login.html").include(request, response);
				}
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
