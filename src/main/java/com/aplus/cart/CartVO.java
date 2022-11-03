package com.aplus.cart;

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
public class CartVO {

	// 회원아이디
	private String id;

	// 상품이름
	private String itemname;

	// 상품코드
	private Integer itemcode;

	// 상품가격
	private Integer itemcost;

	// 상품이미지
	private String itemimg;

	// 상품속성
	private String itemoption;
}
