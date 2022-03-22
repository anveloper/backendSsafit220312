package com.ssafy.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.ssafy.common.db.MyAppSqlConfig;
import com.ssafy.dto.Member;

public class TestDaoImpl implements TestDao {
	// SQL - MyBatis
	// SqlSession 객체를 얻어와야 함
	private static SqlSession session;
	private final static String NS = "com.ssafy.dao.TestDao.";

	public TestDaoImpl() {
		this.session = MyAppSqlConfig.getSqlSessionInstance();
	}

	public List<Member> selectMember() {
		return session.selectList(NS + "selectMember");
	}

	public Member selectMemberById(String id) {
		return session.selectOne(NS + "selectMemberById", id);
	}

	public String selectMemberByInfo(Member m) {
		return session.selectOne(NS + "selectMemberByInfo", m);
	}

	public void insertMember(Member m) {
		session.insert(NS + "insertMember", m);
		session.commit();
	}

	public void deleteMember(String id) {
		session.delete(NS + "deleteMember", id);
		session.commit();
	}

	public void updateMember(Member m) {
		session.update(NS + "updateMember", m);
		session.commit();
	}
}
