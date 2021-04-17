
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
	margin-top: 100px;
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

	<form action="back_remove_confirmed_user.jsp" method="post" name="deleteform">

		<div class="table-width table-hover">

			<div class="card col-md-10 offset-md-1">
				<h1 class="text-center" style="color:#5cb85c " >Users</h1>
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
								<th scope="col">Delete</th>

							</tr>
						</thead>

						<%
						try {
							Class.forName("com.mysql.jdbc.Driver");
							Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/online_examination_system", "root",
							"root");
							Statement st = con.createStatement();
							String q = "select * from oes_confirmed_users ";
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
								<%-- <input type="hidden" value="<%=rs.getString(3)%>" name="email">
								 --%>
							<!-- 	 <td><button type="button" onclick="confirm_delete()"
										class="btn btn-danger">Danger</button></td>
							 -->
							 <td><a class="btn btn-danger" role="button" onclick="return confirm('Are you sure You want to delete this user ?')"
								href='back_remove_confirmed_user.jsp?email=<%=rs.getString(3)%>'>Delete</a></td>
							 
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

							} else {
							response.sendRedirect("front_admin_login.jsp");
							}
							%>
						
						<tbody>
						</tbody>

					</table>
				</div>
			</div>

		</div>
	</form>

	<!-- <div>
	<a class="btn btn-primary" href="#" role="button">Link</a>
</div> -->

		
</body>

</html>