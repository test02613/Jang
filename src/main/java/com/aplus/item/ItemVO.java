package com.aplus.item;

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
public class ItemVO {

	// 상품번호
	private Integer itemnum;

	// 상품이름
	private String itemname;

	// 상품카테고리2
	private Integer itemcat2;

	// 상품썸네일이미지
	private String itemimg;

	// 상품상세이미지
	private String itemdetailimg;

	// 상품카테고리1
	private Integer itemcat1;

}