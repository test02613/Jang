<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <div class="wrapper">
      <div id="header_wrap">

         <!-- 네비영역 -->
         <div id="nav">
         <ul>
            <li id="dropdown">
               <div OnClick="location.href ='/itemList'" id="dropdown-menu">Mac</div>
               <div id="dropdown-content">
                  <a href="/itemList">iMac</a>
                  <a href="/itemList">MacBook Pro</a>
                  <a href="/itemList">MacBook Air</a>
               </div>
            </li>
            <li id="dropdown">
               <div OnClick="location.href ='/itemList'" id="dropdown-menu">iPad</div>
               <div id="dropdown-content">
                  <a href="#">iPad Pro</a>
                  <a href="#">iPad Air</a>
                  <a href="#">iPad</a>
                  <a href="#">iPad mini</a>
               </div>
            </li>
            <li id="dropdown">
               <div OnClick="location.href ='/itemList'" id="dropdown-menu">iPhone</div>
               <div id="dropdown-content">
               <a href="#">iPhone14</a>
               <a href="#">iPhone13</a>
               <a href="#">iPhoneSE</a>
               <a href="#">iPhone12</a>
               </div>
            </li>
            <li id="dropdown">
               <div OnClick="location.href ='/itemList'" id="dropdown-menu">Watch</div>
               <div id="dropdown-content">
               <a href="#">Apple Watch Ultra</a>
               <a href="#">Apple Watch 8</a>
               <a href="#">Apple Watch SE</a>
               <a href="#">Apple Watch Hermes</a>
               </div>
            </li>
            <li id="dropdown">
               <div OnClick="location.href ='/itemList'" id="dropdown-menu">AirPods</div>
               <div id="dropdown-content">
               <a href="#">AirPods2</a>
               <a href="#">AirPods3</a>
               <a href="#">AirPods Pro2</a>
               <a href="#">AirPods Max</a>
               </div>
            </li>
            <li id="dropdown">
               <div OnClick="location.href ='/itemList'" id="dropdown-menu">Accsessory</div>
               <div id="dropdown-content">
               <a href="#">case</a>
               <a href="#">cable</a>
               <a href="#">MacSafe</a>
               <a href="#">AirTag</a>
               </div>
            </li>
            <li>
            <div id="event"><a href="/event">이벤트</a></div>
            </li>
         </ul>
         </div>
      </div>
   </div>
</body>
</html>