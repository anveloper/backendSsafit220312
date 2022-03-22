package com.ssafy.test;

import java.util.List;

import com.ssafy.common.db.MyAppSqlConfig;
import com.ssafy.dao.BoardDao;
import com.ssafy.dao.TestDao;
import com.ssafy.dao.TestDaoImpl;
import com.ssafy.dto.Board;
import com.ssafy.dto.Member;

public class Test1 {

	public static void main(String[] args) {
		try {
//			// 다시 해볼 것
//			BoardDao dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(BoardDao.class);
//			List<Board> list = dao.selectBoard();
//			for (Board b : list) {
//				System.out.println(b.toString());
//			}
			
//			TestDao dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(TestDao.class);
			
			// 조회
			
			test01();
			
//			test02("member-4");
//			Member m = new Member();
//			m.setId("member-3");
//			m.setEmail("daejeon@ssafy.com");
//			test03(m);
			// 등록
//			insertMember(new Member("member-6","허경영","jeonkook","her@gyung.young"));
			// 삭제
//			deleteMember("member-5");
			// 수정
//			Member m = new Member();
//			m.setId("member-4");
//			m.setEmail("부울경@불.경");			
//			updateMember(m);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 여러개의 로우를 결과로 받기
	private static void test01() {
		TestDao dao = new TestDaoImpl();
		List<Member> list = dao.selectMember();
		for (Member m : list) {
			System.out.println(m.getId() + ", " + m.getName() + ", " + m.getJoinDate());
		}
	}

	// 데이터를 조회하기 : 하나의 로우를 반환
	private static void test02(String id) {
		Member m = new TestDaoImpl().selectMemberById(id);
		System.out.println(m.getId() + ", " + m.getName() + ", " + m.getJoinDate());
	}

	// Member로 데이터에 값 1개를 불러오기
	private static void test03(Member m) {
		System.out.println(new TestDaoImpl().selectMemberByInfo(m));
	}

	// 회원 등록
	private static void insertMember(Member m) {
		new TestDaoImpl().insertMember(m);
	}

	// 회원 삭제
	private static void deleteMember(String id) {
		new TestDaoImpl().deleteMember(id);
	}

	// 회원 수정
	private static void updateMember(Member m) {
		new TestDaoImpl().updateMember(m);
	}
}
