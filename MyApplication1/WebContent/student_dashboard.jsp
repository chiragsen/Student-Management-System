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
String pass=(String)session1.getAttribute("pass");
try
{
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/db1",
			"scott","tiger");
		PreparedStatement ps=conn.prepareStatement("select st_fname,st_lname,st_father,st_mobile,st_mail,st_address,st_city,st_state,st_course,st_duration,st_timing,st_faculty,st_labno,st_pcno,st_totalfees,st_duefees from student where st_id=? and st_password=?");
		ps.setString(1,id);
		ps.setString(2,pass);
		ResultSet rs=ps.executeQuery();
		while(rs.next())
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
        <div class="st_dash_hname">Welcome <%=rs.getString("st_fname")%>
        </div>
        <div class="st_dash_pic">
        </div>
    </div>

    <div class="st_dash_detail">
        <div class="st_dash_name">First Name
        </div>
        <div class="st_dash_val"><%=rs.getString("st_fname")%>
        </div>
    </div>
    <div class="st_dash_detail">
        <div class="st_dash_name">Last Name
        </div>
        <div class="st_dash_val"><%=rs.getString("st_lname")%>
        </div>
    </div>
    <div class="st_dash_detail">
        <div class="st_dash_name">Fathers Name
        </div>
        <div class="st_dash_val"><%=rs.getString("st_father")%>
        </div>
    </div>
        <div class="st_dash_detail">
        <div class="st_dash_name">Mobile No.
        </div>
        <div class="st_dash_val"><%=rs.getString("st_mobile")%>
        </div>
    </div>
    <div class="st_dash_detail">
        <div class="st_dash_name">Email
        </div>
        <div class="st_dash_val"><%=rs.getString("st_mail")%>
        </div>
    </div>

    <div class="st_dash_detail_add">
        <div class="st_dash_add_name">Adderss
        </div>
        <div class="st_dash_add_val"><%=rs.getString("st_address")%>
        </div>
    </div>

    <div class="st_dash_detail">
        <div class="st_dash_name">City
        </div>
        <div class="st_dash_val"><%=rs.getString("st_city")%>
        </div>
    </div>
    <div class="st_dash_detail">
        <div class="st_dash_name">State
        </div>
        <div class="st_dash_val"><%=rs.getString("st_state")%>
        </div>
    </div>
    <div class="st_dash_detail">
        <div class="st_dash_name">Course
        </div>
        <div class="st_dash_val"><%=rs.getString("st_course")%>
        </div>
    </div>
    <div class="st_dash_detail">
        <div class="st_dash_name">Duration
        </div>
        <div class="st_dash_val"><%=rs.getString("st_duration")%>
        </div>
    </div>
    <div class="st_dash_detail">
        <div class="st_dash_name">Timing
        </div>
        <div class="st_dash_val"><%=rs.getString("st_timing")%>
        </div>
    </div>
    <div class="st_dash_detail">
        <div class="st_dash_name">Faculty
        </div>
        <div class="st_dash_val"><%=rs.getString("st_faculty")%>
        </div>
    </div>
    <div class="st_dash_detail">
        <div class="st_dash_name">Lab No.
        </div>
        <div class="st_dash_val"><%=rs.getString("st_labno")%>
        </div>
    </div>
    <div class="st_dash_detail">
        <div class="st_dash_name">PC No.
        </div>
        <div class="st_dash_val"><%=rs.getString("st_pcno")%>
        </div>
    </div>
    <div class="st_dash_detail">
        <div class="st_dash_name">Total Fees
        </div>
        <div class="st_dash_val"><%=rs.getString("st_totalfees")%>
        </div>
    </div>
    <div class="st_dash_detail" style="margin-bottom:50px">
        <div class="st_dash_name">Fees Due
        </div>
        <div class="st_dash_val"><%=rs.getString("st_duefees")%>
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