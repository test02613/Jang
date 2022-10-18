package com.aplus.item;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Builder
@Getter @Setter
@AllArgsConstructor
@NoArgsConstructor
public class ItemAttrVO {

	private Integer itemnum;
	private Integer itemcode;
	private Integer itemcost;
	private Integer itemstock;
	private String itemname;
	private String itemcolor;
	private String itemgb;

	/*public Integer getItemnum() {
		return itemnum;
	}
	public void setItemnum(Integer itemnum) {
		this.itemnum = itemnum;
	}
	public Integer getItemcode() {
		return itemcode;
	}
	public void setItemcode(Integer itemcode) {
		this.itemcode = itemcode;
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
	public String getItemname() {
		return itemname;
	}
	public void setItemname(String itemname) {
		this.itemname = itemname;
	}
	public String getItemcolor() {
		return itemcolor;
	}
	public void setItemcolor(String itemcolor) {
		this.itemcolor = itemcolor;
	}
	public String getItemgb() {
		return itemgb;
	}
	public void setItemgb(String itemgb) {
		this.itemgb = itemgb;
	}
	
	public ItemAttrVO(Integer itemnum, Integer itemcode, Integer itemcost, Integer itemstock, String itemname,
			String itemcolor, String itemgb) {
		super();
		this.itemnum = itemnum;
		this.itemcode = itemcode;
		this.itemcost = itemcost;
		this.itemstock = itemstock;
		this.itemname = itemname;
		this.itemcolor = itemcolor;
		this.itemgb = itemgb;
	}
	
	@Override
	public String toString() {
		return "ItemAttrVO [itemnum=" + itemnum + ", itemcode=" + itemcode + ", itemcost=" + itemcost + ", itemstock="
				+ itemstock + ", itemname=" + itemname + ", itemcolor=" + itemcolor + ", itemgb=" + itemgb + "]";
	}*/
	
}
