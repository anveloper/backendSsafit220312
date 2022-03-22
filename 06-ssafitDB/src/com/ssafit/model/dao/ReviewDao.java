package com.ssafit.model.dao;

import java.util.List;

import com.ssafit.model.Review;

public interface ReviewDao {
    // 영상별 전체 리뷰 가져오기
    public List<Review> selectReviewByYoutubeId(String youtubeId);
    
    // 리뷰 등록
    public void insertReview(Review review);
    
    // 리뷰 상세 조회
    public Review selectReview(int reviewNo);
    
    // 리뷰 수정
    public void updateReview(Review review);
    
    // 리뷰 삭제
    public void deleteReview(int reviewNo);
    
    public void upReviewViewCntByReviewNo(int reviewNo);

}