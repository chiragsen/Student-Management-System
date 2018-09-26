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
<div class="menubar">
        <a href="index.html"><div class="logo"><img src="images/impetus.png" width="60" height="60" alt="Logo" title="Logo" />  </div></a>
        <a href="admin_dashboard.jsp"> <div class="menu">Home </div> </a>
        <a href="admin_placement.jsp"><div class="menu"> Placements </div></a>
        <a href="admin_queryblock.jsp"><div class="menu"> Contact us </div></a>
        <a href="AdminLogout"><div class="menu"> Logout </div></a>
    </div><!--menubar -->
<%
String id=request.getParameter("id");
try
{
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/db1",
			"scott","tiger");
	PreparedStatement ps=conn.prepareStatement("select * from faculty where ft_id=?");
	ps.setString(1, id);
	ResultSet rs=ps.executeQuery();
		while(rs.next())
		{



%>

     <div class="fac_asmnt_body1">
        <form action="FacultyUpdate" method="post">
            <div class="fac_asmnt_row">
                <div class="fac_asmnt_inp">Faculty Id</div>
                <input type="text" name="id" class="fac_asmnt_val" value="<%=rs.getString("ft_id") %>">
            </div>
            <div class="fac_asmnt_row">
                <div class="fac_asmnt_inp">Password</div>
                <input type="text" name="pass" class="fac_asmnt_val" value="<%=rs.getString("ft_password") %>">
            </div>
            <div class="fac_asmnt_row">
                <div class="fac_asmnt_inp">First Name</div>
                <input type="text" name="fname" class="fac_asmnt_val" value="<%=rs.getString("ft_fname") %>">
            </div>
            <div class="fac_asmnt_row">
                <div class="fac_asmnt_inp">Last Name</div>
                <input type="text" name="lname" class="fac_asmnt_val" value="<%=rs.getString("ft_lname") %>">
            </div>
            <div class="fac_asmnt_row">
                <div class="fac_asmnt_inp">Father Name</div>
                <input type="text" name="fatname" class="fac_asmnt_val" value="<%=rs.getString("ft_father") %>">
            </div>
            <div class="fac_asmnt_row">
                <div class="fac_asmnt_inp">Mobile No.</div>
                <input type="text" name="mob" class="fac_asmnt_val" value="<%=rs.getString("ft_mobile") %>">
            </div>
            <div class="fac_asmnt_row">
                <div class="fac_asmnt_inp">Email</div>
                <input type="text" name="mail" class="fac_asmnt_val" value="<%=rs.getString("ft_mail") %>">
            </div>
            <div class="fac_asmnt_row">
                <div class="fac_asmnt_inp">Address</div>
                <input type="text" name="address" class="fac_asmnt_val" value="<%=rs.getString("ft_address") %>">
            </div>
            <div class="fac_asmnt_row">
                <div class="fac_asmnt_inp">City</div>
                <input type="text" name="city" class="fac_asmnt_val" value="<%=rs.getString("ft_city") %>">
            </div>
            <div class="fac_asmnt_row">
                <div class="fac_asmnt_inp">State</div>
                <input type="text" name="state" class="fac_asmnt_val" value="<%=rs.getString("ft_state") %>">
            </div>
            <div class="fac_asmnt_row">
                <div class="fac_asmnt_inp">Designation</div>
                <input type="text" name="desi" class="fac_asmnt_val" value="<%=rs.getString("ft_designation") %>">
            </div>
            <div class="fac_asmnt_row">
                <div class="fac_asmnt_inp">Qualification</div>
                <input type="text" name="quli" class="fac_asmnt_val" value="<%=rs.getString("ft_qualification") %>">
            </div>
            <div class="fac_asmnt_row">
                <div class="fac_asmnt_inp">Payment</div>
                <input type="text" name="pay" class="fac_asmnt_val" value="<%=rs.getString("ft_payment") %>">
            </div>
            
            
            <div class="fac_asmnt_row">
                <input type="submit" value="Update" class="fac_asmnt_sub">
            </div>

        </form>
    </div>


           <%
		}
		conn.close();
}
catch(Exception e)
{
	e.printStackTrace();
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