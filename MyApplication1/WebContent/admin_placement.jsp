<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import ="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link href="css/style.css" rel="stylesheet" /> 
  <link href="css/font-awesome.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
<%
HttpSession session1=request.getSession(false);
if(session1!=null)
{
%>
<div class="menubar">
        <a href="index.html"><div class="logo"><img src="images/impetus.png" width="60" height="60" alt="Logo" title="Logo" />  </div></a>
        <a href="admin_dashboard.jsp"> <div class="menu">Home </div> </a>
        <a href="admin_placement.jsp"><div class="menu"> Placements </div></a>
        <a href="admin_queryblock.jsp"><div class="menu"> Contact us </div></a>
        <a href="AdminLogout"><div class="menu"> Logout </div></a>
    </div><!--menubar -->
    
    <div class="fac_asmnt_body">
        <form action="AdminPlacement" method="post">
            <div class="fac_asmnt_row">
                <div class="fac_asmnt_inp">S No.</div>
                <input type="text" name="sno" class="fac_asmnt_val">
            </div>
            <div class="fac_asmnt_row">
                <div class="fac_asmnt_inp">Name</div>
                <input type="text" name="name" class="fac_asmnt_val">
            </div>
            <div class="fac_asmnt_row">
                <div class="fac_asmnt_inp">Domain</div>
                <input type="text" name="domain" class="fac_asmnt_val">
            </div>
            <div class="fac_asmnt_row">
                <div class="fac_asmnt_inp">Company</div>
                <input type="text" name="company" class="fac_asmnt_val">
            </div>
            
            <div class="fac_asmnt_row">
                <input type="submit" value="Submit" class="fac_asmnt_sub">
            </div>

        </form>
    </div>
    <%}%>
</body>
</html>