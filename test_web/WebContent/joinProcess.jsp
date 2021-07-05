<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "javax.sql.*" %>
<%@ page import = "javax.naming.*" %>
<%@ page import = "java.sql.*" %>

<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String password = request.getParameter("pw");
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String birthday = request.getParameter("birth_yy")+request.getParameter("birth_mm")+request.getParameter("birth_dd");
	String email = request.getParameter("email_1")+"@"+request.getParameter("email_2");
	String phone = request.getParameter("phone_1")+request.getParameter("phone_2")+request.getParameter("phone_3");
	String address = request.getParameter("address_street")+request.getParameter("address_detail");
	String question = request.getParameter("question");
	String answer = request.getParameter("answer");
	String ent_name = request.getParameter("enter_name");
	String ent_num = request.getParameter("enter_1")+request.getParameter("enter_2")+request.getParameter("enter_3");
	String ent_phone = request.getParameter("ent_phone_1")+request.getParameter("ent_phone_2")+request.getParameter("ent_phone_3");
	String ent_address = request.getParameter("ent_Address")+" "+request.getParameter("entAddress");
	
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/OracleDB"); // oracle 계정정보 가져오기
		conn = ds.getConnection();
		
		pstmt = conn.prepareStatement("INSERT INTO CUST_INFO "+
		"VALUES(?,?,?,?,?,?,?,?,?,?)");
		pstmt.setString(1,id);
		pstmt.setString(2,password);
		pstmt.setString(3,name);
		pstmt.setString(4,gender);
		pstmt.setString(5,phone);
		pstmt.setString(6,email);
		pstmt.setString(7,address);
		pstmt.setString(8,birthday);
		pstmt.setString(9,question);
		pstmt.setString(10,answer);
		
		int result = pstmt.executeUpdate();
		out.println(result);
		
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
		out.println("<script>");
		out.println("alert('회원 가입 정보를 다시 입력해주세요.')");
		out.println("location.href = 'joinForm.jsp'");
		out.println("</script>");
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