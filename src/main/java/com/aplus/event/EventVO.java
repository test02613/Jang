package com.aplus.event;

import java.sql.Date;
import java.util.List;

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
public class EventVO {
	
   private Integer eventnum;
   private Date eventdate;
   private String eventtitle;
   private String eventcontent;
 
   
   /*public Integer getEventnum() {
      return eventnum;
   }
   public void setEventnum(Integer eventnum) {
      this.eventnum = eventnum;
   }
   public Date getEventdate() {
      return eventdate;
   }
   public void setEventdate(Date eventdate) {
      this.eventdate = eventdate;
   }
   public String getEventtitle() {
      return eventtitle;
   }
   public void setEventtitle(String eventtitle) {
      this.eventtitle = eventtitle;
   }
   public String getEventcontent() {
      return eventcontent;
   }
   public void setEventcontent(String eventcontent) {
      this.eventcontent = eventcontent;
   }

  
   
public EventVO(Integer eventnum, Date eventdate, String eventtitle, String eventcontent) {
	super();
	this.eventnum = eventnum;
	this.eventdate = eventdate;
	this.eventtitle = eventtitle;
	this.eventcontent = eventcontent;
}
@Override
   public String toString() {
      return "EventVO [eventnum=" + eventnum + ", eventdate=" + eventdate + ", eventtitle=" + eventtitle
            + ", eventcontent=" + eventcontent + "]";
   }*/
   
   

}