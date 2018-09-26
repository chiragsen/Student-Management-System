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



<div class="menubar">
    	<a href="index.html"><div class="logo"><img src="images/impetus.png" width="60" height="60" alt="Logo" title="Logo" />  </div></a>
        <a href="index.html"> <div class="menu">Home </div> </a>
        <a href="aboutus.html"><div class="menu"> About us </div></a>
        <a href="courses.html"><div class="menu"> Courses </div></a>
        <a href="placements.jsp"><div class="menu">Placements  </div></a>
        <a href="gallery.html"><div class="menu">Gallery</div></a>
        <a href="contactus.html"><div class="menu"> Contact us </div></a>
		    	
    
    </div><!--menubar -->
    
    <div class="slider"><img src="images/slide3.jpg" width="100%" height="480px"> </div> <!-- slider-->

    <div class="table">
    <h1>Recent Placements</h1><hr>
        <table border="1" class="table1">
            <tr>
                <td>S No</td>
                <td>Name</td>
                <td>Domain</td>
                <td>Company</td>
            </tr>
            <%
            try
            {
            	Class.forName("oracle.jdbc.OracleDriver");
            	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/db1",
            			"scott","tiger");
            	Statement st = conn.createStatement();
            		
            		ResultSet rs=st.executeQuery("select s_no,name,domain,company from placements");
            		while(rs.next())
            		{


            %>
            <tr>
                <td><%=rs.getInt("s_no")%></td>
                <td><%=rs.getString("name")%></td>
                <td><%=rs.getString("domain")%></td>
                <td><%=rs.getString("company")%></td>
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





    <div class="footer"> 
        <div class="footerblock">
            <div class="fcol">
                <div class="fcolhead"> About Us </div>
                <div class="fmenu"><a href="#"> Home</a></div>
                <div class="fmenu"><a href="#"> Placements </a></div>
                <div class="fmenu"> <a href="#"> Gallery</a></div>
            </div>
            <div class="fcol">
                <div class="fcolhead"> ACADEMIC </div>
                <div class="fmenu"><a href="#"> Courses</a></div>
                <div class="fmenu"><a href="#"> Student Panel</a></div>
                <div class="fmenu"> <a href="#"> Faculty Panal</a></div>
            </div>
            <div class="fcol">
                <div class="fcolhead"> PORTALS </div>
                <div class="fmenu"> <a href="#"> Assignments</a></div>
                <div class="fmenu"> <a href="#"> Exams</a></div>
                <div class="fmenu"> <a href="#"> Upcoming Batch</a></div>
            </div>
            <div class="fcol w400">
                <div class="developerhead"> Developed By </div>
                    <div class="companyblock"> 
                        <div class="developer"> Developer Name </div>
                            <div class="developer"> 
                                <img src="images/webbed.png" width="200" height="40"> 
                            </div>
                            <div class="sociallink"> 
                                <div class="radiusblock"><a href="https://www.facebook.com/DhakadComputer/"><i class="fa fa-facebook"></i> </a>  </div> 
                                <div class="radiusblock"><a href="#"><i class="fa fa-twitter"></i> </a>  </div> 
                                <div class="radiusblock"><a href="#"><i class="fa fa-skype"></i> </a>  </div> 
                                <div class="radiusblock"><a href="#"><i class="fa fa-linkedin"></i> </a>  </div>
                                <div class="contactno"><i class="fa fa-phone"></i> Call: 0291-2551566 </div> 
                            </div><!--sociallink-->
                        </div> <!--companyblock-->
                    </div> <!--fcol-->
                </div><!--footerblock -->

                <div class="footerlastrow">
                    <div class="flastrowleft">&copy; 2018 Impetus All Rights Reserved </div>
                    <div class="flastrowright"> <a href="#"><i class="fa fa-arrow-up"></i> Back to Top</a></div>
                </div>
            </div> <!--footer-->
</body>
</html>