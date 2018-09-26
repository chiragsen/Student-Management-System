

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
 * Servlet implementation class FacultyUpdate
 */
public class FacultyUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FacultyUpdate() {
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
		
		request.getRequestDispatcher("admin_header.html").include(request, response);
		
		//HttpSession session1 = request.getSession(false);
		
		String id=request.getParameter("id");
		String pass=request.getParameter("pass");
		String fname=request.getParameter("fname");
		String lname=request.getParameter("lname");
		String father=request.getParameter("fatname");
		String mobile=request.getParameter("mob");
		String mail=request.getParameter("mail");
		String address=request.getParameter("address");
		String city=request.getParameter("city");
		String state=request.getParameter("state");
		String desi=request.getParameter("desi");
		String quli=request.getParameter("quli");
		String pay=request.getParameter("pay");
		
		try{
			Class.forName("oracle.jdbc.OracleDriver");
			//out.println("Loaded driver sucessfully");
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/db1","scott","tiger");
			PreparedStatement st=conn.prepareStatement("update student set ft_id=?,ft_password=?,ft_fname=?,ft_lname=?,ft_father=?,ft_mobile=?,ft_mail=?,ft_address=?,ft_city=?,ft_state=?,ft_designation=?,ft_qulification=?,ft_payment=? where ft_id=?");
			
			st.setString(1, id);
			st.setString(2, pass);
			st.setString(3, fname);
			st.setString(4, lname);
			st.setString(5, father);
			st.setString(6, mobile);
			st.setString(7, mail);
			st.setString(8, address);
			st.setString(9, city);
			st.setString(10, state);
			st.setString(11, desi);
			st.setString(12, quli);
			st.setString(13, pay);
			st.setString(14, id);
			
			
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
