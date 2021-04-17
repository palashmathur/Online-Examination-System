<%@ page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>


</head>
<body>
<div class="fix">
	<%
	HttpSession session2 = request.getSession(); // checking session 
	String session_email = (String) session2.getAttribute("adminsession");
	if (session_email != null) {
	%>

	<%@include file="admin_course_option.html"%>

	<!--cookie se course name ki value fatch krenge aur phir database se wo course ke sare question
 niche wali table me show krwya denge   -->

	<%
	String subject = "";

	Cookie[] c = request.getCookies();
	for (Cookie cks : c) {
		String cookiename = cks.getName();
		if (cookiename.equals("showall_question_course")) {
			subject = cks.getValue();
		}

	}
	%>



	<%
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/online_examination_system", "root",
		"root");
		Statement st = con.createStatement();

		String q1 = "select * from oes_exam_question where subject='" + subject + "' ";
		ResultSet rs1 = st.executeQuery(q1);
		if (rs1.next()) {

			String q = "select * from oes_exam_question where subject='" + subject + "' ";
			ResultSet rs = st.executeQuery(q);
			while (rs.next()) {
		//table of all questions loop ke through
	%>
	<div class="container" style="margin-top: 20px;">
		<div class="card col-md-12 offset-md-0"
			style="background-color: #F8F8F8;">


			<div class="header ">
				<div class="container" style="margin-top: 10px;">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><span>Course
							: <%=subject%></span></strong>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong><span>Question
							: <%=rs.getString(1)%></span></strong> <input type="hidden"
						name="question_number" value="<%=rs.getString(1)%>"> <input
						type="hidden" name="subject" value="<%=rs.getString(2)%>">

				</div>
			</div>
			<hr>
			<div class="" style="margin-left: 35px;">

				<table class="table table-borderless">
					<thead style="font-size: 25px;">

						<tr>
							<td colspan="4"><%="Ques : " + rs.getString(3)%></td>
						</tr>
					</thead>
					<tbody style="font-size: 20px;">
						<tr>
							<td scope="row">&nbsp;&nbsp;&nbsp;<%="1. " + rs.getString(4)%></td>

							<td scope="row">&nbsp;&nbsp;&nbsp;<%="2. " + rs.getString(5)%></td>
							<td scope="row">&nbsp;&nbsp;&nbsp;<%="3. " + rs.getString(6)%></td>

							<td scope="row">&nbsp;&nbsp;&nbsp;<%="4. " + rs.getString(7)%></td>
						</tr>
					</tbody>
				</table>

				<table class="table table-borderless">
					<tr>
						<th colspan="2"><input type="button" class="btn btn-success"
							value="<%=rs.getString(8)%>"></th>
					</tr>
					<tr>
						<td><a class="btn btn-danger"
							onclick="return confirm('Are you sure You want to delete this question ?')"
							href='back_delete_question.jsp?
									question_number=<%=rs.getString(1)%>&subject=<%=rs.getString(2)%>'
							role="button">Delete</a></td>
						<td><a class="btn btn-info"
							href='back_edit_question.jsp?
									question_number=<%=rs.getString(1)%>&subject=<%=rs.getString(2)%>'>Edit</a>
						</td>
					</tr>

				</table>
			</div>
		</div>
	</div>

	<%
	}
	} else {
	%>
	<div class="container" style="margin-top: 0px;">
		<div class="col-md-8 offset-md-2">

			<div class="alert alert-warning" role="alert">
				<h4 class="alert-heading">No question yet!</h4>
				<p>please add question for this course and try again !</p>
				<hr>

				<a class="btn btn-secondary" href="admin_control_questions.jsp"
					role="button">Ok</a>

			</div>
		</div>
	</div>
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
</div>
	<!-- delete edit question table 
     har row me do option rhenge delete aur edit question ka 
     edit me modal pop up aur delete me direct delete from database -->



	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>