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
.table-width {
	width: 1400px;
	margin-top: 160px;
	margin-left: 100px;
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

	<%
	String subject = request.getParameter("subject");

	String question_number = request.getParameter("question_number");
	

	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/online_examination_system", "root",
		"root");
		Statement st = con.createStatement();
		String q = "select * from oes_exam_question where subject='" + subject + "' AND ques_id='" + question_number + "' ";
		ResultSet rs = st.executeQuery(q);
		if (rs.next()) {
	%>
	<form action="back2_edit_question.jsp" method="post" name="editquestionform">
		<div class="container">

			<div class="container" style="margin-top: 100px;">
				<div class="card col-md-8 offset-md-2"
					style="background-color: #F8F8F8;">


					<div class="header ">
						<div class="container" style="margin-top: 10px;">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><span>Course
									:<%=subject%></span></strong>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<strong><span>Question : <%=question_number%></span></strong>
							
							 <input type="hidden" value="<%=subject%>" name="subject">
							  <input type="hidden" value="<%=question_number%>" name="question_number">

						</div>
					</div>
					<hr>
					<div class="text-center" style="margin-left: 35px;">

						<table class="table table-borderless">
							<thead>
								<tr>
									<th colspan="4"><input type="text"
										class="form-control" value="<%=rs.getString(3)%>"
										aria-label="With textarea" id="t1" name="question"> <span
										id="s1"></span></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row" colspan="2"><input type="text"
										value="<%=rs.getString(4)%>" name="option1"
										class="form-control" id="t2" aria-describedby="emailHelp" />
										<span id="s"></span></th>

									<th scope="row" colspan="2"><input type="text"
										value="<%=rs.getString(5)%>" name="option2"
										class="form-control" id="t3" aria-describedby="emailHelp" />
										<span id="s"></span></th>

								</tr>
								<tr>
									<th scope="row" colspan="2"><input type="text"
										value="<%=rs.getString(6)%>" name="option3"
										class="form-control" id="t4" aria-describedby="emailHelp" />
										<span id="s"></span></th>

									<th scope="row" colspan="2"><input type="text"
										value="<%=rs.getString(7)%>" name="option4"
										class="form-control" id="t5" aria-describedby="emailHelp" /><span
										id="s"></span></th>

								</tr>
								<tr>
									<th scope="row" colspan="2"><input type="text"
										value="<%=rs.getString(8)%>" name="correct_option"
										class="form-control" id="t6" aria-describedby="emailHelp" /><span
										id="s"></span></th>

									<th><button type="button" onclick="confirm_edit_question()" class="btn btn-info">Edit
											Question</button></th>
									<th><button type="reset" class="btn btn-outline-secondary">Reset</button></th>
								</tr>
							</tbody>
						</table>

					</div>
				</div>
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

} else {
	response.sendRedirect("front_admin_login.jsp");
	}
	%>
	
	
	
	<script>
	function confirm_edit_question() {
		var conf = confirm("Do you want to save changes");
		if (conf) {
			editquestionform.submit();
		}
	}
</script>
	
</body>
</html>