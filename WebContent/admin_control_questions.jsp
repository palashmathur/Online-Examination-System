<%@ page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<title>Insert title here</title>
</head>
<body>
<%
	HttpSession session2 = request.getSession(); // checking session 
	String session_email = (String) session2.getAttribute("adminsession");
	if (session_email != null) {
	%>

	<%@include file="admin_course_option.html"%>
	<%
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/online_examination_system", "root",
		"root");
		Statement st = con.createStatement();
		String q = "select * from OES_exams_details";
		ResultSet rs = st.executeQuery(q);
	%>
	<form action="admin_control_questions.jsp" method="post">
		
		
		<div class="container text-center justify-center" style="margin-top: 120px;">
			
			
			<!-- show all question ke liye   -->
			
			
			<div class="row">
				<div class="col-sm-6">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">
								<a class="btn btn-info" href="#" role="button">Show
									Questions</a>
							</h5>
							<p class="card-text">See all the question of a perticuler
								course</p>
							<div class="form-group input-group" style="margin-left: 150px;">
								<select name="showall_question" class="custom-select"
									style="max-width: 200px;">
									<option value="">select subject</option>

									<%
									while (rs.next()) {
									%>
									<option value="<%=rs.getString(1)%>"><%=rs.getString(1)%></option>

									<%
									}
									%>

								</select>
							</div>


							<hr>
							<button class="btn btn-primary" name="show question"
								type="submit">Show</button>
						</div>
					</div>
				</div>
				
				<!-- add question ke liye  -->
				
				
				<div class="col-sm-6">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">
								<a class="btn btn-info" href="#" role="button">Add Questions</a>
							</h5>
							<p class="card-text">Add Question to perticuler course</p>
							<div class="form-group input-group" style="margin-left: 150px;">
								<select name="add_question_course" class="custom-select"
									style="max-width: 200px;">
									<option value="">select subject</option>
									<%
									String q1 = "select * from OES_exams_details";
									ResultSet rs1 = st.executeQuery(q1);
									while (rs1.next()) {
									%>
									<option value="<%=rs1.getString(1)%>"><%=rs1.getString(1)%></option>

									<%
									}
									%>
								</select>
							</div>


							<hr>
							<button class="btn btn-primary" name="add question" type="submit">Add</button>

						</div>
					</div>
				</div>
			</div>
		</div>



	</form>
	<%
	} catch (Exception e) {
	out.print(e);

	}
	%>

	<!-- add question submit button  -->
	<%
	if (request.getParameter("add question") != null) {

		String course_name = request.getParameter("add_question_course");

		Cookie course = new Cookie("add_question_course", course_name);
		response.addCookie(course);

		response.sendRedirect("add_question.jsp");
	}
	%>


	<!-- show all submit button -->
	<%
	if (request.getParameter("show question") != null) {

		String course_name = request.getParameter("showall_question");

		Cookie course = new Cookie("showall_question_course", course_name);
		response.addCookie(course);
		
		response.sendRedirect("show_all_question.jsp");
	}
	} else {
		response.sendRedirect("front_admin_login.jsp");
		}
	%>


</body>
</html>