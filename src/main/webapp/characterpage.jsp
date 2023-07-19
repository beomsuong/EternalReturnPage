<!-- 캐릭터 게시판  -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="charactername.CharacterName"%>
<!DOCTYPE html>
<html>
<head>
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
String characterID = request.getParameter("characterID");
characterID = request.getParameter("characterID");
%>
<script type="text/javascript">
    
    var writeRequest = new XMLHttpRequest();// 글쓰기
    var viewRequest = new XMLHttpRequest();// 글보기
    
    
function viewFunction() {

	viewRequest.open("POST",
		    "./BbsViewServlet?characterID="
		    + encodeURIComponent(<%=characterID%>), true);					
	viewRequest.onreadystatechange = viewProcess;
	viewRequest.send(null);
	}

    function viewProcess() {	
    	var table = document.getElementById("ajaxTab");
    	table.innerHTML = "";
    	if (viewRequest.readyState == 4 && viewRequest.status == 200) {
    		var object = eval('(' + viewRequest.responseText + ')');
    		var result = object.result;
    		 console.log(viewRequest.responseText);
    		for (var i = 0; i < result.length; i++) {
    			var row = table.insertRow(0);
    			var cell1 = row.insertCell(0);
    			var cell2 = row.insertCell(1);
    			cell1.innerHTML = result[i][0].UserID; // 닉네임
    			// 날짜 추가해야함 cell1.innerHTML = result[i][1].BbsDate;
    			cell2.innerHTML = result[i][2].BbsContent; // 내용
    			
    		}
    	}
    }

	
	
    
    
	function writeFunction() { 
		var characterID = "<%=characterID%>";
		var userID = "<%=userID%>";
		writeRequest.open("POST", "./BbsWriteServlet", true);
		writeRequest.setRequestHeader('Content-Type',
				'application/x-www-form-urlencoded');
		var queryString = "characterID="
				+ characterID
				+ "&userID="
				+ userID
				+ "&bbsContent="
				+ encodeURIComponent(document.getElementById("bbsContent").value);
		writeRequest.onreadystatechange = writeProcess;
		writeRequest.send(queryString);
	}

	function writeProcess() {
		if (writeRequest.readyState == 4 && writeRequest.status == 200) {
			var result = writeRequest.responseText;
			if (result != 1) {
				alert("등록에 실패했습니다.");
			} else {
				alert("등록에 성공했습니다.");
			}
		}
		viewFunction() 
	}
	window.onload = function() {
		viewFunction();
	}
</script>
<meta charset="UTF-8">
<title><%=CharacterName.characterNamesKr.get(Integer.parseInt(characterID))%>게시판
</title>
</head>
<body>
	<jsp:include page="navbar.jsp" />

	<p class="sample">
		<%=CharacterName.characterNamesKr.get(Integer.parseInt(characterID))%>에
		대한 나의 의견을 남겨주세요
	</p>
	<% if(session.getAttribute("userID") == null){
		
		
		
	%>
	
	<div class="container">
	<div class="form-group row pull-right">
		<div class="col-xs-8">
			<input class="form-control" id="bbsContent" type="text" size="20" value ="로그인을 하셔야 의견을 남길 수 있습니다."style="height: 200px; width: 800px" disabled>
		
		</div>
		<button class="btn btn-primary" onclick="writeFunction();" type="button" disabled>입력</button>
	</div>
</div>

	<%}else {%>
	<div class="container">
		<div class="form-group row pull-right">
			<div class="col-xs-8">
				<input class="form-control" id="bbsContent" type="text" size="20"
					style="height: 200px; width: 800px">
			</div>
			<button class="btn btn-primary" onclick="writeFunction();"
				type="button">입력</button>
		</div>
	</div>
<%} %>
	<table class="table"
		style="text-align: center; border: 1px solid #dddddd">
		<thead>
			<tr>
				<td style="background-color: #fafafa; text-align: left;">닉네임</td>
				<td style="background-color: #fafafa; text-align: left;">내용</td>
			</tr>
		</thead>
		<tbody id="ajaxTab">
		</tbody>
	</table>


</body>
</html>
