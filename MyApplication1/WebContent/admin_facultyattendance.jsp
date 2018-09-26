<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
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
    
         <div class="fac_asmnt_body1">
        <form action="AddFacultyAttendance" method="post">
            <div class="fac_asmnt_row">
                <div class="fac_asmnt_inp">Student Id</div>
                <input type="text" name="id" class="fac_asmnt_val">
            </div>
            <div class="fac_asmnt_row">
                <div class="fac_asmnt_inp">Attended Class</div>
                <input type="text" name="attended" class="fac_asmnt_val">
            </div>
            <div class="fac_asmnt_row">
                <div class="fac_asmnt_inp">Total Class</div>
                <input type="text" name="total" class="fac_asmnt_val">
            </div>
            
              <div class="fac_asmnt_row">
                <input type="submit" value="Submit" class="fac_asmnt_sub">
            </div>

        </form>
    </div>
    
        <div class="st_footer">
    <div class="footerlastrow">
                    <div class="flastrowleft">&copy; 2018 Impetus All Rights Reserved </div>
                    <div class="flastrowright"> <a href="#"><i class="fa fa-arrow-up"></i> Back to Top</a></div>
                </div>
</div>
<%} %>
</body>
</html>