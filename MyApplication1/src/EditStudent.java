

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
 * Servlet implementation class EditStudent
 */
public class EditStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditStudent() {
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
		
		request.getRequestDispatcher("student_header.html").include(request, response);
		
		HttpSession session1 = request.getSession(false);
		String id=(String)session1.getAttribute("id");
		String pass=(String)session1.getAttribute("pass");
		
		String id1=request.getParameter("id");
		String pass1=request.getParameter("pass");
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
		
		//String pid=request.getParameter("pid");
		//String pidnum=request.getParameter("pidnum");
		try{
			Class.forName("oracle.jdbc.OracleDriver");
			//out.println("Loaded driver sucessfully");
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/db1","scott","tiger");
			PreparedStatement st=conn.prepareStatement("update student set  st_fname=?,st_lname=?,st_father=?,st_mobile=?,st_mail=?,st_address=?,st_city=?,st_state=? where st_id=? and st_password=?");
			
				st.setString(1, fname);
				st.setString(2, lname);
				//st.setString(3, father);
				//st.setString(4, mobile);
				st.setString(5, mail);
				st.setString(6, address );
				st.setString(7, city);
				st.setString(8, state);
				st.setString(9, id);
				st.setString(10, pass);
				st.executeUpdate();
				out.print("successfully Updated");
				//request.getRequestDispatcher("DashboardServlet").include(request,response);
		
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
