package com.aplus.review;

import java.util.List;

public interface ReviewService {
	
	//리뷰 작성
	public void reviewCreate(ReviewVO vo) throws Exception;
	
	//로그인 회원 리뷰 목록
	public List<ReviewVO> reviewList(String id) throws Exception;
	
	//로그인 회원 리뷰 상세
	public ReviewVO reviewDetail(String id) throws Exception;
}
