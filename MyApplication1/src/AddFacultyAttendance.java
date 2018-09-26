

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
 * Servlet implementation class AddFacultyAttendance
 */
public class AddFacultyAttendance extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddFacultyAttendance() {
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
		String attended=request.getParameter("attended");
		int attend=Integer.parseInt(attended);
		String tot=request.getParameter("total");
		int total=Integer.parseInt(tot);
		
		float per=(attend/total)*100;
		
		try{
			Class.forName("oracle.jdbc.OracleDriver");
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/db1","scott","tiger");
			PreparedStatement st=conn.prepareStatement("insert into ft_attendance values(?,?,?,?)");
			st.setString(1, id);
			st.setString(2, attended);
			st.setInt(3, total);
			st.setFloat(4, per);
		
			
			st.executeUpdate();
			out.print("successfully Added");
			st.close();
			conn.commit();
			conn.close();
			request.getRequestDispatcher("admin_facultyattendance.jsp").include(request,response);
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}

}
