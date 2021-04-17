<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%@page import="java.sql.*"%>

	<%
	HttpSession session2 = request.getSession(); // checking session 
	String session_email = (String) session2.getAttribute("adminsession");
	if (session_email != null) {
	%>
	<%
	String adminname = request.getParameter("edit_adminname");
	out.print(adminname + "   , ");
	String email = request.getParameter("email_field");
	out.print(email + "   , ");
	String password = request.getParameter("edit_adminpassword");
	out.print(password + "   , ");
	String contact = request.getParameter("edit_admincontact");
	out.print(contact + "   , ");
	String city = request.getParameter("edit_admincity");
	out.print(city + "   , ");
	String gender = request.getParameter("edit_admingender");
	out.print(gender + "   , ");
	try {
		ResultSet rs;
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/online_examination_system", "root",
		"root");
		Statement st = con.createStatement();
		String q = "update  oes_admin set adminname='" + adminname + "',password='" + password + "',contact='" + contact
		+ "',city='" + city + "',gender='" + gender + "' WHERE email='" + email + "'";
		st.executeUpdate(q);
		//update query

		con.close();
	} catch (Exception e) {
		out.println(e);
	}
	response.sendRedirect("admin_home_page.jsp");

	} else {
	response.sendRedirect("front_admin_login.jsp");
	}
	%>
</body>
</html>