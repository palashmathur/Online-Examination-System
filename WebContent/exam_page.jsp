<!-- ///////////////////////////// -->
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Exam page</title>
<script src="countdown_timer2.js"></script>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<style>
header {
	width: 100px;
	height: 60px;
	padding: 10px;
	margin-left: 1400px;
	margin-top: 10px;
	border: 2px solid red;
}

#timer_div {
	text-align: center;
}
</style>

</head>
<body onload="showTimer()">


	<%
	HttpSession session2 = request.getSession(); // checking session 
	String session_email = (String) session2.getAttribute("username");
	if (session_email != null) {
	%>


	<div id="content"></div>

	<%
	String subject = "";
	int question_number = 0;
	Cookie[] c = request.getCookies();

	for (Cookie cks : c) {
		String cookiename = cks.getName();

		if (cookiename.equals("course_name")) {

			subject = cks.getValue();
		}
		if (cookiename.equals("question_cks")) {

			question_number = Integer.parseInt(cks.getValue());
		}
	}
	%>


	<div>
		<header>
			<div id="timer_div"></div>
		</header>
	</div>

	<%
	try {

		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/online_examination_system", "root",
		"root");
		Statement st = con.createStatement();
		String q1 = "select * from OES_exams_details where course_name='" + subject + "' ";
		ResultSet rs = st.executeQuery(q1);

		if (rs.next()) {
	%><input type="hidden" value="<%=rs.getString(3)%>" id="hidden"
		name="time_hidden">
	<%
	}

	con.close();
	} catch (Exception e) {
	out.print(e);
	}
	%>


	<form action="back_exam_page.jsp" method="post">
		<input type="hidden" value="<%=question_number%>"
			name="question_number_hidden"> <input type="hidden"
			value="<%=subject%>" name="subject_hidden">

		<%
		try {

			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/online_examination_system", "root",
			"root");
			Statement st = con.createStatement();
			String q1 = "select * from OES_exam_question where ques_id='" + question_number + "' AND  subject='" + subject
			+ "' ";
			ResultSet rs = st.executeQuery(q1);

			if (rs.next()) {
		%>
		<div class="container col-md-7 offset-md-2"
			style="margin-top: 80px; margin-left: 300px">
			<div class="card">
				<div class="card-header">
					<h5>
						&nbsp;<%=rs.getString(1)%>:&nbsp;&nbsp;<%=rs.getString(3)%></h5>
					<hr>
					<div class="card-body">

						<p class="card-text">
							<input type="radio" name="option" value="<%=rs.getString(4)%>">&nbsp;&nbsp;<%=rs.getString(4)%></p>
						<p class="card-text">
							<input type="radio" name="option" value="<%=rs.getString(5)%>">&nbsp;&nbsp;<%=rs.getString(5)%></p>
						<p class="card-text">
							<input type="radio" name="option" value="<%=rs.getString(6)%>">&nbsp;&nbsp;<%=rs.getString(6)%></p>
						<p class="card-text">
							<input type="radio" name="option" value="<%=rs.getString(7)%>">&nbsp;&nbsp;<%=rs.getString(7)%></p>



						<hr>
						<button type="submit"
							style="width: 100px; border-radius: 5px; height: 37px; color: white; background: #0275d8;"
							name="back">back</button>


						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

						<button type="submit" id="nextbtn" value="next"
							style="width: 100px; border-radius: 5px; height: 37px; color: white; background: #0275d8;"
							name="next">Next</button>

						<hr>


					</div>
				</div>
			</div>

		</div>
	</form>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;





	<%
	}
	con.close();
	} catch (Exception e) {
	out.print(e);
	}
	%>
	<%
	if (question_number == 10) {
	%><script>
		console.log("10th button");
		document.querySelector('#nextbtn').style.color = "black";
		document.querySelector('#nextbtn').style.background = "#32CD32";
		document.querySelector('#nextbtn').innerHTML = "Finsih";
	</script>

	<%
	}
	%>
	<%
	}

	else {
	response.sendRedirect("front_user_login.jsp");
	}
	%>


</body>
</html>