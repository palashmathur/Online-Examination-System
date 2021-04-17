<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <script type="text/javascript" src="js_register_validation.js">
    </script>
    
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css
 ">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">

    <title>Sign up</title>
</head>

<body>
	<%@include file="home_menu.html"%>
    <div class="container">
        <div class="card bg-light">
            <div class="card-body mx-auto">
                <h4 class="text-center card-title mt-3">Sign up</h4>
                <br>
                <form action="back_register.jsp" method="post" name="form1">

                    <div class="form-group input-group">

                        <div class="input-group-prepend">
                            <div class="input-group-text"><i class="fa fa-user"></i></div>
                        </div>
                        <input type="text" placeholder="username" name="username" class="form-control" id="t1"
                            aria-describedby="emailHelp" />
                            <span id="s1"></span>
                    </div>

                    <div class="form-group input-group">

                        <div class="input-group-prepend">
                            <div class="input-group-text"><i class="fa fa-envelope"></i></div>
                        </div>
                        <input type="text" placeholder="email address" name="email" class="form-control" id="t2"
                            aria-describedby="emailHelp" />
                            <span id="s2"></span>
                    </div>

                    <div class="form-group input-group">

                        <div class="input-group-prepend">
                            <div class="input-group-text"><i class="fa fa-lock"></i></div>
                        </div>
                        <input type="password" placeholder="password" name="password" class="form-control" id="t3"
                            aria-describedby="emailHelp" />
                            <span id="s3"></span>
                    </div>

                    <div class="form-group input-group">

                        <div class="input-group-prepend">
                            <div class="input-group-text"><i class="fa fa-lock"></i></div>
                        </div>
                        <input type="password" placeholder="confirm password" name="confirm_password" class="form-control"
                            id="t4" aria-describedby="emailHelp" />
                            <span id="s4"></span>
                    </div>
                    <div class="form-group input-group">

                        <div class="input-group-prepend">
                            <div class="input-group-text"><i class="fa fa-phone"></i></div>
                        </div>
                        <select class="custom-select" style="max-width: 80px;">
                            <option value="">+91</option>
                            <option value="">+1</option>
                            <option value="">+10</option>
                        </select>
                        <input type="number" placeholder="mobile" name="mobile" class="form-control" id="t5"
                            aria-describedby="emailHelp" />
                            <span id="s5"></span>
                    </div>
                    <div class="form-group input-group">

                        <div class="input-group-prepend">
                            <div class="input-group-text"><i class="fa fa-birthday-cake"></i></div>
                        </div>
                        <input type="date" placeholder="DOB" name="dob" class="form-control" id="t6"
                            aria-describedby="emailHelp" />
                            <span id="s6"></span>
                    </div>


                    <!-- <input type="button"  id="btn" value="REGISTER" name="b1" onclick="demo()"> -->
                    <button type="button" name="register-button" id="register-button" onclick="validation()"
                        class="btn btn-primary btn-block">Sign up</button>
                    <button type="reset" class="btn btn-secondary btn-block">Reset</button>
                    <p class="text-center mt-3">Have an account ?<a href="#">sign in</a></p>
                </form>

                <!-- /////////////////////////////// -->
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>
    

    
</body>

</html>