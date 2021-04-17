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
	String adminname = request.getParameter("adminname");
	String password = request.getParameter("password");

	try {
		ResultSet rs;
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/online_examination_system", "root",
		"root");
		Statement st = con.createStatement();
		String q = "select * from OES_admin where adminname='" + adminname + "' AND password='" + password + "' ";
		rs = st.executeQuery(q);
		if (rs.next()) {
			
			HttpSession session1 = request.getSession(); //creating session
			session1.setAttribute("adminsession", adminname);

			

			response.sendRedirect("admin_home_page.jsp");

		} else {
	%>
	<div class="container">
		<div class="col-md-8 offset-md-2">

			<div class="alert alert-danger" role="alert">
				<h4 class="alert-heading">Invalide username or password</h4>
				<br>
				<p>please select a valide credentials!.</p>
				<hr>

				<a class="btn btn-danger" href="front_admin_login.jsp" role="button">Back</a>

			</div>
		</div>
	</div>

	<%
	}

	con.close();
	} catch (Exception e) {
	out.println(e);
	}
	%>
</body>
</html>