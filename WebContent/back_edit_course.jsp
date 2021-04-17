<%@ page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>



	
	<%@include file="admin_course_option.html"%>
<%
	String subject_hidden = request.getParameter("subject_hidden");
	out.print(subject_hidden);
	
	String subject = request.getParameter("subject");
	out.print(subject);
	String questions = request.getParameter("questions");
	out.print(questions);
	String time = request.getParameter("time");
	out.print(time);
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/online_examination_system", "root",
		"root");
		Statement st = con.createStatement();

		String q = "update  oes_exams_details set course_name='" + subject + "',total_question='" + questions + "',time='" + time
		+ "' WHERE course_name='" + subject_hidden + "'  ";

		st.executeUpdate(q);
		//update query

		con.close();
	} catch (Exception e) {
		out.println(e);
	}
	response.sendRedirect("add_delete_edit_courses.jsp");
	%>

</body>
</html>