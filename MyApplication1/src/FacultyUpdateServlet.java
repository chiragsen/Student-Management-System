

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class FacultyUpdateServlet
 */
public class FacultyUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FacultyUpdateServlet() {
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
		
		request.getRequestDispatcher("faculty_header.html").include(request, response);
		
		HttpSession session1 = request.getSession(false);
		String id=(String)session1.getAttribute("id");
		String pass=(String)session1.getAttribute("pass");
		
		String fname=request.getParameter("fname");
		String lname=request.getParameter("lname");
		String father=request.getParameter("father");
		String mobile=request.getParameter("mobile");
		String mail=request.getParameter("mail");
		String address=request.getParameter("address");
		String city=request.getParameter("city");
		String state=request.getParameter("state");
		
		try{
			Class.forName("oracle.jdbc.OracleDriver");
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/db1","scott","tiger");
			PreparedStatement st=conn.prepareStatement("update faculty set ft_fname=?,ft_lname=?,ft_father=?,ft_mobile=?,ft_mail=?,ft_address=?,ft_city=?,st_state=? where ft_id=? and ft_password=?");
			
				st.setString(1, fname);
				st.setString(2, lname);
				st.setString(3, father);
				st.setString(4, mobile);
				st.setString(5, mail);
				st.setString(6, address );
				st.setString(7, city);
				st.setString(8, state);
				st.setString(9, id);
				st.setString(10, pass);
				st.executeUpdate();
				out.print("successfully Updated");
				
		
			st.close();
			conn.close();
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		
		request.getRequestDispatcher("st_footer.html").include(request, response);
	}

}
