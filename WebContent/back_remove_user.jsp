<%@ page import="java.sql.*"%>

<%
String email = request.getParameter("remove");

try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/online_examination_system", "root",
	"root");
	Statement st = con.createStatement();

	String q1 = "delete from OES_registered_users where email='" + email + "' ";
	st.executeUpdate(q1);

	con.close();
}

catch (Exception e) {
	out.println(e);
}
response.sendRedirect("front_confirm_user.jsp");
%>
