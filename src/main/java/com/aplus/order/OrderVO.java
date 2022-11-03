package com.aplus.order;

import java.sql.Date;

import com.aplus.item.ItemAttrVO;
import com.aplus.item.ItemVO;

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
public class OrderVO {

	// 회원아이디
	private String id;

	// 상품번호
	private Integer ordernum;

	// 송장번호
	private String shippingnum;

	// 배송비
	private String shippingcost;

	// 주문가격
	private Integer ordercost;

	// 주문날짜
	private Date orderdate;

	// 결제방법
	private String payment;

	// 우편번호
	private String postcode;

	// 배송지 주소
	private String address;

	// 배송지 상세주소
	private String addressdetail;

	// 핸드폰
	private String mobile;

	// 주문자이름
	private String name;

	// 상품코드
	private Integer itemcode;

	// 리뷰작성여부
	private Integer review;

	// 배송/주문상태
	private String state;

	private ItemAttrVO itemattrvo;
	private ItemVO itemvo;
}