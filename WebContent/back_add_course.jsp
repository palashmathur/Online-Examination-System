
<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>back add course</title>
</head>
<body>

	<%
	HttpSession session2 = request.getSession(); // checking session 
	String session_email = (String) session2.getAttribute("adminsession");
	if (session_email != null) {
	%>

	<%
	String subject = request.getParameter("subject");
	String total_question = request.getParameter("total_question");
	String time = request.getParameter("time");

	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/online_examination_system", "root",
		"root");
		Statement st = con.createStatement();
		String q2 = "INSERT INTO OES_exams_details values('" + subject + "','" + total_question + "','" + time + "')";
		st.executeUpdate(q2);
		con.close();
	} catch (Exception e) {
		out.println(e);

	}
	response.sendRedirect("add_delete_edit_courses.jsp");
	} else {
	response.sendRedirect("front_admin_login.jsp");
	}
	%>
</body>
</html>