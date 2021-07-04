<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보</title>
<style>
	#container{
		display:grid;
		grid-template-column: 1fr;
		grid-template-rows: 150px 1fr;
		text-align:center;
	}
</style>
</head>
<body>
	<div id="container">
		<div class="grid1">
			<%@ include file ="header.jsp" %>
		</div>
		<div class = "grid2" style="margin-top:10px; border:solid 1px;">
			이곳은 정보 내용이 들어갈 부분입니다.
		</div>
	</div>

</body>
</html>