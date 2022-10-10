<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<meta charset="UTF-8">
<script>
	$(function(){
		$("#loginBtn").click(function(){
			location.href='findIdAction';
		})
	})
</script>
<title>Log In</title>
</head>
<body>
	<div class="wrapper">
		<div class="container">
			<div class="row">
				<div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
					<div class="card card-signin my-5">
						<div class="card-body">
							<h5 class="card-title text-center">Log In</h5>
							<form class="Idr" method="post" action="login">
								<div class="form-label-group">
									<input type="text" id="memberId" name="memberId" class="form-control"
										placeholder="memberId" required autofocus>
								</div>
								<br>

								<div class="form-label-group">
									<input type="password" id="pwd" name="pwd" class="form-control"
										placeholder="Password" required>
								</div>

								<hr>

								<div class="form-label-group">
									<c:if test="${check == 1 }">
										<label>${message }</label>
									</c:if>
								</div>

								<button class="btn btn-lg btn-primary btn-block text-uppercase"
									type="submit">Sign in</button>
								<hr class="my-4">
								Forgot your <a href="javascript:void(0)" onclick="findid()">ID</a>
								or <a href="javascript:void(0)" onclick="findpassword()">Password</a>?
								<button
									class="btn btn-lg btn-secondary btn-block text-uppercase"
									onclick="location='join'">Join</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
  function findid(){
		var url="find_id_form";
		
		window.open(url, "_blank_1", "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=500, height=500");
	}
  
  function findpassword(){
	  var url="find_password_form";
	  
	  window.open(url, "_blank_1", "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=500, height=500");
  }
  </script>