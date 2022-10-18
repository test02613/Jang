package com.aplus.review;

import com.aplus.item.ItemVO;

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
	private Integer reviewdate;
	private Integer reviewtitle;
	private Integer reviewcontent;
	
}
