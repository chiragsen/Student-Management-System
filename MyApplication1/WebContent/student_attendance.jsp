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
String id=(String)session1.getAttribute("id");

try
{
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/db1",
			"scott","tiger");
		PreparedStatement ps=conn.prepareStatement("select student.st_fname,st_attendance.st_attended,st_attendance.st_total,st_attendance.st_per from student inner join st_attendance on student.st_id=st_attendance.st_id where student.st_id=?");
		ps.setString(1,id);
		
		ResultSet rs=ps.executeQuery();
		if(rs.next())
		{


%>
	<div class="menubar">
    	<a href="index.html"><div class="logo"><img src="images/impetus.png" width="60" height="60" alt="Logo" title="Logo" />  </div></a>
        <a href="student_dashboard.jsp"> <div class="menu">Home </div> </a>
        <a href="student_editprofile.jsp"><div class="menu"> Edit Profile </div></a>
        <a href="student_attendance.jsp"><div class="menu"> Attendance </div></a>
        <a href="student_assignment.html"><div class="menu"> Assignments </div></a>
        <a href="student_exams.html"><div class="menu"> Exams </div></a>
        <a href="StudentLogout"><div class="menu"> Logout  </div></a>
    </div><!--menubar -->



    <div class="st_dash_header">
        <div class="st_att_heading">Attendance
        </div>
    </div>

    <div class="st_att_table">
        <div class="st_att_tab_row">
            <div class="st_att_tab_col" style="border-right: 2px solid black">Name
            </div>
            <div class="st_att_tab_col"><%=rs.getString("st_fname")%>
            </div>
        </div>
        <div class="st_att_tab_row">
            <div class="st_att_tab_col" style="border-right: 2px solid black">Attended Class
            </div>
            <div class="st_att_tab_col"><%=rs.getInt("st_attended")%>
            </div>
        </div>
        <div class="st_att_tab_row">
            <div class="st_att_tab_col" style="border-right: 2px solid black">Total Class
            </div>
            <div class="st_att_tab_col"><%=rs.getInt("st_total")%>
            </div>
        </div>
        <div class="st_att_tab_row">
            <div class="st_att_tab_col" style="border-right: 2px solid black">Percentage Attendance
            </div>
            <div class="st_att_tab_col"><%=rs.getFloat("st_per")%>%    
            </div>
        </div>
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

    <div class="st_footer">
    <div class="footerlastrow">
                    <div class="flastrowleft">&copy; 2018 Impetus All Rights Reserved </div>
                    <div class="flastrowright"> <a href="#"><i class="fa fa-arrow-up"></i> Back to Top</a></div>
                </div>
</div>
	
</body>
</html>