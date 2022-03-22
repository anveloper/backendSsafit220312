package com.ssafit.model;

public class Review {
	private int reviewNo;
	private String youtubeId;
	private String title;
	private String userId;
	private int memberNo;
	private String content;
	private String regDate;
	private int viewCnt;

	public Review() {
	}

	public Review(String youtubeId, String title, String userId, String content) {
		this.youtubeId = youtubeId;
		this.title = title;
		this.userId = userId;
		this.content = content;
	}
	
	public Review(int reviewNo, String title, String content) {
		this.reviewNo = reviewNo;
		this.title = title;
		this.content = content;
	}
	
//	public Review(String youtubeId, String title, int memberNo, String content) {
//
//		this.youtubeId = youtubeId;
//		this.title = title;
//		this.memberNo = memberNo;
//		this.content = content;
//	}
	
	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public String getYoutubeId() {
		return youtubeId;
	}

	public void setYoutubeId(String youtubeId) {
		this.youtubeId = youtubeId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public int getViewCnt() {
		return viewCnt;
	}

	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}

	@Override
	public String toString() {
		return this.reviewNo + " :: " + this.youtubeId + " :: " + this.title + " :: " + this.userId + " :: "
				+ this.content + " :: " + this.regDate + " :: " + this.viewCnt;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
}
