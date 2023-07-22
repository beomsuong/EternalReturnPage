<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" param="userID" />
<jsp:setProperty name="user" property="userPassword"
	param="userPassword" />
<jsp:setProperty name="user" property="userName" param="userName" />
<jsp:setProperty name="user" property="userMMR" param="userMMR" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width; initial-scale=1">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	if (userID != null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 로그인이 되어있습니다.')");
		script.println("location.href ='main.jsp'");
		script.println("</script>");
	}
	if (user.getUserID() == null || user.getUserPassword() == null || user.getUserName() == null
			|| user.getUserMMR() == null || user.getUserEmail() == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안된 사항이 있습니다.')");
		script.println("history.back()");
		script.println("</script>");
	} else {
		UserDAO userDAO = new UserDAO();
		int result = userDAO.join(user);
		PrintWriter script = response.getWriter();
		if (result == -1) {
			script.println("<script>");
			script.println("alert('이미 존재하는 아이디입니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else {//회원가입 성공
			session.setAttribute("userID", user.getUserID());
			script.println("<script>");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
		}

	}
	%>
</body>
</html>
