package com.aplus.my;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.aplus.controller.MemberController;
import com.aplus.model.MemberVO;
import com.aplus.service.MemberService;

@Controller
public class MyController {
   private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
   @Autowired
   private MyService myservice;
   
   //마이페이지 메인
   @RequestMapping(value = "/mymain", method = RequestMethod.GET)
   public String mymainGET() {
      logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 마이 페이지 진입");
      
      return "my/myMain";
   }

   //회원정보 수정 페이지
   @RequestMapping(value = "/myupdate", method = {RequestMethod.GET,RequestMethod.POST})
   public String myupdateGET(Model model, HttpSession session, MemberVO vo) throws Exception {
      logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 정보수정 페이지 진입");
      	
      String memInfo = (String) session.getAttribute("id");//세션 id가져오기
      vo = myservice.member(memInfo);//고객 정보 가져오기
      model.addAttribute("member", vo);
		
      
      return "my/myUpdate";
   }
   
   //회원정보 수정 실행
   @RequestMapping(value = "/myUpdateAction", method = RequestMethod.POST )
   public String myUpdateAction(String memInfo, MemberVO vo) throws Exception {
 
	   myservice.myUpdate(vo);
	   logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 정보수정 실행" + vo);
	   
	   return "my/myMain";
   }

   //주문조회 페이지
   @RequestMapping(value = "/myorder", method = {RequestMethod.GET,RequestMethod.POST})
   public String myorderGET() {
      logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 주문조회 페이지 진입");
      return "my/myorder";
   }
   
   //포인트 조회 페이지
   @RequestMapping(value = "/mypoint", method = {RequestMethod.GET,RequestMethod.POST})
   public String mypointGET() {
      logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 포인트 조회 페이지 진입");
      return "my/mypoint";
   }
   
   //리뷰조회 페이지
   @RequestMapping(value = "/myreview", method = {RequestMethod.GET,RequestMethod.POST})
   public String myreviewGET() {
      logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 리뷰관리 페이지 진입");
      return "my/myReview";
   }
   
   //1:1문의 페이지
   @RequestMapping(value = "/myqna", method = {RequestMethod.GET,RequestMethod.POST})
   public String myqnaGET() {
      logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 큐엔에이 페이지 진입");
      return "my/myqna";
   }
}