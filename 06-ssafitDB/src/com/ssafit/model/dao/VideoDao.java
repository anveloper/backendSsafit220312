package com.ssafit.model.dao;

import java.util.List;

import com.ssafit.model.Video;

public interface VideoDao {

	public List<Video> selectInterestViewFitVideo();

	public List<Video> selectPartFitVideo(int partNo);

}
