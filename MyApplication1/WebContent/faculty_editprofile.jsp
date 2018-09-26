<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import ="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="css/style.css" rel="stylesheet" /> 
  <link href="css/font-awesome.css" rel="stylesheet" /> 
<title>Insert title here</title>
</head>
<body>
<%
HttpSession session1=request.getSession(false);
if(session1!=null)
{
String id=(String)session.getAttribute("id");
String pass=(String)session.getAttribute("pass");
try
{
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/db1",
			"scott","tiger");
		PreparedStatement ps=conn.prepareStatement("select ft_fname,ft_lname,ft_father,ft_mobile,ft_mail,ft_address,ft_city,ft_state from faculty where ft_id=? and ft_password=?");
		ps.setString(1,id);
		ps.setString(2,pass);
		ResultSet rs=ps.executeQuery();
		if(rs.next())
		{


%>

   <div class="menubar">
    	<a href="index.html"><div class="logo"><img src="images/impetus.png" width="60" height="60" alt="Logo" title="Logo" /></div></a>
        <a href="faculty_dashboard.jsp"> <div class="menu"> Home </div> </a>
        <a href="faculty_editprofile.jsp"><div class="menu"> Edit Profile </div></a>
        <a href="faculty_attendance.jsp"><div class="menu"> Attendance </div></a>
        <a href="faculty_assignments.html"><div class="menu"> Assignments </div></a>
        <a href="faculty_exams.html"><div class="menu"> Exams </div></a>
        <a href="FacultyLogout"><div class="menu"> Logout  </div></a>
    </div><!--menubar -->
    
<div class="st_main_body">
    <div class="st_main_left">

        <div class="st_main">
            First Name : <br>
        </div>
        <div class="st_main">
            Last Name : <br>
        </div>
        <div class="st_main">
            Fathers Name : <br>
        </div>
        <div class="st_main">
            Mobile No. : <br>
        </div>
        <div class="st_main">
            Email : <br>
        </div>
        <div class="st_main">
            Address : <br>
        </div>
        <div class="st_main">
            City : <br>
        </div>
        <div class="st_main">
            State : <br>
        </div>
        

    </div>
<form action="FacultyUpdateServlet" method="post">
    <div class="st_main_right">
	
        <div class="st_main">
            <input type="text" name="fname" value="<%=rs.getString("ft_fname")%>"><br>
        </div>
        <div class="st_main">
            <input type="text" name="lname" value="<%=rs.getString("ft_lname")%>"><br>
        </div>
        <div class="st_main">
            <input type="text" name="father" value="<%=rs.getString("ft_father")%>"><br>
        </div>
        <div class="st_main">
            <input type="text" name="mobile" value="<%=rs.getString("ft_mobile")%>"><br>
        </div>
        <div class="st_main">
            <input type="text" name="mail" value="<%=rs.getString("ft_mail")%>"><br>
        </div>
        <div class="st_main">
            <input type="text" name="address" value="<%=rs.getString("ft_address")%>"><br>
        </div>
        <div class="st_main">
            <input type="text" name="city" value="<%=rs.getString("ft_city")%>"><br>
        </div>
        <div class="st_main">
            <input type="text" name="state" value="<%=rs.getString("ft_state")%>"><br>
        </div>
    </div>
    <div align="center"><input type="submit" value="Update"></div>
</form>
</div>


    <%		}
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
 %> 

    <div class="footerlastrow">
                    <div class="flastrowleft">&copy; 2018 Impetus All Rights Reserved </div>
                    <div class="flastrowright"> <a href="#"><i class="fa fa-arrow-up"></i> Back to Top</a></div>
                </div>
</body>
</html>