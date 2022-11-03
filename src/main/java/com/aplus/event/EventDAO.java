package com.aplus.event;

import java.util.List;

import com.aplus.event.EventVO;

public interface EventDAO {

	// 이벤트 글 작성
	public void EventCreate(EventVO event) throws Exception;

	// 글 목록
	public List<EventVO> list() throws Exception;

	// 상세페이지
	public EventVO eventDetail(Integer num) throws Exception;

	// 글 수정
	public EventVO eventUpdate(EventVO vo) throws Exception;

	// 글 삭제
	public EventVO eventDelete(Integer num) throws Exception;

	// (페이징)게시물 총 갯수 진행중
	public int count() throws Exception;
}