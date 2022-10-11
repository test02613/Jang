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
               <div OnClick="location.href ='/itemListL?cat=1'" id="dropdown-menu">Mac</div>
               <div id="dropdown-content">
                  <a href="/itemList?cat=11">iMac</a>
                  <a href="/itemList?cat=12">MacBook Pro</a>
                  <a href="/itemList?cat=13">MacBook Air</a>
               </div>
            </li>
            <li id="dropdown">
               <div OnClick="location.href ='/itemListL?cat=2'" id="dropdown-menu">iPad</div>
               <div id="dropdown-content">
                  <a href=/itemList?cat=21>iPad Pro</a>
                  <a href="/itemList?cat=22">iPad Air</a>
                  <a href="/itemList?cat=23">iPad</a>
                  <a href="/itemList?cat=24">iPad mini</a>
               </div>
            </li>
            <li id="dropdown">
               <div OnClick="location.href ='/itemListL?cat=3'" id="dropdown-menu">iPhone</div>
               <div id="dropdown-content">
               <a href="/itemList?cat=31">iPhone14</a>
               <a href="/itemList?cat=32">iPhone13</a>
               <a href="/itemList?cat=33">iPhoneSE</a>
               <a href="/itemList?cat=34">iPhone12</a>
               </div>
            </li>
            <li id="dropdown">
               <div OnClick="location.href ='/itemListL?cat=4'" id="dropdown-menu">Watch</div>
               <div id="dropdown-content">
               <a href="/itemList?cat=41">Apple Watch Ultra</a>
               <a href="/itemList?cat=42">Apple Watch 8</a>
               <a href="/itemList?cat=43">Apple Watch SE</a>
               <a href="/itemList?cat=44">Apple Watch Hermes</a>
               </div>
            </li>
            <li id="dropdown">
               <div OnClick="location.href ='/itemListL?cat=5'" id="dropdown-menu">AirPods</div>
               <div id="dropdown-content">
               <a href="/itemList?cat=51">AirPods2</a>
               <a href="/itemList?cat=52">AirPods3</a>
               <a href="/itemList?cat=53">AirPods Pro2</a>
               <a href="/itemList?cat=54">AirPods Max</a>
               </div>
            </li>
            <li id="dropdown">
               <div OnClick="location.href ='/itemListL?cat=6'" id="dropdown-menu">Accsessory</div>
               <div id="dropdown-content">
               <a href="/itemList?cat=61">case</a>
               <a href="/itemList?cat=62">cable</a>
               <a href="/itemList?cat=63">MacSafe</a>
               <a href="/itemList?cat=64">AirTag</a>
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