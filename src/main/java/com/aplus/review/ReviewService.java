package com.aplus.review;

import java.util.List;

import com.aplus.order.OrderVO;

public interface ReviewService {
	
	//리뷰 작성
	public void reviewCreate(ReviewVO vo) throws Exception;
	
	//로그인 회원 리뷰 목록
	public List<ReviewVO> reviewList(String id) throws Exception;
	
	//로그인 회원 리뷰 상세
	public ReviewVO reviewDetail(Integer num) throws Exception;

	//리뷰 업데이트 ajax
	public void review_up(OrderVO vo) throws Exception;
	
	//reviewnum 가져오기
	public ReviewVO reviewnum(ReviewVO vo) throws Exception;
	
	//리뷰 수정
	public ReviewVO reviewUpdate(ReviewVO vo) throws Exception;
	
	//리뷰 삭제
	public ReviewVO reviewDelete(Integer num) throws Exception;
}
