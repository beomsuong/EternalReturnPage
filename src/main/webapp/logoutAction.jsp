<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width; initial-scale=1">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%
	session.invalidate();
	%>
	<script>
		location.href = 'main.jsp';
	</script>
</body>
</html>
