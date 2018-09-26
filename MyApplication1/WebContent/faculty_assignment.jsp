<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="css/style.css" rel="stylesheet" /> 
  <link href="css/font-awesome.css" rel="stylesheet" />
<title>Insert title here</title>
</head>
<body>
<div class="menubar">
    	<a href="index.html"><div class="logo"><img src="images/impetus.png" width="60" height="60" alt="Logo" title="Logo" />  </div></a>
        <a href="faculty_dashboard.jsp"> <div class="menu">Home </div> </a>
        <a href="faculty_editprofile.jsp"><div class="menu"> Edit Profile </div></a>
        <a href="faculty_attendance.jsp"><div class="menu"> Attendance </div></a>
        <a href="faculty_assignment.jsp"><div class="menu"> Assignments </div></a>
        <a href="faculty_exams.html"><div class="menu"> Exams </div></a>
        <a href="Logout.html"><div class="menu"> Logout  </div></a>
    </div><!--menubar -->

    <div class="st_dash_header">
        <div class="st_att_heading">Assignments
        </div>
    </div>

    <div class="fac_asmnt_body">
        <form action="FacultyAssignment" method="post">
            <div class="fac_asmnt_row">
                <div class="fac_asmnt_inp">Assignment Name</div>
                <input type="text" name="assingment_name" class="fac_asmnt_val">
            </div>
            <div class="fac_asmnt_row">
                <div class="fac_asmnt_inp">Assignment Topic</div>
                <input type="text" name="assingment_topic" class="fac_asmnt_val">
            </div>
            <div class="fac_asmnt_row">
                <div class="fac_asmnt_inp">Course</div>
                <select name="course" class="fac_asmnt_val">
					<option value="java">Core Java</option>
					<option value="Adv_Java">Adv. Java</option>
					<option value="Deploma_In_Java">Deploma</option>
					<option value="Python">Python</option>
				</select><br>
            </div>
            <div class="fac_asmnt_row">
                <div class="fac_asmnt_inp">Select File</div>
                <input type="File" name="assingment_file" class="fac_asmnt_val">
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
</body>
</html>