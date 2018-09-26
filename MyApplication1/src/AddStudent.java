

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddStudent
 */
public class AddStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddStudent() {
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
		String id=request.getParameter("id");
		String pass=request.getParameter("pass");
		String fname=request.getParameter("fname");
		String lname=request.getParameter("lname");
		String fatname=request.getParameter("fatname");
		String mob=request.getParameter("mob");
		String mail=request.getParameter("mail");
		String address=request.getParameter("address");
		String city=request.getParameter("city");
		String state=request.getParameter("state");
		String course=request.getParameter("course");
		String duration=request.getParameter("duration");
		String time=request.getParameter("time");
		String faculty=request.getParameter("faculty");
		String lno=request.getParameter("lno");
		String pno=request.getParameter("pno");
		String tfees=request.getParameter("tfees");
		String dfees=request.getParameter("dfees");
		
		
		
		try{
			Class.forName("oracle.jdbc.OracleDriver");
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/db1","scott","tiger");
			PreparedStatement st=conn.prepareStatement("insert into student values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			st.setString(1, id);
			st.setString(2, pass);
			st.setString(3, fname);
			st.setString(4, lname);
			st.setString(5, fatname);
			st.setString(6, mob);
			st.setString(7, mail);
			st.setString(8, address);
			st.setString(9, city);
			st.setString(10, state);
			st.setString(11, course);
			st.setString(12, duration);
			st.setString(13, time);
			st.setString(14, faculty);
			st.setString(15, lno);
			st.setString(16, pno);
			st.setString(17, tfees);
			st.setString(18, dfees);
			
			st.executeUpdate();
			out.print("successfully Added");
			st.close();
			conn.commit();
			conn.close();
			request.getRequestDispatcher("admin_addstudent.jsp").include(request,response);
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}

}
