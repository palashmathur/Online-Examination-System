
<%@page import="java.sql.*"%>

<!doctype html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<style>
	.scrollable {
		height: 350px;
		overflow-y: scroll;
	}

.table-width {
	width: 1400px;
	margin-top: 80px;
	margin-left: 100px;
}
</style>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
<title>Hello, world!</title>
</head>

<body>
	<%
	HttpSession session2 = request.getSession(); // checking session 
	String session_email = (String) session2.getAttribute("adminsession");
	if (session_email != null) {
	%>

	<%@include file="admin_menu.html"%>

	<div class="table-width table-hover">
		<h3 class="text-center">Confirm Registration</h3>
		<div class="card col-md-10 offset-md-1">
			<div class="scrollable">

				<table class="table table-striped">

					<thead>
						<tr>
							<th scope="col">S.no.</th>
							<th scope="col">Username</th>
							<th scope="col">Email</th>
							<th scope="col">Password</th>
							<th scope="col">Contact</th>
							<th scope="col">D.O.B.</th>
							<th scope="col">Confirm</th>
							<th scope="col">Delete</th>

						</tr>
					</thead>

					<%
					try {
						Class.forName("com.mysql.jdbc.Driver");
						Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/online_examination_system", "root",
						"root");
						Statement st = con.createStatement();
						String q = "select * from OES_registered_users ";
						ResultSet rs = st.executeQuery(q);
					%>
					<tbody>
						<%
						int x = 0;
						while (rs.next()) {
						%>

						<tr>
							<th scope="row"><%=++x%></th>
							<td><%=rs.getString(2)%></td>
							<td><%=rs.getString(3)%></td>
							<td><%=rs.getString(4)%></td>
							<td><%=rs.getString(5)%></td>
							<td><%=rs.getString(6)%></td>

							<%-- <td><a class="btn btn-success" role="button"
								onclick="return confirm('Are you sure You want to confirm this user ?')"
								href='back_confirm_user.jsp?confirm=<%=rs.getString(3)%>'>Confirm</a>
							</td>
							 --%>
							<td><a class="btn btn-success" role="button"
								onclick="return confirm('Are you sure You want to confirm this user ?')"
								href='back_confirm_user.jsp?confirm=<%=rs.getString(3)%>'>Confirm</a>
							</td>
							<td><a class="btn btn-danger" role="button"
								onclick="return confirm('Are you sure You want to delete this user ?')"
								href='back_remove_user.jsp?remove=<%=rs.getString(3)%>'>Delete</a>
							</td>
						</tr>


						<%
						}
						%>
					
					<tbody>

						<%
						con.close();

						} catch (Exception e) {
						out.println(e);

						}
						%>
					
					<tbody>
					</tbody>

				</table>
			</div>
		</div>

	</div>

	<!-- <div>
	<a class="btn btn-primary" href="#" role="button">Link</a>
</div> -->
	<%
	} else {
	response.sendRedirect("front_admin_login.jsp");
	}
	%>
</body>

</html>