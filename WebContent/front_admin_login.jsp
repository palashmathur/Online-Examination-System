<!doctype html>
<html lang="en">

<head>
<!-- Required meta tags -->
<script type="text/javascript" src="admin_validation.js">
	
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

	<div class="container" style="margin-top:100px;width:600px;">
		<div class="card bg-light">
			<div class="card-body mx-auto">
				<h4 class="text-center card-title mt-3">Sign in</h4>
				<br>
				<form action="back_admin_login.jsp" method="post" name="adminform">

					<div class="form-group input-group">

						<div class="input-group-prepend">
							<div class="input-group-text">
								<i class="fa fa-user"></i>
							</div>
						</div>
						<input type="text" placeholder="username" name="adminname" class="form-control"
							id="t1" aria-describedby="emailHelp" /><br> <span id="s1"></span>
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

					<button type="button" name="admin-login-button" id="admin-login-button"
						onclick="admin_validation()" class="btn btn-primary btn-block">Sign
						up</button>
					<button type="reset" class="btn btn-secondary btn-block">Reset</button>
					<p class="text-center mt-3">
						Login as user ?<a href="#">sign in</a>
					</p>
				</form>

				<!-- /////////////////////////////// -->
			</div>
		</div>
	</div>

	<!-- Optional JavaScript; choose one of the two! -->

	<!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
	
	<!-- Option 2: jQuery, Popper.js, and Bootstrap JS
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
    -->
</body>

</html>