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
    
     <div class="fac_asmnt_body1">
        <form action="AddStudent" method="post">
            <div class="fac_asmnt_row">
                <div class="fac_asmnt_inp">Student Id</div>
                <input type="text" name="id" class="fac_asmnt_val">
            </div>
            <div class="fac_asmnt_row">
                <div class="fac_asmnt_inp">Password</div>
                <input type="text" name="pass" class="fac_asmnt_val">
            </div>
            <div class="fac_asmnt_row">
                <div class="fac_asmnt_inp">First Name</div>
                <input type="text" name="fname" class="fac_asmnt_val">
            </div>
            <div class="fac_asmnt_row">
                <div class="fac_asmnt_inp">Last Name</div>
                <input type="text" name="lname" class="fac_asmnt_val">
            </div>
            <div class="fac_asmnt_row">
                <div class="fac_asmnt_inp">Father Name</div>
                <input type="text" name="fatname" class="fac_asmnt_val">
            </div>
            <div class="fac_asmnt_row">
                <div class="fac_asmnt_inp">Mobile No.</div>
                <input type="text" name="mob" class="fac_asmnt_val">
            </div>
            <div class="fac_asmnt_row">
                <div class="fac_asmnt_inp">Email</div>
                <input type="text" name="mail" class="fac_asmnt_val">
            </div>
            <div class="fac_asmnt_row">
                <div class="fac_asmnt_inp">Address</div>
                <input type="text" name="address" class="fac_asmnt_val">
            </div>
            <div class="fac_asmnt_row">
                <div class="fac_asmnt_inp">City</div>
                <input type="text" name="city" class="fac_asmnt_val">
            </div>
            <div class="fac_asmnt_row">
                <div class="fac_asmnt_inp">State</div>
                <input type="text" name="state" class="fac_asmnt_val">
            </div>
            <div class="fac_asmnt_row">
                <div class="fac_asmnt_inp">Course</div>
                <input type="text" name="course" class="fac_asmnt_val">
            </div>
            <div class="fac_asmnt_row">
                <div class="fac_asmnt_inp">Duration</div>
                <input type="text" name="duration" class="fac_asmnt_val">
            </div>
            <div class="fac_asmnt_row">
                <div class="fac_asmnt_inp">Timing</div>
                <input type="text" name="time" class="fac_asmnt_val">
            </div>
            <div class="fac_asmnt_row">
                <div class="fac_asmnt_inp">Faculty Name</div>
                <input type="text" name="faculty" class="fac_asmnt_val">
            </div>
            <div class="fac_asmnt_row">
                <div class="fac_asmnt_inp">Lab No.</div>
                <input type="text" name="lno" class="fac_asmnt_val">
            </div>
            <div class="fac_asmnt_row">
                <div class="fac_asmnt_inp">PC no. </div>
                <input type="text" name="pno" class="fac_asmnt_val">
            </div>
            <div class="fac_asmnt_row">
                <div class="fac_asmnt_inp">Total Fees</div>
                <input type="text" name="tfees" class="fac_asmnt_val">
            </div>
            <div class="fac_asmnt_row">
                <div class="fac_asmnt_inp">Due Fees</div>
                <input type="text" name="dfees" class="fac_asmnt_val">
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