<%@ page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Select Subject</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">


<script type="text/javascript">
	function preventBack() {
		window.history.forward();
	}
	setTimeout("preventBack()", 0);
	window.onunload = function() {
		null
	};
</script>

</head>
<body>
	<%@include file="user_menu.html"%>
	<%
	HttpSession session2 = request.getSession(); // checking session 
	String session_email = (String) session2.getAttribute("username");
	if (session_email != null) {
	%>
	<div class="container" style="margin-top: 10px;">
		<div class="jumbotron text-center">
			<h1 class="display-4">EXAM INSTRUCTION</h1>
			<hr>
			<p class="lead">1.Exam will be consist of total 10-20 questions
				according to the subject</p>

			<p class="lead">2.There will be a timer running on top of the
				right side indicate the time left.</p>
			<p class="lead">3.If any student is not able to complete the test
				within the time limit the no extra time will be given to any student</p>
			<p class="lead">4.Once you stared the exam you will not be able
				to move back using browser's back button</p>
			<p class="lead">5.You cannot submit the null answer which means
				you have to select one of the most appropriate answer and then move
				to the next button</p>
			<p class="lead">6.You can navigate through back and next button and using the number button</p>
			<p class="lead">7.Finish button will only be appear at the last question</p>


			

			<%
			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/online_examination_system", "root",
				"root");
				Statement st = con.createStatement();
				String q = "select * from oes_exams_details";
				ResultSet rs = st.executeQuery(q);
			%>




			<form action="select_takeexam_course.jsp" method="post">
				<div class="subject-select" style="margin-left: 420px">
					<div class="form-group input-group">
						<select name="selected_exam_subject" class="custom-select"
							style="max-width: 200px; text-align: center">
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
					<span style="margin-left: -430px">
						<button type="submit" name="take exam" class="btn btn-info">Start
							Exam</button>
					</span>

				</div>
			</form>
			<hr>
			<h3>Good Luck !</h3>



			<!-- 	<div class="form-group input-group"
				style="width: 200px; margin-left: 420px;">
				<select class="custom-select text-center">
	
					<option value="">select subject</option>
					<option value="pp">pp</option>


				</select>
			</div>
			<button class="btn btn-primary" type="submit">Start Exam</button> -->




			<%-- <form action="select_takeexam_course.jsp">
		<div class="subject-select"
			style="margin-top: 450px; margin-left: 660px">
			<div class="form-group input-group">
				<select name="selected_exam_subject" class="custom-select"
					style="max-width: 200px; text-align: center">
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

			<span style="margin-top: 600px; margin-left: 60px">
				<button type="submit" name="take exam" class="btn btn-info">Select</button>
			</span>
		</div>
	</form>
 --%>

			<%
			if (request.getParameter("take exam") != null) {

				String course_name = request.getParameter("selected_exam_subject");

				String q1 = "select * from oes_exam_question where subject='" + course_name + "' ";
				ResultSet rs1 = st.executeQuery(q1);
				int count1 = 0;
				while (rs1.next()) {
					count1++;

				}
				String q2 = "select * from oes_exams_details where course_name='" + course_name + "' ";
				ResultSet rs2 = st.executeQuery(q2);
				String count2_str = "";
				if (rs2.next()) {

					count2_str = rs2.getString(2);
				}
				int count2 = Integer.parseInt(count2_str);

				if (count1 == count2) {
					Cookie course = new Cookie("course_name", course_name);
					response.addCookie(course);

					String one = "1";

					Cookie question_one = new Cookie("question_cks", one);
					response.addCookie(question_one);

					response.sendRedirect("exam_page.jsp");
				} else {
					response.sendRedirect("back_select_takeexam_course_warning.html");
				}

			}
			con.close();
			} catch (Exception e) {
			out.print(e);
			}
			%>


		</div>
	</div>

	<%
	} else {
	response.sendRedirect("front_user_login.jsp");
	}
	%>




</body>

</html>
