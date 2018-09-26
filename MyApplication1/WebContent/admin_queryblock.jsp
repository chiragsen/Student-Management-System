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
    
    <div class="table">
        <table border="1" class="table2">
            <tr>
                <td>Name</td>
                <td>Number</td>
                <td>Email</td>
                <td>Message</td>
            </tr>
            <%
            try
            {
            	Class.forName("oracle.jdbc.OracleDriver");
            	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/db1",
            			"scott","tiger");
            	Statement st = conn.createStatement();
            		
            		ResultSet rs=st.executeQuery("select name,num,mail,message from query");
            		while(rs.next())
            		{


            %>
            <tr>
                <td><%=rs.getString("name")%></td>
                <td><%=rs.getString("num")%></td>
                <td><%=rs.getString("mail")%></td>
                <td><%=rs.getString("message")%></td>
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
 <%} %>   
    
</body>
</html>