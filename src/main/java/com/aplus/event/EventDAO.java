package com.aplus.event;

import java.util.List;

import com.aplus.event.EventVO;

public interface EventDAO {

	// 이벤트 글 작성
	public void EventCreate(EventVO event) throws Exception;

	// 상세페이지
	public EventVO eventDetail(Integer num) throws Exception;

	// 글 수정
	public EventVO eventUpdate(EventVO vo) throws Exception;

	// 글 삭제
	public EventVO eventDelete(Integer num) throws Exception;

	// 게시물 총 갯수
	public int countEvent();

	// 게시글 목록, 페이징 처리 게시글 조회
	public List<EventVO> selectEvent(PagingVO vo);
}