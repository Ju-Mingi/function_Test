package com.test.dao;

import java.sql.Connection;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

// member 테이블과 연동하는 Data Access Object
// 데이터베이스의 member 테이블과 연동하여 회원정보를 조회, 추가, 수정, 삭제 작업을 수행하는 클래스이다.
public class MemberDAO {
	private MemberDAO() {

	}

	private static MemberDAO instance = new MemberDAO();

	public static MemberDAO getInstance() {
		return instance;
	}

	public Connection getConnection() throws Exception {
		Connection conn = null;
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB"); // oracle 계정정보 가져오기
		conn = ds.getConnection();
		return conn;
	}
}
