<%@ page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

</head>
<body>
	<%@include file="admin_course_option.html"%>

	<%
	String subject = request.getParameter("edit");
	out.println(subject);

	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/online_examination_system", "root",
		"root");
		Statement st = con.createStatement();
		String q = "select * from oes_exams_details where course_name='" + subject + "' ";
		ResultSet rs = st.executeQuery(q);
		if (rs.next()) {
	%>

	<!-- Edit profile heading -->
	<form action="back_edit_course.jsp" method="post" name="editform">

		<div class="container rounded"
			style="width: 500px; margin-top: 100px; box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.4);">

			<h1 class="text-center">Edit Course</h1>

			<table class="table">


				<tr>
					<th>Exam name</th>
					<td><div class="form-group input-group" style="margin: 0px;">

							<input type="text" name="subject" value="<%=rs.getString(1)%>"
								class="form-control text-center" id="t2" /> <input
								type="hidden" name="subject_hidden" value="<%=rs.getString(1)%>"
								class="form-control text-center" />
						</div></td>


				</tr>
				<tr>
					<th>Questions</th>
					<td><div class="form-group input-group" style="margin: 0px;">

							<input type="text" name="questions" value="<%=rs.getString(2)%>"
								class="form-control text-center" id="t2" />
						</div></td>


				</tr>
				<tr>
					<th>Time</th>
					<td><div class="form-group input-group" style="margin: 0px;">

							<input type="text" name="time" value="<%=rs.getString(3)%>"
								class="form-control text-center" id="t2" />
						</div></td>


				</tr>
				<tr>
			</table>
			<div style="padding: 10px; margin-left: 155px;">
				<button style="width: 300px;" type="button" onclick="confirm_box()"
					class="btn btn-primary">Save changes</button>
			</div>
		</div>
	</form>

	<%
	}
	con.close();
	}

	catch (Exception e) {
	out.println(e);
	}
	%>

	<script>
		function confirm_box() {
			var conf = confirm("do you want to save the changes!");
if(conf){
	editform.submit();
}
		}
	</script>
</body>
</html>