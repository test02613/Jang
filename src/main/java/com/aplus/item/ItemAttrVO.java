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
public class ItemAttrVO {

	// 상품번호
	private Integer itemnum;

	// 상품코드
	private Integer itemcode;

	// 상품가격
	private Integer itemcost;

	// 재고
	private Integer itemstock;

	// 상품명
	private String itemname;

	// 옵션
	private String itemoption;

}
