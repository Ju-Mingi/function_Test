<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<body>
	<jsp:useBean id="member" class="com.test.javabeans.MemberBean"
		scope="page" />
	이름 :
	<jsp:getProperty name="member" property="name" /><br> 아이디 :
	<jsp:getProperty name="member" property="id" />
	<hr>

	정보를 변경한 후 변경된 정보 출력하기
	<br>
	<br>
	<jsp:setProperty property="name" name="member" value="주 민 기" />
	<jsp:setProperty property="id" name="member" value="minky" />
	이름 :
	<jsp:getProperty name="member" property="name" /><br> 아이디 :
	<jsp:getProperty name="member" property="id" />
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
</body>
</html>