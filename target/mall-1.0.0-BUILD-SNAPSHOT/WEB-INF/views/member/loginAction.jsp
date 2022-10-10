<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
(메인페이지로 포워딩 할거임)
	
	로그인 완료~ <br />
	회원번호 : ${book_member.memberId } <br />
	이름 : ${book_member.memberPw } <br />
	
	<a href="/stu/logout.do">로그아웃</a>
</body>
</html>