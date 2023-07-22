<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width; initial-scale=1">

<title>이터널리턴 팬 사이트 회원가입</title>
</head>
<%
boolean checkID = false; //사용자가 입력한 이터널리턴 닉네임이 유효한지 API를 사용하여 체크
%>
<script type="text/javascript">
	function CheckMMRFunction() {

		alert("MMR 확인.");
	}
</script>
<body>
	<jsp:include page="navbar.jsp" />
	<div class="container">
		<div class="col-lg4"></div>
		<div class="col-lg4">
			<div class="jumbotron" style="padding-top: 20px;">
				<form method="post" action="joinAction.jsp">
					<h3 style="text-align: center;">회원가입 화면</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디"
							name="userID" maxlength="20">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀먼호"
							name="userPassword" maxlength="20">
					</div>

					<div class="form-group row">
						<div class="col-md-8">
							<input type="text" class="form-control" placeholder="이터널리턴 닉네임"
								name="userName" maxlength="20">
						</div>
						<div class="col-md-4 text-right">
							<input type="button" class="btn btn-primary" value="닉네임 인증"
								onclick="CheckMMRFunction();">
						</div>
					</div>

					<div class="form-group" style="text-align: center;">

						<div class="form-group">
							<input type="email" class="form-control" placeholder="이메일"
								name="userEmail" maxlength="20">
						</div>
					</div>

					<input type="submit" class="btn btn-primary form-control"
						value="회원가입">
				</form>
			</div>


			<div class="col-lg4"></div>
		</div>
	</div>

</body>
</html>
