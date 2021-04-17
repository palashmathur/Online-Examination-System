<%@ page import="java.sql.*"%>

<%
String course = request.getParameter("delete");

try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/online_examination_system", "root",
	"root");
	Statement st = con.createStatement();

	String q1 = "delete from OES_exams_details where course_name='" + course + "' ";
	st.executeUpdate(q1);
	
	String q2 = "delete from OES_exam_question where subject='" + course + "' ";
	st.executeUpdate(q2);
	
	con.close();
}

catch (Exception e) {
	out.println(e);
}
response.sendRedirect("add_delete_edit_courses.jsp");
%>
