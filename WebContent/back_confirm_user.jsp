
<%
HttpSession session2 = request.getSession(); // checking session 
String session_email = (String) session2.getAttribute("adminsession");
if (session_email != null) {
%>

<%@ page import="java.sql.*"%>

<%
String email = request.getParameter("confirm");
//out.print(email);

try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/online_examination_system", "root",
	"root");
	Statement st = con.createStatement();
	String q = "select * from OES_registered_users where email='" + email + "' ";
	ResultSet rs = st.executeQuery(q);
	if (rs.next()) {

		//String id = rs.getString(1);
		String username = rs.getString(2);
		//out.print(username);
		String password = rs.getString(4);
	//	out.print(password);
		String mobile = rs.getString(5);
		//out.print(mobile);
		String dob = rs.getString(6);
		//out.print(dob);

		String q2 = "INSERT INTO OES_confirmed_users (username,email,password,mobile,dob) values('" + username + "','"
		+ email + "','" + password + "','" + mobile + "','" + dob + "')";
		String q3 = "delete from OES_registered_users where email='" + email + "' ";
		st.executeUpdate(q2);
		st.executeUpdate(q3);

	}
	con.close();
}

catch (Exception e) {
	out.println(e);
}
response.sendRedirect("front_confirm_user.jsp");
} else {
response.sendRedirect("front_admin_login.jsp");
}
%>
