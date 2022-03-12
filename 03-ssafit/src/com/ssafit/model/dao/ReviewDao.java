package com.ssafit.model.dao;

import java.util.ArrayList;
import java.util.List;

import com.ssafit.model.Review;

public class ReviewDao {
	private List<Review> list = new ArrayList<>();
	private int no = 0;
	private static ReviewDao instance;

	private ReviewDao() {
		insertReview(new Review("gMaB-fG4u4g", "너무 1재미있네요", "홍길동", "세부 내용을 적는 1창입니다."));
		insertReview(new Review("gMaB-fG4u4g", "너무 2재미있네요", "홍길순", "세부 내용을 적는 2창입니다."));
		insertReview(new Review("gMaB-fG4u4g", "너무 3재미있네요", "김길동", "세부 내용을 적는 3창입니다."));
		insertReview(new Review("gMaB-fG4u4g", "너무 4재미있네요", "박길동", "세부 내용을 적는 4창입니다."));
		insertReview(new Review("gMaB-fG4u4g", "너무 5재미있네요", "남길동", "세부 내용을 적는 5창입니다."));
		insertReview(new Review("gMaB-fG4u4g", "너무 6재미있네요", "동길동", "세부 내용을 적는 6창입니다."));
		insertReview(new Review("gMaB-fG4u4g", "너무 7재미있네요", "길길동", "세부 내용을 적는 7창입니다."));
	}

	public static ReviewDao getInstance() {
		if (instance == null)
			instance = new ReviewDao();
		return instance;
	}

	public void insertReview(Review review) {
		review.setNo(++no);
		review.setViewCnt(0);
		list.add(review);
	}

	public List<Review> getReviewListByYoutubeId(String youtubeId) {
		List<Review> ylist = new ArrayList<>();

		for (Review r : list) {
			if (r.getYoutebeId().equals(youtubeId)) {
				ylist.add(r);
			}
		}
		return ylist;
	}

	public Review getReviewByNo(int no) {
		Review r = null;
		for (Review v : list) {
			if (v.getNo() == no) {
				r = v;
				break;
			}
		}
		return r;
	}

	public void deleteReview(int no) {

		
	}
}
