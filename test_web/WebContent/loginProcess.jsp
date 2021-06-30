<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "javax.sql.*" %>
<%@ page import = "javax.naming.*" %>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<!-- login process는 입력된 정보를 DB와 연결해주는 기능입니다. -->

<%	
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String password = request.getParameter("pw");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		Context init = new InitialContext(); // 커넥션 풀을 이용하여 DB 연동
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB"); // connection name 불러오기
		conn = ds.getConnection();
		
		pstmt = conn.prepareStatement("select * from cust_info where cust_id =?");
		pstmt.setString(1,id);
		rs = pstmt.executeQuery();
		
		if(rs.next()){  
			   if(password.equals(rs.getString("cust_pw"))){ 
			    session.setAttribute("cust_id",id);
			    out.println("<script>");
			    out.println("location.href='main.jsp'"); //저장된 정보와 아이디와 비밀번호가 일치하면 main.jsp로 보낸다.
			    out.println("</script>");
			   }
			  }
			  out.println("<script>");
			  out.println("location.href='loginForm.jsp'");
			  out.println("alert('아이디 패스워드를 다시 확인해주세요.')");
			  // 일치하지 않으면 loginForm.jsp로 되돌아감
			  out.println("</script>");
			 }catch(Exception e){
			  e.printStackTrace();
			 }
%>

</body>
</html>