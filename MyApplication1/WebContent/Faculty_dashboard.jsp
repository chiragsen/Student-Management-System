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
		PreparedStatement ps=conn.prepareStatement("select ft_fname,ft_lname,ft_father,ft_mobile,ft_mail,ft_address,ft_city,ft_state,ft_designation,ft_qualification,ft_payment from faculty where ft_id=? and ft_password=?");
		ps.setString(1,id);
		ps.setString(2,pass);
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{


%>

<div class="menubar">
    	<a href="index.html"><div class="logo"><img src="images/impetus.png" width="60" height="60" alt="Logo" title="Logo" />  </div></a>
        <a href="Faculty_dashboard.jsp"> <div class="menu">Home </div> </a>
        <a href="faculty_editprofile.jsp"><div class="menu"> Edit Profile </div></a>
        <a href="faculty_attendance.jsp"><div class="menu"> Attendance </div></a>
        <a href="faculty_assignment.html"><div class="menu"> Assignments </div></a>
        <a href="faculty_exams.html"><div class="menu"> Exams </div></a>
        <a href="FacultyLogout"><div class="menu"> Logout  </div></a>
    </div><!--menubar -->

<div class="st_dash_header">
        <div class="st_dash_hname">Welcome <%=rs.getString("ft_fname")%>
        </div>
        <div class="st_dash_pic">
        </div>
    </div>

    <div class="st_dash_detail">
        <div class="st_dash_name">First Name
        </div>
        <div class="st_dash_val"><%=rs.getString("ft_fname")%>
        </div>
    </div>
    <div class="st_dash_detail">
        <div class="st_dash_name">Last Name
        </div>
        <div class="st_dash_val"><%=rs.getString("ft_lname")%>
        </div>
    </div>
    <div class="st_dash_detail">
        <div class="st_dash_name">Fathers Name
        </div>
        <div class="st_dash_val"><%=rs.getString("ft_father")%>
        </div>
    </div>
        <div class="st_dash_detail">
        <div class="st_dash_name">Mobile No.
        </div>
        <div class="st_dash_val"><%=rs.getString("ft_mobile")%>
        </div>
    </div>
    <div class="st_dash_detail">
        <div class="st_dash_name">Email
        </div>
        <div class="st_dash_val"><%=rs.getString("ft_mail")%>
        </div>
    </div>

    <div class="st_dash_detail_add">
        <div class="st_dash_add_name">Adderss
        </div>
        <div class="st_dash_add_val"><%=rs.getString("ft_address")%>
        </div>
    </div>

    <div class="st_dash_detail">
        <div class="st_dash_name">City
        </div>
        <div class="st_dash_val"><%=rs.getString("ft_city")%>
        </div>
    </div>
    <div class="st_dash_detail">
        <div class="st_dash_name">State
        </div>
        <div class="st_dash_val"><%=rs.getString("ft_state")%>
        </div>
    </div>
    <div class="st_dash_detail">
        <div class="st_dash_name">Designation
        </div>
        <div class="st_dash_val"><%=rs.getString("ft_designation")%>
        </div>
    </div>
    <div class="st_dash_detail">
        <div class="st_dash_name">Qualification
        </div>
        <div class="st_dash_val"><%=rs.getString("ft_qualification")%>
        </div>
    </div>
    <div class="st_dash_detail" style="margin-bottom:50px">
        <div class="st_dash_name">Payment
        </div>
        <div class="st_dash_val"><%=rs.getString("ft_payment")%>
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