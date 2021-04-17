<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>back exam page</title>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
</head>
<body>

	<%
	HttpSession session2 = request.getSession(); // checking session 
	String session_email = (String) session2.getAttribute("username");
	if (session_email != null) {
	%>
	<%!Map<Integer, String> map = new HashMap<>();%>

	<!-- geting current question number and user answer for data -->
	<%
	String question_str = request.getParameter("question_number_hidden");

	String user_answer = request.getParameter("option");
	%>

	<!-- variable declaration -->
	<%
	int question = 0;
	String ques_no = "";
	String subject = "";
	String total_question_str = "";
	int total_question_int = 0;
	%>
	<%
	question = Integer.parseInt(question_str);
	%>
	<!-- fatching subject name from cookie -->
	<%
	Cookie[] c = request.getCookies();

	for (Cookie cks : c) {
		String cookiename = cks.getName();

		if (cookiename.equals("course_name")) {

			subject = cks.getValue();
		}
	}
	%>

	<!-- database connect to get the total question of a perticuler subject -->
	<%
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/online_examination_system", "root",
		"root");
		Statement st = con.createStatement();
		String q1 = "select * from oes_exams_details where course_name='" + subject + "' ";
		ResultSet rs = st.executeQuery(q1);
		if (rs.next()) {

			total_question_str = rs.getString(2);
		}
		con.close();
	} catch (Exception e) {
		out.println(e);
	}
	%>

	<!-- converting total question into int -->
	<%
	total_question_int = Integer.parseInt(total_question_str);
	%>

	<!-- 	//for next button -->

	<%
	if (request.getParameter("next") != null) {

		if (user_answer == null) {
	%><div class="container">
		<div class="col-md-8 offset-md-2">

			<div class="alert alert-warning" role="alert">
				<h4 class="alert-heading">Cannot submit null answer!</h4>
				<p>Please Select one of the option and try again!.</p>
				<hr>

				<a class="btn btn-secondary" href="exam_page.jsp" role="button">Back</a>

			</div>
		</div>
	</div>
	<%
	} else {
	// String question_number = request.getParameter("question_number_hidden");
	//	String answer = request.getParameter("option");
	int total_correct_answers = 0;
	String final_result = "FAIL";

	map.put(question, user_answer);

	question++;
	if (question > total_question_int) {
	%><script>
				localStorage.removeItem("countdown");
			</script>
	<%
	}
	if (question > total_question_int) {
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/online_examination_system", "root",
		"root");
		Statement st = con.createStatement();

		for (int i = 1; i <= total_question_int; i++) {

			String q1 = "select * from oes_exam_question where subject='" + subject + "' AND ques_id='" + i + "' ";
			ResultSet rs = st.executeQuery(q1);

			if (rs.next()) {

		if (map.containsKey(i)) {

			if (map.get(i).equals(rs.getString(8))) {

				total_correct_answers++;

			}
		}

			}

		}

		if (total_correct_answers >= total_question_int / 2) {
			final_result = "PASS";
		}

		//result display and the store it in database

		/*email session me store krwayenge login ke time wo fatch krwa ke us email  
		ke corresponding username database se lenge*/

		HttpSession session1 = request.getSession(); // fatching user email from session to display result 
		String email = (String) session1.getAttribute("username");

		String username = "";
		String q1 = "select * from oes_confirmed_users where email='" + email + "' ";
		ResultSet rs = st.executeQuery(q1);
		if (rs.next()) {

			username = rs.getString(2);

		}

		//store of the details of the exam result in the result table

		String q2 = "INSERT INTO oes_exam_results values('" + username + "','" + email + "','" + subject + "','"
		+ total_question_int + "','" + total_correct_answers + "','" + final_result + "')";

		st.executeUpdate(q2);

		//using html css now to display the table of result
		//giving ok button below the table to redirect user to user_home_page
	%>

	<div class="container text-center"
		style="margin-top: 50px; width: 700px;">
		<div class="card bg-light">
			<div class="card-body mx-auto">
				<h2>Result</h2>

				<table class="table">
					<thead>
						<tr>
							<th>Username</th>
							<td><%=username%></td>

						</tr>
					</thead>
					<tbody>
						<tr>
							<th>Email ID</th>
							<td><%=email%></td>


						</tr>
						<tr>
							<th>Exam name</th>
							<td><%=subject%></td>


						</tr>
						<tr>
							<th>Total questions</th>
							<td><%=total_question_int%></td>
						</tr>
						<tr>
							<th>Correct answers</th>
							<td><%=total_correct_answers%></td>
						</tr>
						<tr>
							<th>Status</th>
							<td><%=final_result%></td>
						</tr>
					</tbody>
				</table>
				<span> <a class="btn btn-info" href="user_home_page.jsp"
					role="button">Back</a>
				</span>
			</div>
		</div>
	</div>


	<%
	con.close();
	} catch (Exception e) {
	out.println(e);
	}
	}

	else {

	question_str = String.valueOf(question);
	Cookie question_cks = new Cookie("question_cks", question_str);
	response.addCookie(question_cks);
	response.sendRedirect("exam_page.jsp");
	}
	}
	}
	%>
	<!-- 	//for back button -->

	<%
	if (request.getParameter("back") != null) {

		question = Integer.parseInt(question_str);
		question--;
		if (question == 0) {
			question = 1;
		}
		ques_no = String.valueOf(question);
		Cookie question_cks = new Cookie("question_cks", ques_no);
		response.addCookie(question_cks);

		response.sendRedirect("exam_page.jsp");
	}
	%>
	<%
	} else {
	response.sendRedirect("front_user_login.jsp");
	}
	%>


</body>
</html>