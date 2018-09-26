

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
 * Servlet implementation class StudentEditProfile
 */
public class StudentEditProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentEditProfile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		request.getRequestDispatcher("student_header.html").include(request, response);
		
		HttpSession session=request.getSession(false);
		
		if(session!=null)
		{
			String id=(String)session.getAttribute("id");
			String pass=(String)session.getAttribute("pass");
			//out.println("Hello, "+name+"Welcome to profile");
			
			try{
					Class.forName("oracle.jdbc.OracleDriver");
					Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/db1","scott","tiger");
					PreparedStatement ps=conn.prepareStatement("select * from student where st_id=? and st_password=?");
					ps.setString(1, id);
					ps.setString(2, pass);
					
					ResultSet rs=ps.executeQuery();
					if(rs.next())
					{
						out.print("<div class='st_main_body'>");
						out.print("<div class='st_main_left'>");
						out.print("<div class='st_main'>");
						out.print("First Name : <br>\r\n" +"</div>");
						out.print("<div class='st_main'>");
						out.print("Last Name : <br>\r\n" +"</div>");
						out.print("<div class='st_main'>");
						out.print("Fathers Name : <br>\r\n" +"</div>");
						out.print("<div class='st_main'>");
						out.print("Mobile No. : <br>\r\n" +"</div>");
						out.print("<div class='st_main'>");
						out.print("Email : <br>\r\n" +"</div>");
						out.print("<div class='st_main'>");
						out.print("Address : <br>\r\n" +"</div>");
						out.print("<div class='st_main'>");
						out.print("City : <br>\r\n" +"</div>");
						out.print("<div class='st_main'>");
						out.print("State : <br>\r\n" +"</div>");
						out.print("</div>");
						out.print("<div class='st_main_right'>");
						
						out.print("<form action='StudentUpdateServlet' method='post'>"
						+"First Name : <input type='text' name='fname' value="+rs.getString("st_fname")
						+"><br>Last Name : <input name='lname' type='text' value="+rs.getString("st_lname")
						+"><br>Father Name : <input type='text' name='father' value="+rs.getString("st_father")
						+"><br>Mobile : <input type='text' name='mobile' value="+rs.getString("st_mobile")
						+"><br>Email : <input type='text' name='mail' value="+rs.getString("st_mail")
						+"><br>Address : <input type='text' name='address' value="+rs.getString("st_address")
						+"><br>City : <input type='text' name='city' value="+rs.getString("st_city")
						+"><br>State : <input type='text' name='state' value="+rs.getString("st_state")
						+"><br><input type='submit' value='Update'>"
						+"</form>");
						out.print("</div>");
						out.print("</div>");
					}
					rs.close();
					ps.close();
					conn.close();
			}
			catch(Exception e)
			{
				System.out.println(e);
			}
		}
		else
		{
			out.print("please login first");
			request.getRequestDispatcher("studentlogin.html").include(request, response);
		}
		out.close();
		request.getRequestDispatcher("st_footer.html").include(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
