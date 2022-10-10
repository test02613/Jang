package com.aplus.item;

import java.sql.Date;

public class ItemVO {
   private Integer itemnum;
   private String itemname;
   private String itemcost;
   private Integer itemcategory;
   private String itemstock;
   private String itemimg;
   private String itemdetailimg;

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

   public String getItemcost() {
      return itemcost;
   }

   public void setItemcost(String itemcost) {
      this.itemcost = itemcost;
   }

   public Integer getitemcategory() {
      return itemcategory;
   }
   
   public void setitemcategory(Integer itemcategory) {
      this.itemcategory = itemcategory;
   }

   public String getItemstock() {
      return itemstock;
   }

   public void setItemstock(String itemstock) {
      this.itemstock = itemstock;
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

   public ItemVO(Integer itemnum, String itemname, String itemcost, Integer itemcategory,  String itemstock, String itemimg, String itemdetailimg) {
      super();
      this.itemnum = itemnum;
      this.itemname = itemname;
      this.itemcost = itemcost;
      this.itemcategory = itemcategory;
      this.itemstock = itemstock;
      this.itemimg = itemimg;
      this.itemdetailimg = itemdetailimg;
   }

   @Override
   public String toString() {
      return "ItemVO [itemnum=" + itemnum + ", itemname=" + itemname + ", itemcost=" + itemcost + ", itemcategory="
            + itemcategory +", itemstock=" + itemstock + ", itemimg=" + itemimg + ", itemdetailimg=" + itemdetailimg + "]";
   }

}