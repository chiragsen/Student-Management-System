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
    
   

 
 <div class="table">
        <table border="1" class="table1">
            <tr>
                <td>Student Id</td>
                <td>Name</td>
                <td>Course</td>
                <td>View</td>
            </tr>
            <%
            try
            {
            	Class.forName("oracle.jdbc.OracleDriver");
            	//System.out.println("Loaded");
            	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/db1",
            			"scott","tiger");
            	//System.out.println("connected");
            	Statement st = conn.createStatement();
            		
            		ResultSet rs=st.executeQuery("select st_id,st_fname,st_course from student");
            		while(rs.next())
            		{


            %>
            <tr>
            <form action="admin_viewstudent.jsp" method="post">
                <td><input type="text" name="id" value="<%=rs.getString("st_id")%>"></td>
                <td><input type="text" name="fname" value="<%=rs.getString("st_fname")%>"></td>
                <td><input type="text" name="course" value="<%=rs.getString("st_course")%>"></td>
                <td><input type="submit" value="View"></td>
                </form>
            </tr>
 
 
 
 
            <%
		}
		conn.close();
}
catch(Exception e)
{
	e.printStackTrace();
}
            %>
        </table>
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