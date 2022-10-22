package com.aplus.my;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aplus.controller.MemberController;
import com.aplus.model.MemberVO;
import com.aplus.order.OrderVO;
import com.aplus.review.ReviewService;
import com.aplus.review.ReviewVO;
import com.aplus.service.MemberService;

@Controller
public class MyController {
   private static final Logger logger = LoggerFactory.getLogger(MyController.class);
   @Autowired
   private MyService myservice;
	@Autowired
	private ReviewService reviewservice;
	
   //마이페이지 메인
   @RequestMapping(value = "/mymain", method = RequestMethod.GET)
   public String mymainGET(Model model, HttpSession session, MemberVO vo) throws Exception {
      logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 마이 페이지 진입");
      
      String memInfo = (String) session.getAttribute("id");//세션 id가져오기
      vo = myservice.member(memInfo);//고객 정보 가져오기
      model.addAttribute("member", vo);
      
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
   public String myorderGET(Model model, OrderVO vo, HttpSession session) throws Exception {
      logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 주문조회 페이지 진입");
      
      String id = (String) session.getAttribute("id");//세션 id가져오기
      vo.setId(id); //OrderVO에 세션 id 저장
      List<OrderVO> orderlist = myservice.myOrder(id);
      model.addAttribute("order", orderlist);//로그인 회원 주문정보 가져오기
      
      return "my/myOrder";
   }
   
   //포인트 조회 페이지
   @RequestMapping(value = "/mypoint", method = RequestMethod.GET)
   public String mypointGET(Model model, HttpSession session, MemberVO vo) throws Exception {
      logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 포인트 조회 페이지 진입");
      
      String memInfo = (String) session.getAttribute("id");//세션 id가져오기
      vo = myservice.member(memInfo);//고객 정보 가져오기
      model.addAttribute("member", vo);
      
      return "my/myPoint";
   }
   
   //포인트 충전
   @RequestMapping(value = "/mypointUpdateAction", method = RequestMethod.POST)
   public String mypointUpdateAction(Model model, HttpSession session, MemberVO vo) throws Exception {
      logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 포인트 조회 페이지 진입");
            
      String memInfo = (String) session.getAttribute("id");//세션 id가져오기
      vo = myservice.member(memInfo);//고객 정보 가져오기
      myservice.pointUpdate(vo);
            
      return "my/myPoint";
   }
   
	//포인트 충전 ajax
	@RequestMapping(value = "/pointUp", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public String getPoint(@RequestParam("getpoint") String getpoint,HttpSession session,MemberVO vo) throws Exception {
		
		
		
		return "point";
	}
   
   //리뷰관리 페이지 -> ReviewController로 이동
   
   //1:1문의 페이지
   @RequestMapping(value = "/myqna", method = {RequestMethod.GET,RequestMethod.POST})
   public String myqnaGET(Model model, OrderVO vo, HttpSession session) throws Exception  {
      logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 큐엔에이 페이지 진입");
      
   /*   String id = (String) session.getAttribute("id");//세션 id가져오기
      vo.setId(id); //QnaVO에 로그인 정보 저장
      model.addAttribute("myqna", vo);*/
      String id = (String) session.getAttribute("id");//세션 id가져오기
      vo.setId(id); //OrderVO에 세션 id 저장
      List<OrderVO> orderlist = myservice.myOrder(id);
      model.addAttribute("order", orderlist);//로그인 회원 주문정보 가져오기
      return "my/myQna";
   }
}