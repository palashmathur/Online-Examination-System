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
	String session_email = (String) session2.getAttribute("username");
	if (session_email != null) {

	%>
	<%
	

		String username = request.getParameter("edit_username");
		out.print(username + "   , ");
		String email = request.getParameter("email_field");
		out.print(email + "   , ");
		String password = request.getParameter("edit_userpassword");
		out.print(password + "   , ");
		String contact = request.getParameter("edit_usercontact");
		out.print(contact + "   , ");
		String dob = request.getParameter("edit_userdob");
		out.print(dob + "   , ");
		try {
			ResultSet rs;
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/online_examination_system", "root",
			"root");
			Statement st = con.createStatement();
			String q = "update  oes_confirmed_users set username='" + username + "',password='" + password + "',mobile='" + contact
			+ "',dob='" + dob + "' WHERE email='" + email + "'";
			st.executeUpdate(q);
			//update query

			con.close();
		} catch (Exception e) {
			out.println(e);
		}
		response.sendRedirect("user_home_page.jsp");
	
	}
	else{
		response.sendRedirect("front_user_login.jsp");

	}
	%>
</body>
</html>