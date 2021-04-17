<!doctype html>
<html lang="en">

<head>
<!-- Required meta tags -->
<script type="text/javascript" src="user_login_validation.js">
	
</script>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css
 ">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">

<title>Sign up</title>
</head>

<body>

	<%@include file="home_menu.html"%>

	<div class="container">
		<div class="card bg-light">
			<div class="card-body mx-auto">
				<h4 class="text-center card-title mt-3">Sign in</h4>
				<br>
				<form action="back_user_login.jsp" method="post" name="userloginform">

					<div class="form-group input-group">

						<div class="input-group-prepend">
							<div class="input-group-text">
								<i class="fa fa-envelope"></i>
							</div>
						</div>
						<input type="text" placeholder="email address" name="email" class="form-control"
							id="t1" aria-describedby="emailHelp" /> <span id="s1"></span>
					</div>



					<div class="form-group input-group">

						<div class="input-group-prepend">
							<div class="input-group-text">
								<i class="fa fa-lock"></i>
							</div>
						</div>
						<input type="password" placeholder="password" name="password" class="form-control"
							id="t3" aria-describedby="emailHelp" /> <span id="s3"></span>
					</div>

					<button type="button" name="user-login-button" id="user-login-button"
						onclick="user_login_validation()" class="btn btn-primary btn-block">Sign
						in</button>
					<button type="reset" class="btn btn-secondary btn-block">Reset</button>
					<p class="text-center mt-3">
						don't have an account ?<a href="front_register.jsp">sign up</a>
					</p>
				</form>

			</div>
		</div>
	</div>

	
</body>

</html>