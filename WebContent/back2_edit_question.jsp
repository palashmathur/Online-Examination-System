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
	String question_number = request.getParameter("question_number");
	out.print(question_number);

	String subject = request.getParameter("subject");
	out.print(subject);

	String question = request.getParameter("question");
	out.print(question);

	String option1 = request.getParameter("option1");
	out.print(option1);

	String option2 = request.getParameter("option2");
	out.print(option2);

	String option3 = request.getParameter("option3");
	out.print(option3);

	String option4 = request.getParameter("option4");
	out.print(option4);

	String correct_option = request.getParameter("correct_option");
	out.print(correct_option);

	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/online_examination_system", "root",
		"root");
		Statement st = con.createStatement();

		
		String q = "update  oes_exam_question set question='" + question + "',option_1='" + option1 + "',option_2='"
		+ option2 + "',option_3='" + option3 + "',option_4='" + option4 + "',correct_option='" + correct_option
		+ "' WHERE subject='" + subject + "'  AND ques_id='"+question_number+"'  ";

		st.executeUpdate(q);

		//update query

		con.close();
	} catch (Exception e) {
		out.println(e);
	}
	response.sendRedirect("show_all_question.jsp");
	%>
</body>
</html>