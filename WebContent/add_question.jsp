<%@ page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>


<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
</head>
<body>

	<%
	HttpSession session2 = request.getSession(); // checking session 
	String session_email = (String) session2.getAttribute("adminsession");
	if (session_email != null) {
	%>

	<%@include file="admin_course_option.html"%>

	<!-- <--fatching course name using cookies -->


	<%
	String subject = "";

	Cookie[] c = request.getCookies();
	for (Cookie cks : c) {
		String cookiename = cks.getName();
		if (cookiename.equals("add_question_course")) {
			subject = cks.getValue();
		}

	}
	%>

	<!--database me se question ki table se total number of question dekhna pdenge pehle kitne h usme ek plus krke 
	nya question number hoga aur question number and course name table ki heading me dikhega 
	aur agr total number of question se jada ho ayenge add krte krte question to alert box aayega usse baaad nhi kr skte add \
	delete krwana pdenge  -->
	<%
	int count = 1;
	String question = "";
	String total_question = "";
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/online_examination_system", "root",
		"root");
		Statement st = con.createStatement();

		String q = "select * from oes_exam_question where subject='" + subject + "' ";
		ResultSet rs = st.executeQuery(q);
		while (rs.next()) {
			count++;
		}
		question = String.valueOf(count);
		String q1 = "select * from oes_exams_details where course_name='" + subject + "' ";
		ResultSet rs1 = st.executeQuery(q1);
		if (rs1.next()) {
			total_question = rs1.getString(2);

		}

		con.close();
	}

	catch (Exception e) {
		out.println(e);
	}

	//add question ki table ya form jo bhi  -->

	int total_question_int = Integer.parseInt(total_question);
	if (count > total_question_int) {
		//	alert box;
	%>
	<div class="container">
		<div class="col-md-8 offset-md-2">

			<div class="alert alert-warning" role="alert">
				<h4 class="alert-heading">Maximun Limit Reached For course!</h4>
				<p>Delete some other question and then add!.</p>
				<hr>

				<a class="btn btn-warning" href="admin_control_questions.jsp"
					role="button">OK</a>

			</div>
		</div>
	</div>

	<%
	} else {
	%>
	<!-- table for add question inside else statement -->
	<form action="back_add_question.jsp" method="post" name="add_question_form">
		<div class="container" style="margin-top: 100px;">
			<div class="card col-md-8 offset-md-2"
				style="background-color: #F8F8F8;">


				<div class="header ">
				
				<h1 class="text-center">Add Question</h1><hr>
					<div class="container" style="margin-top: 10px;">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><span>Couese
								: <%=subject%></span></strong>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						 <strong><span>Question
								: <%=count%></span></strong> <input type="hidden" value="<%=subject%>"
							name="subject"> <input type="hidden" value="<%=count%>"
							name="question_number">

					</div>
				</div>
				<hr>
				<div class="text-center" style="margin-left: 35px;">

					<table class="table table-borderless">
						<thead>
							<tr>
								<th colspan="4"><textarea class="form-control"
										aria-label="With textarea" placeholder="Enter Question"
										id="t1" name="question"></textarea> <span id="s1"></span></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row" colspan="2"><input type="text"
									placeholder="Option 1" name="option_1" class="form-control"
									id="t2" aria-describedby="emailHelp" /> <span id="s"></span></th>

								<th scope="row" colspan="2"><input type="text"
									placeholder="Option 2" name="option_2" class="form-control"
									id="t3" aria-describedby="emailHelp" /> <span id="s"></span></th>

							</tr>
							<tr>
								<th scope="row" colspan="2"><input type="text"
									placeholder="Option 3" name="option_3" class="form-control"
									id="t4" aria-describedby="emailHelp" /> <span id="s"></span></th>

								<th scope="row" colspan="2"><input type="text"
									placeholder="Option 4" name="option_4" class="form-control"
									id="t5" aria-describedby="emailHelp" /><span id="s"></span></th>

							</tr>
							<tr>
								<th scope="row" colspan="2"><input type="text"
									placeholder="Correct answer" name="correct_option"
									class="form-control" id="t6" aria-describedby="emailHelp" /><span
									id="s"></span></th>

								<th><button type="submit" class="btn btn-outline-info">Add
										Question</button></th>
								<th><button type="reset" class="btn btn-outline-secondary">Reset</button></th>
							</tr>
						</tbody>
					</table>

				</div>
			</div>
		</div>
	</form>
	<%
	}
	} else {
	response.sendRedirect("front_admin_login.jsp");
	}
	%>

</body>
</html>