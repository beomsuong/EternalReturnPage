<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" href="css/custom.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
	integrity="sha384-3c3d2b7d39bdf3vol2Dfjr+C4p+42n0rP27m18v3my24Pb6dTFcuH+u8y9B5z6W5"
	crossorigin="anonymous"></script>
<%
String userID = null;
String userName = null;
String userMMR = null;
if (session.getAttribute("userID") != null) {
	userID = (String) session.getAttribute("userID");
}
if (session.getAttribute("userName") != null) {
	userName = (String) session.getAttribute("userName");
}
if (session.getAttribute("userMMR") != null) {
	userMMR = (String) session.getAttribute("userMMR");
}
%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<a class="navbar-brand" href="main.jsp">이터널리턴 팬사이트</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="main.jsp">Home
					<span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
			<li><span class="navbar-text"> <%
 if (userID != null) {
 %>
					<%=userName%> <%=userID%> <%=userMMR%> <%
 }
 %>
			</span></li>
			<%
			if (userID == null) {
			%>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" role="button"
				data-toggle="dropdown" aria-expanded="false"> 접속하기 </a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="login.jsp">로그인</a> <a
						class="dropdown-item" href="join.jsp">회원가입</a>
				</div></li>
			<%
			} else {
			%>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" role="button"
				data-toggle="dropdown" aria-expanded="false"> 회원관리 </a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="login.jsp">정보수정</a> <a
						class="dropdown-item" href="logoutAction.jsp">로그아웃</a>
				</div></li>
			<%
			}
			%>
		</ul>
		<form class="form-inline my-2 my-lg-0">
			<input class="form-control mr-sm-2" type="search"
				placeholder="플레이어의 닉네임을 입력해주세요" aria-label="Search">
			<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
		</form>
	</div>
</nav>

