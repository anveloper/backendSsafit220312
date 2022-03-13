package com.ssafit.model;

import java.util.ArrayList;
import java.util.List;

public class Member {
	private int no;
	private String userId;
	private String password;
	private String nickname;
	private List<String> interestVideos;

	public Member(String userId, String password, String nickname) {
		this.userId = userId;
		this.password = password;
		this.nickname = nickname;
		this.interestVideos = new ArrayList<>();
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	// setUserId()는 삭제
	public String getUserId() {
		return userId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public List<String> getInterestVideos() {
		return interestVideos;
	}

	public void insertInterestVideo(String interestVideoYoutubeId) {
		this.interestVideos.add(interestVideoYoutubeId);
	}

	public void deleteInterestVideo(String interestVideoYoutubeId) {
		this.interestVideos.remove(new String(interestVideoYoutubeId));
	}

	@Override
	public String toString() {
		return "userId : " + this.userId + "\npassword : " + this.password + "\nnickname : " + this.nickname;
	}
}
