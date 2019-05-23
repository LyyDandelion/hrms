<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored ="false"%><!--注意要老版的jsp要加上isELIgnored ="false"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
	<link href="<%=request.getContextPath()%>/resources/assets/css/bootstrap.min.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/resources/assets/css/awesome-bootstrap-checkbox.min.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/resources/assets/css/font-awesome.min.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/resources/assets/css/style.css" rel="stylesheet">
</head>
<body>

<body>
<span class="header-ribbon"/>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-4 col-md-offset-4 col-centered">
			<form action="login.do" method="post">
			<div class="login-panel">
				<h4 class="login-panel-title">企业工资管理系统</h4>
				<p class="login-panel-tagline">有什么意见建议请及时反馈给我们：）</p>
				<div class="login-panel-section">

					<div class="form-group">
						<div class="input-group margin-bottom-sm">
							<span class="input-group-addon"><i class="fa fa-envelope-o fa-fw" aria-hidden="true"></i></span>
							<input class="form-control"  id="username" name="loginName" type="text" placeholder="Email address">
						</div>
					</div>
					<div class="form-group">
						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-key fa-fw" aria-hidden="true"></i></span>
							<input class="form-control"  id="password" name="password"  type="password" placeholder="Password">
						</div>
					</div>
					<div class="checkbox checkbox-circle checkbox-success checkbox-small">
						<input type="checkbox" id="checkbox1">
						<label for="checkbox1">保持登录</label>
						<a href="#" class="pull-right">忘记密码</a>
					</div>
					</form>
				</div>
				<div class="login-panel-section">
					<button type="submit" class="btn btn-default"><i class="fa fa-sign-in fa-fw" aria-hidden="true"></i> 登录</button> </a>
				</div>

			</div>
			</form>
		</div>
	</div>
</div>
<script src="<%=request.getContextPath()%>/resources/assets/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/assets/js/bootstrap.min.js"></script>

</body>
</html>