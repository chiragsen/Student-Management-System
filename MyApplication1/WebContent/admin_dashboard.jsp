<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="css/style.css" rel="stylesheet" /> 
  <link href="css/font-awesome.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
<%HttpSession session1=request.getSession(false);
if(session1!=null)
{ %>
<div class="menubar">
        <a href="index.html"><div class="logo"><img src="images/impetus.png" width="60" height="60" alt="Logo" title="Logo" />  </div></a>
        <a href="admin_dashboard.jsp"> <div class="menu">Home </div> </a>
        <a href="admin_placement.jsp"><div class="menu"> Placements </div></a>
        <a href="admin_queryblock.jsp"><div class="menu"> Contact us </div></a>
        <a href="AdminLogout"><div class="menu"> Logout </div></a>
    </div><!--menubar -->
    
    <center><h1>Welcome</h1></center>
    <center>
    <div class="table">
    	<table border="1" class="table3">
 	   		<tr>
                <td><a href="admin_addstudent.jsp" style="color:black;">Add Student</a></td>
            </tr>
            <tr>
                <td><a href="admin_removestudent.jsp" style="color:black;">Remove Student</a></td>
            </tr>
            <tr>
                <td><a href="admin_editstudent.jsp" style="color:black;">Edit Student</a></td>
            </tr>
            <tr>
                <td><a href="admin_studentattendance.jsp" style="color:black;">Student Attendance</a></td>
            </tr>
            <tr>
                <td><a href="admin_addfaculty.jsp" style="color:black;">Add Faculty</a></td>
            </tr>
            <tr>
                <td><a href="admin_removefaculty.jsp" style="color:black;">Remove Faculty</a></td>
            </tr>
            <tr>
                <td><a href="admin_editfaculty.jsp" style="color:black;">Edit Faculty</a></td>
            </tr>
            <tr>
                <td><a href="admin_facultyattendance.jsp" style="color:black;">Faculty Attendance</a></td>
            </tr>
		</table>    
	</div>
    </center>
    <div class="st_footer">
    <div class="footerlastrow">
                    <div class="flastrowleft">&copy; 2018 Impetus All Rights Reserved </div>
                    <div class="flastrowright"> <a href="#"><i class="fa fa-arrow-up"></i> Back to Top</a></div>
                </div>
</div>
<%} %>
</body>
</html>