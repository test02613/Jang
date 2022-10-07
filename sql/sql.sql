create table member (
      id   varchar2(20)      not null primary key,
      name   varchar2(100)      not null,
      pw   varchar2(20)      not null,
      email   varchar2(50)      not null unique,
      mobile   varchar2(20)      not null,
      postcode   char(5)      not null,
      address   varchar2(300)      not null,
      addressdetail   varchar2(300)      not null,
      admin   char      not null,
      joindate   date      not null,
      point   number,
      leave   char      not null
   );

   create table ordertable (
      id   varchar2(20)      not null,
      ordernum   varchar2(20)      not null primary key,
      shippingnum   varchar2(20)      ,
      shippingcost   varchar2(20)      ,
      ordercost   varchar2(20)      not null,
      orderdate   date      not null,
      payment   varchar(255)      not null
      );

   create table event (
      eventnum   NUMBER      not null primary key,
      eventdate   date      not null,
      eventtitle   varchar(255)      not null,
      eventcontent   varchar(4000)      not null
   );

   create table review (
      itemnum   NUMBER      not null,
      id   varchar(255)      not null,
      reviewnum   NUMBER      not null primary key,
      reviewdate   date      not null,
      reviewtitle   varchar(255)      not null,
      reviewcontent   varchar(4000)      not null,
      reviewpw   varchar(255)      not null
   );

   create table item (
      itemnum   NUMBER      not null primary key,
      itemname   varchar(255)      not null,
      itemcost   varchar(255)      not null,
      category1   varchar(255),
      category2   varchar(255),
      category3   varchar(255),
      itemstock   varchar(255)      
   );
   
CREATE SEQUENCE  eventNum_seq  MINVALUE 1 MAXVALUE 99999 INCREMENT BY 1 START WITH 1 NOCACHE ORDER NOCYCLE ;
CREATE SEQUENCE  reviewNum_seq  MINVALUE 1 MAXVALUE 99999 INCREMENT BY 1 START WITH 1 NOCACHE ORDER NOCYCLE ;
CREATE SEQUENCE  itemNum_seq  MINVALUE 1 MAXVALUE 99999 INCREMENT BY 1 START WITH 1 NOCACHE ORDER NOCYCLE ;


commit;