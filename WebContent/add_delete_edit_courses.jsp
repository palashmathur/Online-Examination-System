<%@ page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Courses</title>

<style>
.scrollable {
	height: 350px;
	overflow-y: scroll;
}

.table-width {
	width: 1400px;
	margin-top: 140px;
	margin-left: 70px;
}
</style>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">

<script type="text/javascript" src="add_course_validation.js"></script>

<style>
.container {
	position: relative;
}
</style>

</head>
<body>

	<%
	HttpSession session2 = request.getSession(); // checking session 
	String session_email = (String) session2.getAttribute("adminsession");
	if (session_email != null) {
	%>

	<%@include file="admin_course_option.html"%>



	<div class="container" style="margin-top: 90px; width: 600px;">
		<div class="card bg-light">
			<div class="card-body mx-auto">
				<h4 class="text-center card-title mt-3">Add New Course</h4>
				<br>
				<form action="back_add_course.jsp" method="post" name="addcourseform">

					<div class="form-group input-group">

						<input type="text" placeholder="Subject Name" name="subject"
							class="form-control" id="t1" aria-describedby="emailHelp" /> <span
							id="s1"></span>
					</div>

					<div class="form-group input-group">

						<input type="text" placeholder="Total Questions"
							name="total_question" class="form-control" id="t2"
							aria-describedby="emailHelp" /> <span id="s2"></span>
					</div>
					<div class="form-group input-group">

						<input type="text" placeholder="Time (min:sec)" name="time"
							class="form-control" id="t3" aria-describedby="emailHelp" /> <span
							id="s3"></span>
					</div>

					<button type="button" name="add_course"
						class="btn btn-outline-info btn-block"
						onclick="addcoursevalidation()">Add Course</button>
				</form>
			</div>
		</div>
	</div>


	<div class="table-width table-hover text-center"
		style="margin-top: 50px;">

		<div class="card col-md-6 offset-md-3">
			<h3>Courses</h3>
			<div class="scrollable">

				<table class="table table-striped">

					<thead>
						<tr>
							<th scope="col">S.no.</th>
							<th scope="col">Course</th>
							<th scope="col">Question</th>
							<th scope="col">Time(in min)</th>
							<th scope="col">Edit</th>
							<th scope="col">Delete</th>

						</tr>
					</thead>

					<%
					try {
						Class.forName("com.mysql.jdbc.Driver");
						Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/online_examination_system", "root",
						"root");
						Statement st = con.createStatement();
						String q = "select * from OES_exams_details ";
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

							<%-- <td><a class="btn btn-outline-info" role="button"
								href='#?edit=<%=rs.getString(1)%>'>Edit</a></td>
							 --%>

							<td><a class="btn btn-info" role="button"
								href='edit_course.jsp?edit=<%=rs.getString(1)%>'>Edit</a></td>

							<td><a class="btn btn-outline-danger" role="button"
								onclick="return confirm('Are you sure You want to delete this course ?')"
								href='delete_course.jsp?delete=<%=rs.getString(1)%>'>Delete</a>
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

	<%
	} else {
	response.sendRedirect("front_admin_login.jsp");
	}
	%>





</body>
</html>