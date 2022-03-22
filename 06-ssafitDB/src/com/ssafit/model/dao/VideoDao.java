package com.ssafit.model.dao;

import java.util.List;

import com.ssafit.model.Video;

public interface VideoDao {
    // 비디오 조회수 가져오기
    public List<Video> selectVideoByViewCnt();
    
    // 비디오 파트별로 가져오기
    public List<Video> selectVideoByPartNo(int partNo);
    
	public Video selectVideoByYoutubeId(String youtubeId);

	public void upVideoViewCntByYoutubeId(String youtubeId);

}