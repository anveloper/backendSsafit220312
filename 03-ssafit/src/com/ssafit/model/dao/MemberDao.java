package com.ssafit.model.dao;

import java.util.ArrayList;
import java.util.List;

import com.ssafit.model.Member;

public class MemberDao {
	private List<Member> list = new ArrayList<>();
	private List<String> idList = new ArrayList<>();
	private List<String> nameList = new ArrayList<>();
	private int no = 0;
	private static MemberDao instance;

	private MemberDao() {
		doJoinMember(new Member("admin", "admin", "관리자"));
		doJoinMember(new Member("asdf", "asdf", "만능임시아이디"));
	}

	public static MemberDao getInstance() {
		if (instance == null)
			instance = new MemberDao();
		return instance;
	}

	public void doJoinMember(Member member) {
		member.setNo(no++); // admin id 자동생성 admin = 0;
		idList.add(member.getUserId());
		nameList.add(member.getNickname());
		list.add(member);
	}

	public Member getMemberByUserId(String userId, String password) {
		Member rst = null;
		for (Member m : list) {
			if (m.getUserId().equals(userId) && m.getPassword().equals(password))
				rst = m;
		}
		return rst;
	}

	public boolean isExistedUserId(String userId) {
		return idList.contains(userId);
	}

	public boolean isExistedNickname(String nickname) {
		return nameList.contains(nickname);
	}

	public int isAvailableUserId(String userId) {
		if (userId.charAt(0) < 'a' || userId.charAt(0) > 'z')
			return 1; // 첫글자가 숫자면 1
		else if (userId.length() < 5)
			return 2; // 길이가 짧으면 2
		else if (userId.length() > 16)
			return 3;
		else {
			for (char c : userId.toCharArray()) {
				boolean flag = false;
				if (c < 'a' || c > 'z')
					flag = true; // 숫자포함 알파벳 아니면 true
				if (c >= '0' && c <= '9')
					flag = false; // 숫자였으면 다시 false
				if (flag)
					return 4;
			}
		} // 여기까지 왔으면 가능한 ID
		return 0;
	}

	public int isAvailablePassword(String password) {
		if (password.length() < 8)
			return 1; // 길이가 짧으면 1
		else if (password.length() > 20)
			return 2;
		else {
			for (char c : password.toCharArray()) {
				boolean flag = false;
				if (c < 'a' || c > 'z')
					flag = true; // 숫자포함 알파벳 아니면 true
				if (c >= '0' && c <= '9')
					flag = false; // 숫자였으면 다시 false
				if (flag)
					return 3;
			}
		} // 여기까지 왔으면 가능한 ID
		return 0;
	}

	public int isAvailableNickname(String nickname) {
		if (nickname.length() < 2)
			return 1; // 길이가 짧으면 2
		else if (nickname.length() > 8)
			return 2;
		// 여기까지 왔으면 가능한 ID
		return 0;
	}
	
}
