package com.aplus.event;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EventServiceImpl implements EventService {
	@Autowired
	EventDAO dao;

	// (페이징)게시물 총 갯수 
	@Override
	public void EventCreate(EventVO event) throws Exception {

		dao.EventCreate(event);
	}

	// 상세페이지 
	@Override
	public EventVO eventDetail(Integer num) throws Exception {

		return dao.eventDetail(num);
	}

	// 글 수정 
	@Override
	public EventVO eventUpdate(EventVO vo) throws Exception {

		return dao.eventUpdate(vo);
	}

	// 글 삭제 
	@Override
	public EventVO eventDelete(Integer num) throws Exception {

		return dao.eventDelete(num);
	}

	// 게시물 총 갯수 
	@Override
	public int countEvent() {
		return dao.countEvent();
	}

	// 게시글 목록, 페이징 처리 게시글 조회
	@Override
	public List<EventVO> selectEvent(PagingVO vo) {
		
		return dao.selectEvent(vo);
	}

}