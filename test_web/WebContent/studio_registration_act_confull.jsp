<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@page import="java.sql.*"%>
<%!
//선언부는 첫 방문자에 의해서 단 한번 수행합니다.
	Connection conn = null;
	// Statement stmt = null;
	ResultSet rs = null;
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String uid = "tpro";
	String pwd = "0000";
	String sql = null;
	PreparedStatement stmt = null;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
request.setCharacterEncoding("UTF-8");
	

String studio_name = request.getParameter("studio_name");	// 사진관 이름 - studio_name

String enter_BN_arr[] = request.getParameterValues("enter_BN");	// 사업자 번호 - enter_bn
String enter_bn="";	// DB에 입력되는 변수
for(String enter_BNS:enter_BN_arr){
	enter_bn += enter_BNS;
}

String studio_number_arr[] = request.getParameterValues("studio_number");	// 사진관 전화번호 - studio_number
String studio_phone= "";	//DB에 저장하는 변수
for(String studio_number:studio_number_arr){
	studio_phone += studio_number;
}

String studio_address_main = request.getParameter("studio_address");
String studio_address_detail = request.getParameter("studio_address_detail");	// 주소 - 
String studio_address = studio_address_main + studio_address_detail;	// DB 입력 변수


String product1_name = request.getParameter("product1_name");
String product1_price = request.getParameter("product1_price");

String product2_name = request.getParameter("product2_name");
String product2_price = request.getParameter("product2_price");

String product3_name = request.getParameter("product3_name");
String product3_price = request.getParameter("product3_price");

String product4_name = request.getParameter("product4_name");
String product4_price = request.getParameter("product4_price");

String product5_name = request.getParameter("product5_name");
String product5_price = request.getParameter("product5_price");

String studio_img = request.getParameter("img");

String studio_content = request.getParameter("studio_content");
%>
<%
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		
		stmt = conn.prepareStatement
				("insert into studio values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
		stmt.setString(1, enter_bn);
		stmt.setString(2, studio_name);
		stmt.setString(3, studio_phone);
		stmt.setString(4, studio_address);
		stmt.setString(5, product1_name);
		stmt.setString(6, product1_price);
		stmt.setString(7, product2_name);
		stmt.setString(8, product2_price);
		stmt.setString(9, product3_name);
		stmt.setString(10, product3_price);
		stmt.setString(11, product4_name);
		stmt.setString(12, product4_price);
		stmt.setString(13, product5_name);
		stmt.setString(14, product5_price);
		stmt.setString(15, studio_img);
		stmt.setString(16, studio_content);
		rs = stmt.executeQuery();
		
		
		//rs = stmt.executeQuery("select * from studio");
		//while(rs.next()){
		//	out.print("<br>enter bn:"+rs.getString("enter_bn")+"   name:"+rs.getString("studio_name"));
		//}

		out.print("DB input complete");
		
		
	} catch( Exception e){
		e.printStackTrace();
		out.print("DB input faild");
	}finally{
		//stmt.close();
		//conn.close();
	}
%>
</body>
</html>