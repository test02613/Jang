package com.aplus.review;

import java.sql.Date;

import com.aplus.item.ItemVO;
import com.aplus.order.OrderVO;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Builder
@Getter @Setter
@AllArgsConstructor
@NoArgsConstructor
public class ReviewVO {
	
	//상품번호
	private Integer itemnum;
	
	//회원아이디
	private String id;
	
	//리뷰번호
	private Integer reviewnum;
	
	//리뷰등록날짜
	private Date reviewdate;
	
	//리뷰제목
	private String reviewtitle;
	
	//리뷰내용
	private String reviewcontent;
	
	//주문번호
	private Integer ordernum;
}
