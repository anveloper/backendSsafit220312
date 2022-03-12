package com.ssafit.model.dao;

import java.util.List;

import com.ssafit.model.Video;

public interface MainDaoImpl {
	public List<Video> selectInterestViewFitVideo();
	public List<Video> selectPartFitVideo(String fitPartName);
}
