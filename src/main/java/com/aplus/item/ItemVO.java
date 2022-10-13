package com.aplus.item;

import java.sql.Date;

public class ItemVO {
	private Integer itemnum;
	private String itemname;
	private Integer itemcat2;
	private String itemimg;
	private String itemdetailimg;
	private Integer itemcat1;
	private Integer itemcost;
	private Integer itemstock;

	public Integer getItemnum() {
		return itemnum;
	}

	public void setItemnum(Integer itemnum) {
		this.itemnum = itemnum;
	}

	public String getItemname() {
		return itemname;
	}

	public void setItemname(String itemname) {
		this.itemname = itemname;
	}

	public Integer getItemcat2() {
		return itemcat2;
	}

	public void setItemcat2(Integer itemcat2) {
		this.itemcat2 = itemcat2;
	}

	public String getItemimg() {
		return itemimg;
	}

	public void setItemimg(String itemimg) {
		this.itemimg = itemimg;
	}

	public String getItemdetailimg() {
		return itemdetailimg;
	}

	public void setItemdetailimg(String itemdetailimg) {
		this.itemdetailimg = itemdetailimg;
	}

	public Integer getItemcat1() {
		return itemcat1;
	}

	public void setItemcat1(Integer itemcat1) {
		this.itemcat1 = itemcat1;
	}

	public Integer getItemcost() {
		return itemcost;
	}

	public void setItemcost(Integer itemcost) {
		this.itemcost = itemcost;
	}

	public Integer getItemstock() {
		return itemstock;
	}

	public void setItemstock(Integer itemstock) {
		this.itemstock = itemstock;
	}

	public ItemVO(Integer itemnum, String itemname, Integer itemcat2, String itemimg, String itemdetailimg,
			Integer itemcat1, Integer itemcost, Integer itemstock) {
		super();
		this.itemnum = itemnum;
		this.itemname = itemname;
		this.itemcat2 = itemcat2;
		this.itemimg = itemimg;
		this.itemdetailimg = itemdetailimg;
		this.itemcat1 = itemcat1;
		this.itemcost = itemcost;
		this.itemstock = itemstock;
	}

	@Override
	public String toString() {
		return "ItemVO [itemnum=" + itemnum + ", itemname=" + itemname + ", itemcat2=" + itemcat2 + ", itemimg="
				+ itemimg + ", itemdetailimg=" + itemdetailimg + ", itemcat1=" + itemcat1 + ", itemcost=" + itemcost
				+ ", itemstock=" + itemstock + "]";
	}

}