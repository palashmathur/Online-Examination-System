<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>

<head>
<title>Home Page</title>
<link rel="stylesheet" href="index_style.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Roboto&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">

<style>
a:hover {
	background-color: #5bc0de;
}
body{
background-image: url('home1.jpg');
background-repeat: no-repeat;
background-size: cover;
background-attachment:fixed;
background-position: center;
height:100% 100vh;

}



</style>



</head>

<body>


	<%@include file="home_menu.html"%>

	<header>


			<main >
				<section>
					<h3>Welocome to Online Examination System</h3>
					<h1>
						Test what you have got ! <span></span>
					</h1>
					<p>" Education is the single most important job of the human
						race "</p>
					<a href="about_us.jsp" class="button1">learn more</a>
					 <a href="front_register.jsp"	class="button2">Sign up</a>
				</section>
			</main>
		
	</header>
</body>
</html>

