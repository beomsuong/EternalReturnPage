<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="charactername.CharacterName"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-pzjw8f+ua7Kw1TIq0v8FqFjcJ6pajs/rfdfs3SO+kD4Ck5BdPtF+to8xM6B5z6W5" crossorigin="anonymous">
<link rel="stylesheet" href="css/custom.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<%
String characterID=null;
    characterID = request.getParameter("characterID") ;
%>

    <meta charset="UTF-8">
    <title><%=CharacterName.characterNamesKr.get(Integer.parseInt(characterID))%>게시판 </title>
</head>
<body>

<nav class="navbar navbar-expand-lg bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Navbar</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Link</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Dropdown
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">Action</a></li>
            <li><a class="dropdown-item" href="#">Another action</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">Something else here</a></li>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link disabled">Disabled</a>
        </li>
      </ul>
      <form class="d-flex" role="search">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form>
    </div>
  </div>
</nav>

<p class="sample">
<%=CharacterName.characterNamesKr.get(Integer.parseInt(characterID))%>에 대한 나의 의견을 남겨주세요
</p>
<div class="container">
		<div class="form-group row pull-right">
			<div class="col-xs-8">
				<input class="form-control" id="userName" 
					type="text" size="20"  style="height: 200px; width :800px">
			</div>
				<button class="btn btn-primary" onclick="searchFunction();"
					type="button" >입력</button>
			</div>
		</div>
		
		<table class="table"
		style="text-align: center; border: 1px solid #dddddd">
		<thead>
		<%for(int i=0;i<3;i++)  {%>
			<tr>
				<td style="background-color: #fafafa; text-align: center;">닉네임</td>
					<td style="background-color: #fafafa; text-align: center;">날짜</td>
							
				</tr>
				<tr>
				<td style="background-color: #fafafa; text-align: center;">내용</td>
			</tr>
			<%} %>
		</thead>
		<tbody id="ajaxTab">
		</tbody>
	</table>
</body>
</html>
