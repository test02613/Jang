package com.aplus.cart;

import com.aplus.item.ItemAttrVO;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Builder
@Getter @Setter
@AllArgsConstructor
@NoArgsConstructor
public class CartVO {

	private String id;
	private String itemname;
	private Integer itemcode;
	private Integer itemcost;
	private String itemimg;
	
	/*public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getItemname() {
		return itemname;
	}
	public void setItemname(String itemname) {
		this.itemname = itemname;
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
	public String getItemimg() {
		return itemimg;
	}
	public void setItemimg(String itemimg) {
		this.itemimg = itemimg;
	}
	
	public CartVO(String id, String itemname, Integer itemcode, Integer itemcost, String itemimg) {
		super();
		this.id = id;
		this.itemname = itemname;
		this.itemcode = itemcode;
		this.itemcost = itemcost;
		this.itemimg = itemimg;
	}
	
	@Override
	public String toString() {
		return "CartVO [id=" + id + ", itemname=" + itemname + ", itemcode=" + itemcode + ", itemcost=" + itemcost
				+ ", itemimg=" + itemimg + "]";
	}*/
	
}
