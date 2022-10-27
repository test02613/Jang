--------------------------------------------------------
--  파일이 생성됨 - 목요일-9월-29일-2022   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table MEMBER
--------------------------------------------------------
	CRATE TABLE MEMBER (
	  ID	VARCHAR2(20)	NOT NULL	PRIMARY KEY,
	  NAME	VARCHAR2(100)	NOT NULL,
	  PW	VARCHAR2(20)	NOT NULL,
	  EMAIL	VARCHAR2(50)	NOT NULL	UNIQUE,
	  MOBILE	VARCHAR2(20)	NOT NULL,
	  POSTCODE	CHAR(5)	NOT NULL,
	  ADDRESS	VARCHAR2(300)	NOT NULL,
	  ADDRESSDETAIL	VARCHAR2(300)	NOT NULL,
	  ADMIN	CHAR DEFAULT'0',
	  JOINDATE	DATE ,
	  POINT	NUMBER,
	  LEAVE	CHAR	DEFAULT'0'      
   );
   
	   COMMENT ON COLUMN "ID" IS '회원아이디';
	   COMMENT ON COLUMN "NAME" IS '회원이름';
	   COMMENT ON COLUMN "PW" IS '비밀번호';
	   COMMENT ON COLUMN "EMAIL" IS '이메일';
	   COMMENT ON COLUMN "MOBILE" IS '핸드폰';
	   COMMENT ON COLUMN "POSTCODE" IS '우편번호';
	   COMMENT ON COLUMN "ADDRESS" IS '주소';
	   COMMENT ON COLUMN "ADDRESSDETAIL" IS '상세주소';
	   COMMENT ON COLUMN "ADMIN" IS '관리자구분';
	   COMMENT ON COLUMN "JOINDATE" IS '가입날짜';
	   COMMENT ON COLUMN "POINT" IS '포인트';
	   COMMENT ON COLUMN "LEAVE" IS '회원상태';
	   
--------------------------------------------------------
--  DDL for Table ORDERTABLE
--------------------------------------------------------  
	CRATE TABLE ORDERTABLE (
	  ID	VARCHAR2(20),
	  ORDERNUM	NUMBER	PRIMARY KEY,
	  SHIPPINGNUM	VARCHAR2(20),
	  SHIPPINGCOST	VARCHAR2(20),
	  ORDERCOST	VARCHAR2(20),
	  ORDERDATE	DATE,
	  PAYMENT	VARCHAR2(20),
	  POSTCODE	VARCHAR2(20),
	  ADDRESS	VARCHAR2(45),
	  ADDRESSDETAIL	VARCHAR2(45),
	  MOBILE	VARCHAR2(20),
	  NAME	VARCHAR2(20),
	  ITEMCODE	NUMBER,
	  REVIEW	NUMBER,
	  STATE	VARCHAR2(20)	DEFAULT '주문완료' 
	);

	   COMMENT ON COLUMN "ID" IS '아이디';
	   COMMENT ON COLUMN "ORDERNUM" IS '주문번호';
	   COMMENT ON COLUMN "SHIPPINGNUM" IS '운송장번호';
	   COMMENT ON COLUMN "SHIPPINGCOST" IS '배송비';
	   COMMENT ON COLUMN "ORDERCOST" IS '결제가격';
	   COMMENT ON COLUMN "ORDERDATE" IS '결제날짜';
	   COMMENT ON COLUMN "PAYMENT" IS '결제수단';
	   COMMENT ON COLUMN "POSTCODE" IS '우편번호';
	   COMMENT ON COLUMN "ADDRESS" IS '주소';
	   COMMENT ON COLUMN "ADDRESSDETAIL" IS '상세주소';
	   COMMENT ON COLUMN "MOBILE" IS '핸드폰';
	   COMMENT ON COLUMN "NAME" IS '이름';
	   COMMENT ON COLUMN "ITEMCODE" IS '상품번호';
	   COMMENT ON COLUMN "REVIEW" IS '리뷰작성여부';
	   COMMENT ON COLUMN "STATE" IS '주문배송상태';   
	   
--------------------------------------------------------
--  DDL for Table EVENT
--------------------------------------------------------
	CRATE TABLE EVENT (
	  EVENTNUM	NUMBER	PRIMARY KEY,
	  EVENTDATE	DATE,
	  EVENTTITLE	VARCHAR(255),
	  EVENTCONTENT	VARCHAR(4000)       
	);

	   COMMENT ON COLUMN "EVENTNUM" IS '이벤트번호';
	   COMMENT ON COLUMN "EVENTDATE" IS '이벤트작성날짜';
	   COMMENT ON COLUMN "EVENTTITLE" IS '이벤트제목';
	   COMMENT ON COLUMN "EVENTCONTENT" IS '이벤트내용'; 
	   
--------------------------------------------------------
--  DDL for Table REVIEW
--------------------------------------------------------
	CRATE TABLE REVIEW (
	  ITEMNUM	NUMBER,
	  ID	VARCHAR(255),
	  REVIEWNUM	NUMBER	PRIMARY KEY,
	  REVIEWDATE	DATE,
	  REVIEWTITLE	VARCHAR(255),
	  REVIEWCONTENT   VARCHAR(4000),
	  ORDERNUM NUMBER
	);

	   COMMENT ON COLUMN "ITEMNUM" IS '상품번호';
	   COMMENT ON COLUMN "ID" IS '아이디';
	   COMMENT ON COLUMN "REVIEWNUM" IS '리뷰번호';
	   COMMENT ON COLUMN "REVIEWDATE" IS '리뷰작성날짜'; 
	   COMMENT ON COLUMN "REVIEWTITLE" IS '리뷰제목';
	   COMMENT ON COLUMN "REVIEWCONTENT" IS '리뷰내용';
	   COMMENT ON COLUMN "ORDERNUM" IS '주문번호';
	   
--------------------------------------------------------
--  DDL for Table ITEM
--------------------------------------------------------
	CRATE TABLE ITEM (
	  ITEMNUM	NUMBER	PRIMARY KEY,
	  ITEMNAME	VARCHAR(255),
	  CATEGORY2	NUMBER,
	  ITEMIMG	VARCHAR2(200),
	  ITEMDETAILIMG	VARCHAR2(200),
	  CATEGORY1	NUMBER,
	  ITEMCOST	NUMBER,
	  ITEMSTOCK	NUMBER      
	);

	   COMMENT ON COLUMN "ITEMNUM" IS '상품번호';
	   COMMENT ON COLUMN "ITEMNAME" IS '상품이름';
	   COMMENT ON COLUMN "CATEGORY2" IS '카테고리2';
	   COMMENT ON COLUMN "ITEMIMG" IS '썸네일'; 
	   COMMENT ON COLUMN "ITEMDETAILIMG" IS '상세이미지';
	   COMMENT ON COLUMN "CATEGORY1" IS '카테고리1';
	   COMMENT ON COLUMN "ITEMCOST" IS '상품가격';
	   COMMENT ON COLUMN "ITEMSTOCK" IS '재고';
	   
--------------------------------------------------------
--  DDL for Table ITEMATTR
--------------------------------------------------------   
	CRATE TABLE ITEMATTR (
	  ITEMNUM	NUMBER    PRIMARY KEY,
	  ITEMCODE	NUMBER,
	  ITEMCOST	NUMBER,
	  ITEMSTOCK	NUMBER,
	  ITEMNAME	VARCHAR(20),
	  ITEMCOLOR	VARCHAR(20),
	  ITEMGB	VARCHAR(20)
	);

	   COMMENT ON COLUMN "ITEMNUM" IS '상품번호';
	   COMMENT ON COLUMN "ITEMCODE" IS '상품코드';
	   COMMENT ON COLUMN "ITEMCOST" IS '상품가격';
	   COMMENT ON COLUMN "ITEMSTOCK" IS '재고'; 
	   COMMENT ON COLUMN "ITEMNAME" IS '상품이름';
	   COMMENT ON COLUMN "ITEMCOLOR" IS '컬러';
	   COMMENT ON COLUMN "ITEMGB" IS '용량';
	   
--------------------------------------------------------
--  DDL for Table CART
--------------------------------------------------------
	CRATE TABLE CART(
	  ID	VARCHAR(20),
	  ITEMNAME	VARCHAR(200),
	  ITEMCODE	NUMBER,
	  ITEMCOST	NUMBER,
	  ITEMIMG	VARCHAR(200), 
	  ITEMATTR	VARCHAR(200), 
	);
 
	   COMMENT ON COLUMN "ID" IS '아이디';
	   COMMENT ON COLUMN "ITEMNAME" IS '상품이름';
	   COMMENT ON COLUMN "ITEMCODE" IS '상품코드';
	   COMMENT ON COLUMN "ITEMCOST" IS '상품가격'; 
	   COMMENT ON COLUMN "ITEMIMG" IS '썸네일';
	   COMMENT ON COLUMN "ITEMATTR" IS '상품속성';
   
--------------------------------------------------------
--  DDL for Sequence EVENTNUM_SEQ
--------------------------------------------------------
CREATE SEQUENCE  EVENTNUM_SEQ  MINVALUE 1 MAXVALUE 99999 INCREMENT BY 1 START WITH 1 NOCACHE ORDER NOCYCLE ;

--------------------------------------------------------
--  DDL for Sequence REVIEWNUM_SEQ
--------------------------------------------------------
CREATE SEQUENCE  REVIEWNUM_SEQ  MINVALUE 1 MAXVALUE 99999 INCREMENT BY 1 START WITH 1 NOCACHE ORDER NOCYCLE ;

--------------------------------------------------------
--  DDL for Sequence ITEMNUM_SEQ
--------------------------------------------------------
CREATE SEQUENCE  ITEMNUM_SEQ  MINVALUE 1 MAXVALUE 99999 INCREMENT BY 1 START WITH 1 NOCACHE ORDER NOCYCLE ;

