<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Signin | Admin</title>

<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="css/admin.css">

</head>
<body>
<input type="hidden"  id="status" value="<%= request.getAttribute("status")%>">
	<div class="main">

		<!-- Sing in  Form -->
		<section class="sign-in">
			<div class="container">
				<div class="signin-content">
					<div class="signin-image">
						<figure>
							<img src="img/admin-signin.png" alt="sing up image">
						</figure>
					</div>

					<div class="signin-form">
						<h2 class="form-title" style="font-family: 'Poppins', sans-serif;font-weight:bold;">Admin Sign In</h2>
						<form action="<%= request.getContextPath() %>/login" method="post">
							<div class="form-group">
								<label for="username"><i
									class="zmdi zmdi-account material-icons-name"></i></label> 
									<input style="font-family: 'Poppins', sans-serif;font-size: 17px;"
									type="text" name="name" id="name"
									placeholder="Username" />
							</div>
							<div class="form-group">
								<label for="password"><i class="zmdi zmdi-lock"></i></label> 
								<input  style="font-family: 'Poppins', sans-serif;font-size: 17px;"
									type="password" name="password" id="password"
									placeholder="Password" />
							</div>
							<div class="form-group">
								<input type="checkbox" name="remember-me" id="remember-me"
									class="agree-term" /> <label for="remember-me"
									class="label-agree-term"><span><span></span></span>Remember
									me</label>
							</div>
							<div class="form-group form-button">
								<input style="font-family: 'Poppins', sans-serif;font-size: 17px;" type="submit" name="signin" id="signin"
									class="form-submit" value="Log in" />
							</div>
						</form>
					</div>
				</div>
			</div>
		</section>

	</div>

	<!-- JS -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script type="text/javascript">
	
	var status= document.getElementById("status").value;
		if(status=="failed"){
		swal("Error", "Invalid username or password");
	
		}
		if(status=="done"){
			swal({
				  title: "Good job!",
				  text: "Your account has been successfully created",
				  icon: "success",
				  button: "ok",
				});
	
		}
	
	
	
	
	
	
	</script>
	
</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>