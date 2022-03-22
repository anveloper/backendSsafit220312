package com.ssafy.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class Test {
	public static void main(String[] args) {
		try {
			// 1단계 : 드라이버 로딩
			Class.forName("com.mysql.cj.jdbc.Driver"); // driver에 있는 패키지 포함 클래스

			// 2단계 : 연결하기
			Connection con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/scott?serverTimezone=UTC&useUniCode=yes&characterEncoding=UTF-8",
					"ssafy", "ssafy");
			// 3단계 : SQL 작성하기
			StringBuilder sql = new StringBuilder();

			sql.append("SELECT * ");
			sql.append("FROM emp ");
			sql.append("WHERE deptno = 10");

			// 4단계 : SQL 실행 객체 얻어오기
			Statement stmt = con.createStatement();

			
			// 5단계 : SQL 실행하기
			ResultSet rs = stmt.executeQuery(sql.toString());

			// 6단계 : 결과 처리
			while (rs.next()) {
				System.out.println(rs.getString("ename"));
			}

			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {

		}
	}
}
