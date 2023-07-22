<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="charactername.CharacterName"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width; initial-scale=1">
<meta charset="UTF-8">
<title>Insert ti12tle here</title>
</head>
<body>
	<jsp:include page="navbar.jsp" />

	<div style="overflow: auto; width: 500px; height: 400px;">
		<div class="button-container">
			<%
			for (int i = 1; i < 5; i++) {
			%>
			<button type="button" class="btn_image" id="img_btn<%=i%>"
				onclick="location.href='characterpage.jsp?characterID=<%=i%>'">
				<img src="MainCharacter/<%=i%>.png" width="64" height="64">
			</button>
			<%
			}
			%>
		</div>
	</div>
</body>

</html>s
