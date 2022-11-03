package com.aplus.event;

import java.sql.Date;
import java.util.List;

import com.aplus.item.ItemAttrVO;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class EventVO {

	// 이벤트번호
	private Integer eventnum;

	// 이벤트등록날짜
	private Date eventdate;

	// 이벤트제목
	private String eventtitle;

	// 이벤트내용
	private String eventcontent;

}