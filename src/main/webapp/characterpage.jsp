<!-- 캐릭터 게시판  -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="charactername.CharacterName"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-pzjw8f+ua7Kw1TIq0v8FqFjcJ6pajs/rfdfs3SO+kD4Ck5BdPtF+to8xM6B5z6W5" crossorigin="anonymous">
<link rel="stylesheet" href="css/custom.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<%
String userID = null;
String userName = null;
String userMMR = null;
if (session.getAttribute("userID") != null) {
	userID = (String) session.getAttribute("userID");
}
if (session.getAttribute("userName") != null) {
	userName=(String) session.getAttribute("userName");
}
if (session.getAttribute("userMMR") != null) {
	userMMR=(String) session.getAttribute("userMMR");
}
String characterID=null;
    characterID = request.getParameter("characterID") ;
    
    
    
    %>
    <script type="text/javascript">
    
    var registerRequest = new XMLHttpRequest();
	function registerFunction() {
		var characterID = "<%=characterID%>";
		var userID = "<%=userID%>";
	    registerRequest.open("POST", "./UserRegisterServlet", true);
	    registerRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	    var queryString = "characterID="
	        + characterID
	        + "&userID="
	        + userID
	        + "&bbsContent="
	        + encodeURIComponent(document.getElementById("bbsContent").value);
	    registerRequest.onreadystatechange = registerProcess;
	    registerRequest.send(queryString); 
	   
	}

	function registerProcess() {
	    if (registerRequest.readyState == 4 && registerRequest.status == 200) {
	        var result = registerRequest.responseText;
	        if (result != 1) {
	            alert("등록에 실패했습니다.");
	        } else {
	            alert("게시글이 성공적으로 등록되었습니다.");
	        }
	    }
	}

	
</script>

    <meta charset="UTF-8">
    <title><%=CharacterName.characterNamesKr.get(Integer.parseInt(characterID))%>게시판 </title>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#">Navbar</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Link</a>
      </li>
        <%
			if (userID != null) {
			%>
			    <li class="nav-item">
        <a class="nav-link" href="#"><%=userName %></a>
         <a class="nav-link" href="#"><%=userID %></a>
          <a class="nav-link" href="#"><%=userMMR %></a>
      </li>
			<%} %>
      <%
			if (userID == null) {
			%>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="false">
          접속하기
        </a>
        <div class="dropdown-menu">
          <a class="dropdown-item" href="login.jsp">로그인</a>
          <a class="dropdown-item" href="#">회원가입</a>
      </li>
    <%
			} else {
			%>
			 <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="false">
          회원관리
        </a>
        <div class="dropdown-menu">
          <a class="dropdown-item" href="login.jsp">정보수정</a>
          <a class="dropdown-item" href="logoutAction.jsp">로그아웃</a>
      </li><%
			}
			%>
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>

<p class="sample">
<%=CharacterName.characterNamesKr.get(Integer.parseInt(characterID))%>에 대한 나의 의견을 남겨주세요
</p>
<div class="container">
		<div class="form-group row pull-right">
			<div class="col-xs-8">
				<input class="form-control" id="bbsContent" 
					type="text" size="20"  style="height: 200px; width :800px">
			</div>
				<button class="btn btn-primary" onclick="registerFunction();"
					type="button" >입력</button>
			</div>
		</div>
		
		<table class="table"
		style="text-align: center; border: 1px solid #dddddd">
		<thead>
		<%for(int i=0;i<3;i++)  {%>
			<tr>
				<td style="background-color: #fafafa; text-align: left;">닉네임</td>
				</tr>
				<tr>
				<td style="background-color: #fafafa; text-align: left;">내용</td>
			</tr>
			<%} %>
		</thead>
		<tbody id="ajaxTab">
		</tbody>
	</table>
</body>
</html>
