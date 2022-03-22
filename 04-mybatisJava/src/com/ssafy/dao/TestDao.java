package com.ssafy.dao;

import java.util.List;

import com.ssafy.dto.Member;

public interface TestDao {
	List<Member> selectMember();

	Member selectMemberById(String id);

	String selectMemberByInfo(Member m);

	void insertMember(Member m);

	void deleteMember(String id);

	void updateMember(Member m);
}
