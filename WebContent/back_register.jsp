<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">

<title>RFegister page</title>
</head>
<body>
	<%@page import="java.sql.*"%>


	<%
	String username = request.getParameter("username");
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	String confirm_password = request.getParameter("confirm_password");
	String mobile = request.getParameter("mobile");
	String dob = request.getParameter("dob");



	try {
		ResultSet rs;
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/online_examination_system", "root",
		"root");
		Statement st = con.createStatement();
		String q1 = "select * from OES_confirmed_users WHERE email='" + email + "' ";
		rs = st.executeQuery(q1);
		if (rs.next()) {
	%>
	<div class="container">
		<div class="col-md-8 offset-md-2">

			<div class="alert alert-warning" role="alert">
				<h4 class="alert-heading">This Email is already registered!</h4>
				<p>Please Select another Email ID!.</p>
				<hr>

				<a class="btn btn-secondary" href="front_register.jsp" role="button">Back</a>

			</div>
		</div>
	</div>

	<%
	} else {

	String q2 = "INSERT INTO OES_registered_users (username,email,password,mobile,dob) values('" + username + "','" + email
			+ "','" + password + "','" + mobile + "','" + dob + "')";

	st.executeUpdate(q2);
	%>
	<div class="container">
		<div class="col-md-8 offset-md-2">

			<div class="alert alert-success" role="alert">
				<h4 class="alert-heading">Successfully registered with us!</h4>
				<p>
					Now,Please wait from the admin confirmation<br>After the
					confirmation from the admin You can Sign in !.
				</p>
				<hr>

				<a class="btn btn-success" href="front_register.jsp" role="button">Back</a>

			</div>
		</div>
	</div>
	<%
	con.close();
	}
	} catch (Exception e) {
	out.println(e);

	}
	%>

</body>
</html>