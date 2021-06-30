<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "javax.sql.*" %>
<%@ page import = "javax.naming.*" %>
<%@ page import = "java.sql.*" %>

<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String password = request.getParameter("pw");
	String password_check = request.getParameter("pw_check");
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String birthday = request.getParameter("birth_yy")+request.getParameter("birth_mm")+request.getParameter("birth_dd");
	String email = request.getParameter("email_1")+"@"+request.getParameter("email_2");
	String phone = request.getParameter("phone_1")+request.getParameter("phone_2")+request.getParameter("phone_3");
	String address = request.getParameter("address_street")+request.getParameter("address_detail");
	String question = request.getParameter("question");
	String answer = request.getParameter("answer");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		
		pstmt = conn.prepareStatement("INSERT INTO CUST_INFO VALUES(?,?,?,?,?,?,?,?,?,?,?)");
		pstmt.setString(1,id);
		pstmt.setString(2,password);
		pstmt.setString(3,password_check);
		pstmt.setString(4,name);
		pstmt.setString(5,gender);
		pstmt.setString(6,phone);
		pstmt.setString(7,email);
		pstmt.setString(8,address);
		pstmt.setString(9,birthday);
		pstmt.setString(10,question);
		pstmt.setString(11,answer);
		
		int result = pstmt.executeUpdate();
		
		if(result !=0){
			out.println("<script>");
			out.println("location.href = 'loginForm.jsp'");
			out.println("</script>");
		}else{
			out.println("<script>");
			out.println("location.href = 'joinForm.jsp'");
			out.println("</script>");
		}
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

</body>
</html>