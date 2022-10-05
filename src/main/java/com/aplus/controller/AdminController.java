package com.aplus.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.aplus.model.MemberVO;
@Controller
public class AdminController {
   private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

   		//관리자 페이지 진입
	   @RequestMapping(value = "/admin_main", method = RequestMethod.GET)
	   public String admin_mainGET(MemberVO vo,HttpServletResponse response, HttpSession session) throws Exception {
	      logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 관리자 페이지 진입");
	      response.setCharacterEncoding("UTF-8");
	
	      response.setContentType("text/html; charset=UTF-8");
	      PrintWriter out = response.getWriter();
	      int admin =  (int) session.getAttribute("admin");
	      
	      
	      if(admin == 0) {
	         out.print("<script>alert('\" 보노보노 \"'); history.go(-1);</script>" );
	         logger.info("vo1"+admin);
	         out.close();
	         return "main/main";
	      }else if(admin == 1) {
	         logger.info("vo2"+vo);
	         return "admin/admin_main";
	      }else {
	         
	         return"member/login";
	      }
	   }
}