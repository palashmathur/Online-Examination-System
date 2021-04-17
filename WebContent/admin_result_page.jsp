
<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
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
</head>
<body>

	<%@include file="admin_menu.html"%>

	<%
	//user email from session to display result

	HttpSession session1 = request.getSession(); // fatching

	String email = (String) session1.getAttribute("adminsession");

	if (email != null) {
		//result sareis user ke display kra denge database se lekr table
	%>
	<div class="table-width text-center table-hover">

		<div class="card col-md-8 offset-md-2">
		<div class="text-center">
			<h1>Results</h1>
			</div><div class="scrollable">

				<table class="table table-striped">

					<thead>
						<tr>
							<th scope="col">S.no.</th>
							<th scope="col">Username</th>
							<th scope="col">Email</th>
							<th scope="col">Subject</th>
							<th scope="col">Total Questions</th>
							<th scope="col">Correct answers</th>
							<th scope="col">Status</th>

						</tr>
					</thead>

					<%
					try {
						Class.forName("com.mysql.jdbc.Driver");
						Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/online_examination_system", "root",
						"root");
						Statement st = con.createStatement();
						String q = "select * from oes_exam_results";
						ResultSet rs = st.executeQuery(q);
					%>
					<tbody>
						<%
						int x = 0;
						while (rs.next()) {
						%>

						<tr>
							<th scope="row"><%=++x%></th>
							<td><%=rs.getString(1)%></td>
							<td><%=rs.getString(2)%></td>
							<td><%=rs.getString(3)%></td>
							<td><%=rs.getString(4)%></td>
							<td><%=rs.getString(5)%></td>
							<%
							if (rs.getString(6).equals("PASS")) {
							%><td style="background-color: #33ffad"><%=rs.getString(6)%></td>
							<%
							} else {
							%><td style="background-color: #ff4d4d"><%=rs.getString(6)%></td>
							<%
							}
							%>



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
						}

						else {
						response.sendRedirect("front_admin_login.jsp");
						}
						%>
					
					<tbody>
					</tbody>

				</table>
			</div>
		</div>

	</div>

</body>
</html>