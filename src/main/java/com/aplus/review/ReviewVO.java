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

	private Integer itemnum;
	private String id;
	private Integer reviewnum;
	private Date reviewdate;
	private String reviewtitle;
	private String reviewcontent;
	private Integer ordernum;
}
