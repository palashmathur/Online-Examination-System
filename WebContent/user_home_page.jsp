<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	HttpSession session1 = request.getSession(); // checking session 
	String email = (String) session1.getAttribute("username");
	if (email != null) {
	%>
	<%@include file="user_menu.html"%>

	<%
	try {
		ResultSet rs;
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/online_examination_system", "root",
		"root");
		Statement st = con.createStatement();
		String q = "select * from oes_confirmed_users where email='" + email + "' ";
		rs = st.executeQuery(q);
		if (rs.next()) {
	%>
	<div class="container text-center"
		style="margin-top: 50px; width: 700px;">
		<div class="card bg-light">
			<div class="card-body mx-auto">
				<h2>Profile</h2>

				<table class="table">
					<thead>
						<tr>
							<th>Username</th>
							<td><%=rs.getString(2)%></td>

						</tr>
					</thead>
					<tbody>
						<tr>
							<th>Email ID</th>
							<td><%=email%></td>


						</tr>
						<tr>
							<th>Password</th>
							<td><%=rs.getString(4)%></td>


						</tr>
						<tr>
							<th>Contact</th>
							<td><%=rs.getString(5)%></td>
						</tr>
						<tr>
							<th>Date Of Birth</th>
							<td><%=rs.getString(6)%></td>
						</tr>

					</tbody>
				</table>
				<span> <a class="btn btn-info" href="#" role="button"
					data-toggle="modal" data-target="#edit-userprofile-modal">Edit</a>
				</span>
			</div>
		</div>
	</div>
	<%
	}
	%>



	<!-- profile edit modal-->



	<!-- Button trigger modal -->


	<!-- Modal -->
	<form action="back_user_edit_profile.jsp"  method="post" name="editprofileform">
		<div class="modal fade" id="edit-userprofile-modal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">

			<div
				class="modal-dialog modal-dialog-centered modal-dialog-scrollable">

				<div class="modal-content">

					<div class="modal-header ">
						<div class="container text-center">
							<h5 class="modal-title" id="exampleModalLabel">Edit Profile</h5>

						</div>
						<!-- Edit profile heading -->

						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>


					</div>

					<div class="modal-body text-center">

						<div class="container">
							<table class="table table-hover">
								<thead>

									<tr>
										<th>Email ID</th>
										<td><div class="form-group input-group"
												style="margin: 0px;">
												<button type="button" class="btn btn-info"><%=email%></button>
												<input type="hidden" name="email_field" value="<%=email%>"
													class="form-control" id="t2" /> <span id="s2"></span>
											</div></td>


									</tr>
								</thead>
								<tbody>
									<tr>
										<th>Username</th>
										<td><div class="form-group input-group"
												style="margin: 0px;">
												<input type="text" value="<%=rs.getString(2)%>"
													name="edit_username" class="form-control" id="t1" /> <span
													id="s1"></span>
											</div></td>

									</tr>
									<tr>
										<th>Password</th>
										<td><div class="form-group input-group"
												style="margin: 0px;">
												<input type="text" value="<%=rs.getString(4)%>"
													name="edit_userpassword" class="form-control" id="t3" /> <span
													id="s3"></span>
											</div></td>


									</tr>
									<tr>
										<th>Contact</th>
										<td><div class="form-group input-group"
												style="margin: 0px;">
												<input type="number" value="<%=rs.getString(5)%>"
													name="edit_usercontact" class="form-control" id="t4" /> <span
													id="s4"></span>
											</div></td>
									</tr>
									<tr>
										<th>Date Of Birth</th>
										<td><div class="form-group input-group"
												style="margin: 0px;">
												<input type="date" value="<%=rs.getString(6)%>"
													name="edit_userdob" class="form-control" id="t5" /> <span
													id="s5"></span>
											</div></td>
									</tr>

								</tbody>
							</table>

						</div>
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<button type="button" name="edit" onclick="edit_profile()"
							class="btn btn-primary">Save changes</button>
					</div>

				</div>
			</div>
		</div>
	</form>
	<%
	con.close();
	} catch (Exception e) {
	out.println(e);
	}
	}

	else {
	response.sendRedirect("front_user_login.jsp");
	}
	%>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>

	<script>
		function edit_profile() {
			var conf = confirm("Do you want save changes in your profile");
			if (conf) {
				editprofileform.submit();
			}
		}
	</script>


</body>
</html>