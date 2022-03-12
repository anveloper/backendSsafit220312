package com.ssafit.model;

public class Review {
	private int no;
	private String youtebeId;
	private String title;
	private String writer;
	private String content;
	private int viewCnt;

	public Review() {
	}

	public Review(String youtebeId, String title, String writer, String content) {
		
		this.setYoutebeId(youtebeId);
		this.title = title;
		this.writer = writer;
		this.content = content;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getViewCnt() {
		return viewCnt;
	}

	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}

	public void upViewCnt() {
		this.viewCnt++;
	}

	public String getYoutebeId() {
		return youtebeId;
	}

	public void setYoutebeId(String youtebeId) {
		this.youtebeId = youtebeId;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

}
