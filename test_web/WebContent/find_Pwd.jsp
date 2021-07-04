<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@page import="java.sql.*"%>
<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
String answer = request.getParameter("answer");
String question = request.getParameter("question");
out.println(answer);
out.println(question);
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

try {
	Context init = new InitialContext();
	DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
	conn = ds.getConnection();

	pstmt = conn.prepareStatement(
	"select cust_pw from cust_info where cust_id = ? and cust_question = ? and cust_answer = ?");
	pstmt.setString(1, id);
	pstmt.setString(2, question);
	pstmt.setString(3, answer);

	rs = pstmt.executeQuery();
	rs.next();
	String result = rs.getString("cust_pw");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>내 비밀번호 찾기</title>
<script>alert("비밀번호는 " + <%out.print(result);%> +" 입니다.")
		location.href='loginForm.jsp'
</script>
</head>
<body>
</body>
</html>
<%
} catch (Exception e) {
	e.printStackTrace();
	out.println("입력하신 정보가 일치하지 않습니다.");
	out.println("<script>");
	out.println("location.href='loginForm.jsp'");
	out.println("alert('로그인 페이지로 이동합니다.')");
	out.println("</script>");
}


%>
