package com.ssafit.model.dao;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import com.ssafit.model.Video;

public class MainDao implements MainDaoImpl {
	private List<Video> list = new ArrayList<>();
	private static MainDao instance;

	private MainDao() {
		list.add(new Video("전신 다이어트 최고의 운동 [칼소폭 찐 핵핵매운맛]", "전신", "gMaB-fG4u4g", "ThankyouBUBU",
				"https://www.youtube.com/embed/gMaB-fG4u4g"));
		list.add(new Video("하루 15분! 전신 칼로리 불태우는 다이어트 운동", "전신", "swRNeYw1JkY", "ThankyouBUBU",
				"https://www.youtube.com/embed/swRNeYw1JkY"));
		list.add(new Video("상체 다이어트 최고의 운동 BEST [팔뚝살/겨드랑이살/등살/가슴어깨라인]", "상체", "54tTYO-vU2E", "ThankyouBUBU",
				"https://www.youtube.com/embed/54tTYO-vU2E"));
		list.add(new Video("상체비만 다이어트 최고의 운동 [상체 핵매운맛]", "상체", "QqqZH3j_vH0", "ThankyouBUBU",
				"https://www.youtube.com/embed/QqqZH3j_vH0"));
		list.add(new Video("하체운동이 중요한 이유? 이것만 보고 따라하자 ! [하체운동 교과서]", "하체", "tzN6ypk6Sps", "김강민",
				"https://www.youtube.com/embed/tzN6ypk6Sps"));
		list.add(new Video("11자복근 복부 최고의 운동 [복근 핵매운맛]", "복부", "PjGcOP-TQPE", "ThankyouBUBU",
				"https://www.youtube.com/embed/PjGcOP-TQPE"));
		list.add(new Video("(Sub)누워서하는 5분 복부운동!! 효과보장! (매일 2주만 해보세요!)", "복부", "7TLk7pscICk", "SomiFit",
				"https://www.youtube.com/embed/7TLk7pscICk"));
	}

	public static MainDao getInstance() {
		if (instance == null)
			instance = new MainDao();
		return instance;
	}

	public void insertVideo(Video video) {
		list.add(video);
	}

	@Override
	public List<Video> selectInterestViewFitVideo() {
		Collections.sort(list, new Comparator<Video>() {
			@Override
			public int compare(Video o1, Video o2) {
				return ((Integer) o2.getViewCnt()).compareTo(o1.getViewCnt());
			}
		});
		return list;
	}

	@Override
	public List<Video> selectPartFitVideo(String fitPartName) {
		List<Video> plist = new ArrayList<>();
		for (Video v : list) {
			if (v.getFitPartName().equals(fitPartName)) {
				plist.add(v);
			}
		}
		return plist;
	}

	public Video getVideoByYoutubeId(String youtubeId) {
		Video rst = null;
		for (Video v : list) {
			if (v.getYoutubeId().equals(youtubeId)) {
				rst = v;
				break;
			}
		}

		return rst;
	}

}