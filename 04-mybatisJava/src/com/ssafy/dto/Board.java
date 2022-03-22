package com.ssafy.dto;

public class Board {
	private int no;
	private String writer;
	private String title;
	private String content;
	private int viewCnt;	

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	@Override
	public String toString() {
		return "no : " + this.no + "작성자 : " + this.writer + ", 제목 : " + this.title + ", 내용 : " + this.content + ", 뷰 :"
				+ this.viewCnt;
	}
}
