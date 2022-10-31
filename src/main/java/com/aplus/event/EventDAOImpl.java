package com.aplus.event;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EventDAOImpl implements EventDAO {
	@Autowired
	SqlSession sql;

	/* 이벤트 글 작성 */
	@Override
	public void EventCreate(EventVO event) throws Exception {
		sql.insert("mapper.Event_SQL.event_insert", event);
	}

	/* 글 목록 */
	@Override
	public List<EventVO> list() throws Exception {

		return sql.selectList("mapper.Event_SQL.event_list");
	}

	/* 상세페이지 */
	@Override
	public EventVO eventDetail(Integer num) throws Exception {

		return sql.selectOne("mapper.Event_SQL.event_detail", num);
	}

	/* 글 수정 */
	@Override
	public EventVO eventUpdate(EventVO vo) throws Exception {

		return sql.selectOne("mapper.Event_SQL.event_update", vo);
	}

	/* 글 삭제 */
	@Override
	public EventVO eventDelete(Integer num) throws Exception {

		return sql.selectOne("mapper.Event_SQL.event_delete", num);
	}

	/* (페이징)게시물 총 갯수 진행중 */
	@Override
	public int count() throws Exception {

		return sql.selectOne("mapper.Event_SQL.event_count");
	}

}
