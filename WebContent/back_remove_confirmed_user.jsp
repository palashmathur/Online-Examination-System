<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


	<%@ page import="java.sql.*"%>

	<%
	String email = request.getParameter("email");
	out.print(email);

	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/online_examination_system", "root",
		"root");
		Statement st = con.createStatement();

		String q1 = "delete from OES_confirmed_users where email='" + email + "' ";
		st.executeUpdate(q1);

		con.close();
	}

	catch (Exception e) {
		out.println(e);
	}
	response.sendRedirect("showall_users.jsp");
	%>

</body>
</html>