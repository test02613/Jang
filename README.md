![header](https://capsule-render.vercel.app/api?type=waving&color=24292F&height=300&section=header&text=Aplus&fontSize=90)

# 🍎Aplus

- 주제
    - 전자제품 판매 웹 쇼핑몰 사이트(apple 리셀샵)
- 목표
    - Spring MVC 패턴을 활용한 웹 사이트 구현
    - 사용자 관점에서 상품구매, 조회, 장바구니, 결제, 리뷰작성 등의 기능을 구현합니다.
    - 관리자 관점에서 회원관리, 상품관리, 주문관리, 게시판관리 등의 기능을 구현합니다.

## 📌일정/참여인원

| Week | 주말모임 | 개발 내용 |
| --- | --- | --- |
| 1주차 (09.13 ~ 09.20) | ☑️ | 프로젝트 구상 및 기획, 개발환경 세팅, DB설계 |
| 2주차 (09.21 ~ 09.27) | ☑️ | tiles적용, 헤더, 푸터, 메인페이지, 회원가입, 로그인 구현 |
| 3주차 (09.28 ~ 10.04) | ☑️ | 아이디 찾기, 비밀번호 재설정 구현 |
| 4주차 (10.05 ~ 10.11) | ☑️ | 이벤트 페이지, 상품페이지, 결제 기능  구현 |
| 5주차 (10.12 ~ 10.18) | ☑️ | 리뷰, 마이페이지, 관리자페이지 구현 |
| 6주차 (10.19 ~ 10.25) | ☑️ | 이미지 파일업로드, 마이페이지, 관리자페이지 구현 |
| 7주차 (10.26 ~ 11.02) | ☑️ | CSS 수정, 오류 확인 및 마무리 점검, 제안서 작성 |
- 개발 기간 : 2022.09.13 ~ 2022.11.02 (약 7주)
- 참여 인원 : Back-End 4명(구혁준, 장수진, 최현지, 한상수)

## 📌사용 기술

- DataBase
    - Oracle SQL:11g
    - ojbc6:11.2.0.4
    - spring-jdbc:5.3.22
    - hikariCP:3.4.2
    - mybatis:3.5.10
- Front-end
    - tiles:3.0.8
    - Bootstrap:
    - JavaScript(jquery, ajax)
    - servlet:4.0
    - jsp:2.3
    - jstl:1.2
- Back-end
    - Java:1.8
    - Spring Framework : 5.3.22
    - Maven: 2.5.1
    - lombok : 1.18.24
    - javax.mail(mailSender) : 1.6.2
    - commons-lang3 : 3.12.0
    - thumbnailator : 0.4.17
    - commons-fileupload(file-uploader) 1.4
    - jackson-mapper-asl : 1.9.13
    - jackson-databind : 2.13.4.2
    - commons-io : 2.11.0
- Log
    - log4j2 : 2.17.1
    - log4jdbc : 1.16
    - slf4j : 1.7.36

## 📌프로젝트 제안/내용

- 사용자 유즈케이스
    
    ![https://user-images.githubusercontent.com/112682766/202073982-d789066e-8de7-4f1e-b5a0-668ac6764ac0.png](https://user-images.githubusercontent.com/112682766/202073982-d789066e-8de7-4f1e-b5a0-668ac6764ac0.png)
    
- ERD
    
    ![https://user-images.githubusercontent.com/112682766/202074034-5bfecdab-55f6-4d7d-849e-4775859ed014.png](https://user-images.githubusercontent.com/112682766/202074034-5bfecdab-55f6-4d7d-849e-4775859ed014.png)
    

## 📌구현화면/주요기능

![https://user-images.githubusercontent.com/112682766/202067047-124c40d6-4dc6-40fc-a98b-236c08327964.png](https://user-images.githubusercontent.com/112682766/202067047-124c40d6-4dc6-40fc-a98b-236c08327964.png)

- 메인 페이지(main.jsp)
    - 전페 페이지(공통):tiles로 묶어 상단 메뉴(헤더)와 하단(푸터)가 항상 화면에 노출되도록 구현
    - 부트스트랩 적용으로 이벤트 슬라이드(해당 이벤트 페이지로 이동), 주력 상품 페이지 바로가기 구현

![https://user-images.githubusercontent.com/112682766/202067077-e2c59aea-0e8b-4fda-b53b-895483d49e2f.png](https://user-images.githubusercontent.com/112682766/202067077-e2c59aea-0e8b-4fda-b53b-895483d49e2f.png)

- 회원가입(join.jsp)
    - 아이디 중복 검사
    - 비밀번호 일치여부 검사
    - 이메일 인증번호 확인 기능(인증번호 전송 후 인증번호 입력란 활성화)
    - 다음(daum) 주소검색 기능

![https://user-images.githubusercontent.com/112682766/202066632-c732fdbe-c734-46f5-a799-a25533ce0432.png](https://user-images.githubusercontent.com/112682766/202066632-c732fdbe-c734-46f5-a799-a25533ce0432.png)

- 로그인(login.jsp)
    - 회원/관리자 로그인(각 권한 부여)
    - 이름, 이메일로 아이디 찾기
    - 이메일 인증을 통한 비밀번호 재설정

![https://user-images.githubusercontent.com/112682766/202066716-4cf70022-966f-4a4e-baae-61fa4e880d50.png](https://user-images.githubusercontent.com/112682766/202066716-4cf70022-966f-4a4e-baae-61fa4e880d50.png)

- 상품리스트페이지(itemList.jap)
    - 카테고리 번호 부여 대,중분류로 구분

![https://user-images.githubusercontent.com/112682766/202066731-2f938777-ed0f-4b28-836c-0976a7c74640.png](https://user-images.githubusercontent.com/112682766/202066731-2f938777-ed0f-4b28-836c-0976a7c74640.png)

- 상품 상세 페이지(itemDetail.jsp)
    - 옵션 선택 기능
    - 장바구니 넣기/결제하기 기능
    - 상품별 리뷰 조회

![https://user-images.githubusercontent.com/112682766/202067199-c5c1dcf8-f14b-4cf2-80ed-f37a309c3abe.png](https://user-images.githubusercontent.com/112682766/202067199-c5c1dcf8-f14b-4cf2-80ed-f37a309c3abe.png)

- 장바구니(cart.jsp)
    - 장바구니 개별 구매/삭제, 전체 구매/삭제

![https://user-images.githubusercontent.com/112682766/202071372-30dc043c-2c6a-4a15-80bb-aed3f8cac5dd.png](https://user-images.githubusercontent.com/112682766/202071372-30dc043c-2c6a-4a15-80bb-aed3f8cac5dd.png)

- 주문 페이지(order.jsp)
    - 사용한 포인트 차감, 결제 구현
    - 주문완료 페이지 연동(orderFinish.jsp)

![https://user-images.githubusercontent.com/112682766/202070028-8f08ede7-37e0-4084-823e-8ee4c1e2fc1a.png](https://user-images.githubusercontent.com/112682766/202070028-8f08ede7-37e0-4084-823e-8ee4c1e2fc1a.png)

- 마이페이지(mymain.jsp)
    - 하위 페이지로 이동

![https://user-images.githubusercontent.com/112682766/202070448-d9ece49f-ac1a-4e2d-a43f-ae45cdcbf024.png](https://user-images.githubusercontent.com/112682766/202070448-d9ece49f-ac1a-4e2d-a43f-ae45cdcbf024.png)

- 정보수정(myUpdate.jsp)
    - 고객 정보 수정, 탈퇴

![https://user-images.githubusercontent.com/112682766/202073700-0047d21e-a845-46c2-b686-9d02490b4efd.png](https://user-images.githubusercontent.com/112682766/202073700-0047d21e-a845-46c2-b686-9d02490b4efd.png)

- 포인트충전(myPoint.jsp)
    - 입력란 문자, null, 1회 충전금액(5,000,000원) 초과시 alert 띄우기

![https://user-images.githubusercontent.com/112682766/202070666-84eccada-c8ca-44ce-9d2a-66614c8853a2.png](https://user-images.githubusercontent.com/112682766/202070666-84eccada-c8ca-44ce-9d2a-66614c8853a2.png)

- 주문관리(myOrder.jsp)
    - 주문/배송상태 확인
    - 구매상품 리뷰 작성

![https://user-images.githubusercontent.com/112682766/202070822-172b05f7-9be8-4fc4-b0f9-46ca1e4aadea.png](https://user-images.githubusercontent.com/112682766/202070822-172b05f7-9be8-4fc4-b0f9-46ca1e4aadea.png)

- 리뷰관리(myReview.jsp)
    - 리뷰 수정, 삭제

![https://user-images.githubusercontent.com/112682766/202071973-4a45a8f7-c595-4dcd-a04a-1f4659491210.png](https://user-images.githubusercontent.com/112682766/202071973-4a45a8f7-c595-4dcd-a04a-1f4659491210.png)

- 1대1문의(myQna.jsp)
    - 카카오톡 오픈채팅 링크 연결

![https://user-images.githubusercontent.com/112682766/202071776-a3ca2130-20e2-48b8-b029-4e1faf21d658.png](https://user-images.githubusercontent.com/112682766/202071776-a3ca2130-20e2-48b8-b029-4e1faf21d658.png)

- 관리자페이지(adminMain.jsp)
    - 하위 페이지로 이동

![https://user-images.githubusercontent.com/112682766/202072196-54841835-d813-449b-8539-4c0a9c597ebe.png](https://user-images.githubusercontent.com/112682766/202072196-54841835-d813-449b-8539-4c0a9c597ebe.png)

- 회원관리(memberAdmin.jsp)
    - 회원 블랙처리
    - 블랙/탈퇴 되돌리기

![https://user-images.githubusercontent.com/112682766/202072333-d397c234-9014-4d94-8bc8-81acdf747eff.png](https://user-images.githubusercontent.com/112682766/202072333-d397c234-9014-4d94-8bc8-81acdf747eff.png)

- 상품관리(itemAdmin.jsp)
    - 하위 페이지로 이동

![https://user-images.githubusercontent.com/112682766/202072466-f7e50905-1e00-4027-a305-ab229adfa438.png](https://user-images.githubusercontent.com/112682766/202072466-f7e50905-1e00-4027-a305-ab229adfa438.png)

- 상품 대분류 등록

![https://user-images.githubusercontent.com/112682766/202072607-abeb475e-d67a-4fae-b36f-4a286a3ab22f.png](https://user-images.githubusercontent.com/112682766/202072607-abeb475e-d67a-4fae-b36f-4a286a3ab22f.png)

- 상품 대분류 수정/삭제 페이지

![https://user-images.githubusercontent.com/112682766/202075083-59d1baaf-f9cb-4b8f-bf98-1cdbb7a2fe98.png](https://user-images.githubusercontent.com/112682766/202075083-59d1baaf-f9cb-4b8f-bf98-1cdbb7a2fe98.png)

- 상품 대분류 수정

![https://user-images.githubusercontent.com/112682766/202072891-9b288395-89ff-4637-bb6d-fe2a3e7075c5.png](https://user-images.githubusercontent.com/112682766/202072891-9b288395-89ff-4637-bb6d-fe2a3e7075c5.png)

- 주문관리(orderAdmin.jsp)
    - 회원 주문 조회, 주문/배송 상태 변경

![https://user-images.githubusercontent.com/112682766/202073019-3595f91d-a5ef-4e6e-a103-18dcd7c9cfb9.png](https://user-images.githubusercontent.com/112682766/202073019-3595f91d-a5ef-4e6e-a103-18dcd7c9cfb9.png)

- 게시판관리(boardAdmin.jsp)
    - 이벤트, 리뷰관리 페이지로 이동

![https://user-images.githubusercontent.com/112682766/202068916-49624c7f-a7c6-4c37-aca8-e627aeaba0c5.png](https://user-images.githubusercontent.com/112682766/202068916-49624c7f-a7c6-4c37-aca8-e627aeaba0c5.png)

- 이벤트(event.jsp)
    - CRUD 기능 구현, 관리자에만 권한 부여

![https://user-images.githubusercontent.com/112682766/202073361-645b3ca4-77fe-46ac-969c-fb39f920a727.png](https://user-images.githubusercontent.com/112682766/202073361-645b3ca4-77fe-46ac-969c-fb39f920a727.png)

- 리뷰관리(reviewAdmin.jsp)
    - 회원 리뷰 조회, 리뷰 상세보기, 삭제 기능

![https://user-images.githubusercontent.com/112682766/202071973-4a45a8f7-c595-4dcd-a04a-1f4659491210.png](https://user-images.githubusercontent.com/112682766/202071973-4a45a8f7-c595-4dcd-a04a-1f4659491210.png)

- 1대1문의(qnaAdmin.jsp)
    - 카카오톡 오픈채팅 링크 연결

  
![Footer](https://capsule-render.vercel.app/api?type=waving&color=24292F&height=200&section=footer)
