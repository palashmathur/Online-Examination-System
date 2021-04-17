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
	<%@page import="java.sql.*"%>

	<%
	String question_number = request.getParameter("question_number");
	String subject = request.getParameter("subject");
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/online_examination_system", "root",
		"root");
		Statement st = con.createStatement();

		String q = "delete from oes_exam_question where ques_id='" + question_number + "' AND subject='" + subject + "' ";
		st.executeUpdate(q);

		int count = 1;
		String q1 = "select * from oes_exam_question where subject='" + subject + "' ";
		ResultSet rs = st.executeQuery(q1);
		while (rs.next()) {
			count = count + 1;
		}

		int a = Integer.parseInt(question_number);
		for (int i = 1; i <= count; i++) {
			int c = a + 1;
			String up = String.valueOf(c);
			int mi = c - 1;
			String d = String.valueOf(mi);
			String q2 = "update  oes_exam_question set  ques_id='" + d + "' where ques_id='" + c + "' AND subject='"
			+ subject + "' ";
			st.executeUpdate(q2);
			a++;
		}

		con.close();
	} catch (Exception e) {
		out.println(e);
	}

	response.sendRedirect("show_all_question.jsp");
	} else {
	response.sendRedirect("front_admin_login.jsp");
	}
	%>


</body>
</html>





