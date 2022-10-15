package com.aplus.order;

import java.sql.Date;

public class OrderVO {
   
   private String id;
   private Integer ordernum;
   private String shippingnum;
   private String shippingcost;
   private String ordercost;
   private Date orderdate;
   private String payment;
   private String postcode;
   private String address;
   private String addressdetail;
   private String mobile;
   private String name;
   private Integer itemcode;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Integer getOrdernum() {
		return ordernum;
	}

	public void setOrdernum(Integer ordernum) {
		this.ordernum = ordernum;
	}

	public String getShippingnum() {
		return shippingnum;
	}

	public void setShippingnum(String shippingnum) {
		this.shippingnum = shippingnum;
	}

	public String getShippingcost() {
		return shippingcost;
	}

	public void setShippingcost(String shippingcost) {
		this.shippingcost = shippingcost;
	}

	public String getOrdercost() {
		return ordercost;
	}

	public void setOrdercost(String ordercost) {
		this.ordercost = ordercost;
	}

	public Date getOrderdate() {
		return orderdate;
	}

	public void setOrderdate(Date orderdate) {
		this.orderdate = orderdate;
	}

	public String getPayment() {
		return payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}

	public String getPostcode() {
		return postcode;
	}

	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddressdetail() {
		return addressdetail;
	}

	public void setAddressdetail(String addressdetail) {
		this.addressdetail = addressdetail;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getItemcode() {
		return itemcode;
	}

	public void setItemcode(Integer itemcode) {
		this.itemcode = itemcode;
	}

	public OrderVO(String id, Integer ordernum, String shippingnum, String shippingcost, String ordercost,
			Date orderdate, String payment, String postcode, String address, String addressdetail, String mobile,
			String name, Integer itemcode) {
		super();
		this.id = id;
		this.ordernum = ordernum;
		this.shippingnum = shippingnum;
		this.shippingcost = shippingcost;
		this.ordercost = ordercost;
		this.orderdate = orderdate;
		this.payment = payment;
		this.postcode = postcode;
		this.address = address;
		this.addressdetail = addressdetail;
		this.mobile = mobile;
		this.name = name;
		this.itemcode = itemcode;
	}

	@Override
	public String toString() {
		return "OrderVO [id=" + id + ", ordernum=" + ordernum + ", shippingnum=" + shippingnum + ", shippingcost="
				+ shippingcost + ", ordercost=" + ordercost + ", orderdate=" + orderdate + ", payment=" + payment
				+ ", postcode=" + postcode + ", address=" + address + ", addressdetail=" + addressdetail + ", mobile="
				+ mobile + ", name=" + name + ", itemcode=" + itemcode + "]";
	}

}