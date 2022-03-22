package com.ssafit.model;

public class Video {
	private String title;
	private int fitPartNo;
	private String youtubeId;
	private String channelName;
	private String url;
	private int viewCnt;

	public Video(String title, int fitPartNo, String youtubeId, String channelName, String url) {
		this.title = title;
		this.fitPartNo = fitPartNo;
		this.youtubeId = youtubeId;
		this.channelName = channelName;
		this.url = url;
		this.viewCnt = 0;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getFitPartNo() {
		return fitPartNo;
	}

	public void setFitPartName(int fitPartNo) {
		this.fitPartNo = fitPartNo;
	}

	public String getYoutubeId() {
		return youtubeId;
	}

	public void setYoutubeId(String youtubeId) {
		this.youtubeId = youtubeId;
	}

	public String getChannelName() {
		return channelName;
	}

	public void setChannelName(String channelName) {
		this.channelName = channelName;
	}

	public int getViewCnt() {
		return viewCnt;
	}

	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public void upViewCnt() {
		this.viewCnt++;
	}

}
