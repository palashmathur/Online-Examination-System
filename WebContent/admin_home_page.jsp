
<%@page import="java.sql.*"%>

<!doctype html>
<html lang="en">

<head>
<!-- Required meta tags -->
<script type="text/javascript" src="js_register_validation.js">
	
</script>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css
 ">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">


<title>Sign up</title>
</head>

<body>
	<%
	HttpSession session2 = request.getSession(); // checking session 
	String session_email = (String) session2.getAttribute("adminsession");
	if (session_email != null) {
	%>


	<%@include file="admin_menu.html"%>
	<%
	String adminname = "palash";
	String password = "palash30";
	try {
		ResultSet rs;
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/online_examination_system", "root",
		"root");
		Statement st = con.createStatement();
		String q = "select * from OES_admin where adminname='" + adminname + "' AND password='" + password + "' ";
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
							<td><%=rs.getString(1)%></td>

						</tr>
					</thead>
					<tbody>
						<tr>
							<th>Email ID</th>
							<td><%=rs.getString(3)%></td>


						</tr>
						<tr>
							<th>Password</th>
							<td><%=rs.getString(2)%></td>


						</tr>
						<tr>
							<th>Contact</th>
							<td><%=rs.getString(4)%></td>
						</tr>
						<tr>
							<th>City</th>
							<td><%=rs.getString(5)%></td>
						</tr>
						<tr>
							<th>Gender</th>
							<td><%=rs.getString(6)%></td>
						</tr>

					</tbody>
				</table>
				<span> <a class="btn btn-info" href="#" role="button"
					data-toggle="modal" data-target="#edit-profile-modal">Edit</a>
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
	<form action="back_admin_edit_profile.jsp" method="post" name="editadminprofile">
		<div class="modal fade" id="edit-profile-modal" tabindex="-1"
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
												<button type="button" class="btn btn-info"><%=rs.getString(3)%></button>
												<input type="hidden" name="email_field"
													value="<%=rs.getString(3)%>" class="form-control" id="t2" />
												<span id="s2"></span>
											</div></td>


									</tr>
								</thead>
								<tbody>
									<tr>
										<th>Username</th>
										<td><div class="form-group input-group"
												style="margin: 0px;">
												<input type="text" value="<%=rs.getString(1)%>"
													name="edit_adminname" class="form-control" id="t1" /> <span
													id="s1"></span>
											</div></td>

									</tr>
									<tr>
										<th>Password</th>
										<td><div class="form-group input-group"
												style="margin: 0px;">
												<input type="text" value="<%=rs.getString(2)%>"
													name="edit_adminpassword" class="form-control" id="t3" />
												<span id="s3"></span>
											</div></td>


									</tr>
									<tr>
										<th>Contact</th>
										<td><div class="form-group input-group"
												style="margin: 0px;">
												<input type="number" value="<%=rs.getString(4)%>"
													name="edit_admincontact" class="form-control" id="t4" /> <span
													id="s4"></span>
											</div></td>
									</tr>
									<tr>
										<th>City</th>
										<td><div class="form-group input-group"
												style="margin: 0px;">
												<input type="text" value="<%=rs.getString(5)%>"
													name="edit_admincity" class="form-control" id="t5" /> <span
													id="s5"></span>
											</div></td>
									</tr>
									<tr>
										<th>Gender</th>
										<td><div class="form-group input-group"
												style="margin: 0px;">
												<input type="text" value="<%=rs.getString(6)%>"
													name="edit_admingender" class="form-control" id="t6" /> <span
													id="s6"></span>
											</div></td>
									</tr>
								</tbody>
							</table>

						</div>
					</div>
					<!-- <div class="modal-footer">

						<button class="btn btn-info" name="edit" value="Save changes"
							type="submit"></button>

					</div> -->
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<button type="button" onclick="edit_profile()" name="edit"
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
	} else {
	response.sendRedirect("front_admin_login.jsp");
	}
	%>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
	<script>
	function edit_profile(){
		var conf=confirm("do you want to save changes in your profile");
		if(conf){
			editadminprofile.submit();
		}
		
	}
	
	</script>
</body>

</html>