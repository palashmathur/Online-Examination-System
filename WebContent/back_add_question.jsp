
<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	HttpSession session2 = request.getSession(); // checking session 
	String session_email = (String) session2.getAttribute("adminsession");
	if (session_email != null) {
	%>
	<%
	String subject = request.getParameter("subject");
	String question_number = request.getParameter("question_number");
	String question = request.getParameter("question");
	String option_1 = request.getParameter("option_1");
	String option_2 = request.getParameter("option_2");
	String option_3 = request.getParameter("option_3");
	String option_4 = request.getParameter("option_4");
	String correct_answer = request.getParameter("correct_option");

	try {
		ResultSet rs;
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/online_examination_system", "root",
		"root");
		Statement st = con.createStatement();
		String q = "INSERT INTO OES_exam_question values('" + question_number + "','" + subject + "','" + question + "','"
		+ option_1 + "','" + option_2 + "','" + option_3 + "','" + option_4 + "','" + correct_answer + "')";

		st.executeUpdate(q);
		con.close();

	} catch (Exception e) {
		out.println(e);

	}
	response.sendRedirect("add_question.jsp");
	} else {
	response.sendRedirect("front_admin_login.jsp");
	}
	%>
</body>
</html>