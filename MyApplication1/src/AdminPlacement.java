

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
 * Servlet implementation class AdminPlacement
 */
public class AdminPlacement extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminPlacement() {
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
		String sno=request.getParameter("sno");
		String name=request.getParameter("name");
		String domain=request.getParameter("domain");
		String company=request.getParameter("company");
		
		try{
			Class.forName("oracle.jdbc.OracleDriver");
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/db1","scott","tiger");
			PreparedStatement st=conn.prepareStatement("insert into placements values(?,?,?,?)");
			st.setString(1, sno);
			st.setString(2, name);
			st.setString(3, domain);
			st.setString(4, company);
			st.executeUpdate();
			out.print("successfully Added");
			st.close();
			conn.commit();
			conn.close();
			request.getRequestDispatcher("admin_placement.jsp").include(request,response);
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}

}
