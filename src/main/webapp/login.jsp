<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content = "width=device-width; initial-scale=1">

<title>로그인</title>
</head>
<body>	
<jsp:include page="navbar.jsp" />
<div class="container">
	<div class="col-lg4"></div>
	<div class="col-lg4">
	<div class="jumbotron" style="padding-top:20px;">
		<form method="post" action="loginAction.jsp">
		<h3 style ="text-align: center;">로그인 화면</h3>
		<div class="form-group">
			<input type="text" class ="form-control" placeholder="아이디" name="userID" maxlength="20">
		</div>
		<div class="form-group">
			<input type="password" class ="form-control" placeholder="비밀먼호" name="userPassword" maxlength="20">		
		</div>
		<input type="submit" class="btn btn-primary form-control" value="로그인">
		</form>
		</div>
		
		
	<div class="col-lg4"></div>
</div>
</div>
</body>
</html>
