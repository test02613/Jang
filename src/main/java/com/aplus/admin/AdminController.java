package com.aplus.admin;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
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

import com.aplus.item.ItemAttrVO;
import com.aplus.item.ItemService;
import com.aplus.item.ItemVO;
import com.aplus.model.MemberVO;
import com.aplus.order.OrderVO;
import com.aplus.review.ReviewVO;

@Controller
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Autowired
	private AdminService adminservice;
	@Autowired
	private ItemService itemservice;
	
	//관리자 페이지 진입
	@RequestMapping(value = "/adminMain", method = RequestMethod.GET)
	public String admin_mainGET(MemberVO vo, HttpServletResponse response, HttpSession session) throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 관리자 페이지 진입");
		response.setCharacterEncoding("UTF-8");

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		int admin = (int) session.getAttribute("admin");

		if (admin == 0) {
			out.print("<script>alert('\" 보노보노 \"'); history.go(-1);</script>");
			logger.info("vo1" + admin);
			out.close();
			return "main/main";
		} else if (admin == 1) {
			logger.info("vo2" + vo);
			return "admin/adminMain";
		} else {

			return "member/login";
		}
	}
	
	//회원관리 페이지(회원리스트)
	@RequestMapping(value = "/memberAdmin", method = RequestMethod.GET)
	public String memberAdminGET(MemberVO vo, Model model, HttpServletResponse response, HttpSession session) throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 회원관리 페이지 진입");
		
		model.addAttribute("list", adminservice.memberList());
	      
		return "admin/memberAdmin";
	}
	
   //회원블랙 처리시 leave 1로 변경
   @RequestMapping(value = "/memberBlack", method = { RequestMethod.GET, RequestMethod.POST })
	public String memberBlack(MemberVO vo, Model model, String id, HttpSession session) throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  진입");
		
		vo.setId(id);
		adminservice.memberBlack(vo);
		
		return "redirect:/memberAdmin";
	}
	   
	//블랙->일반으로 변경
	@RequestMapping(value = "/blackReturn", method = { RequestMethod.GET, RequestMethod.POST })
	public String blackReturn(MemberVO vo, Model model, String id, HttpSession session) throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  진입");

		vo.setId(id);
		adminservice.blackReturn(vo);

		return "redirect:/memberAdmin";
	}

	//주문관리 페이지
	@RequestMapping(value = "/orderAdmin",  method = { RequestMethod.GET, RequestMethod.POST })
	public String orderAdminGET(Model model) throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 주문관리 페이지 진입");
		
		List<OrderVO> list = adminservice.orderAdmin();
		model.addAttribute("orderlist", list);
		
		return "admin/orderAdmin";
	}
	
	//주문-배송상태 변경
	@RequestMapping(value = "/state_selcted", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public void state_selctedGET(OrderVO vo, Model model, @RequestParam("state") String state,@RequestParam("num") Integer num) throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  stateChange 변경");
		
		vo.setOrdernum(num);
		vo.setState(state);
		adminservice.stateChange(vo);
	}
	
	//리뷰관리 페이지
	@RequestMapping(value = "/reviewAdmin", method = RequestMethod.GET)
	public String reviewAdminGET(Model model) throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 리뷰관리 페이지 진입");
		
		List<ReviewVO> list = adminservice.reviewAdmin();
		model.addAttribute("reviewlist", list);
		
		return "admin/reviewAdmin";
	}
	
	//리뷰 삭제
	@RequestMapping(value = "/reviewAdminDeleteAction", method = RequestMethod.GET)
	public String reviewAdminDeleteAction(MemberVO vo, Model model, Integer reviewnum ) throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 리뷰관리 페이지 진입");
		
		adminservice.reviewDeleteAdmin(reviewnum);
		
		return "redirect:/reviewAdmin";
	}
	
	//1대1문의 페이지
	@RequestMapping(value = "/qnaAdmin", method = RequestMethod.GET)
	public String qnaAdminGET(MemberVO vo, HttpServletResponse response, HttpSession session) throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 관리자 페이지 진입");
		
		return "admin/qnaAdmin";
	}
	
	//상품관리 페이지
	@RequestMapping(value = "/itemAdmin", method = RequestMethod.GET)
	public String itemAdmin(MemberVO vo, HttpServletResponse response, HttpSession session) throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 관리자 페이지 진입");
		
		return "admin/itemAdmin";
	}
	
	//상품등록 페이지 
	@RequestMapping(value = "/itemInsert", method = RequestMethod.GET)
	public String itemInsert(Model model,HttpSession session,ItemVO vo ,Integer num) throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 상품 등록 페이지 진입");
		vo.setItemnum(num);
		vo=adminservice.itemInfo(vo);
		model.addAttribute("item", vo);
		return "admin/itemInsert";
	}
	
	//상품(대분류)등록 실행
	@RequestMapping(value = "/itemInsertAction", method = RequestMethod.POST)
	public String itemCreateAction(ItemVO vo) throws Exception {
		
		adminservice.itemInsert(vo);
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 상품 등록실행");
		return "redirect:/adminMain";
	}
	
	//상품(대분류)수정 실행
	@RequestMapping(value = "/itemUpdateAction", method = RequestMethod.POST)
	public String itemupdateActionGET(Model model,HttpSession session,ItemVO vo ,Integer num) throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 아이템작성 진행");
		
		vo.setItemnum(num);
		adminservice.itemUpdate(vo);
		
		return "redirect:/adminMain";
	}
	
	//상품 선택
	@RequestMapping(value = "/itemSelect", method = RequestMethod.GET)
	public String itemselectGET(Model model,HttpSession session,ItemVO vo,Integer num) throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 아이템선택 페이지 진입");
		
		model.addAttribute("num", num);
		List<ItemVO> list = adminservice.itemSelect(vo);
		model.addAttribute("list", list);
		logger.info("vo"+vo);
		
		return "admin/itemSelect";
	}
	
	//상품상세(중분류)리스트
	@RequestMapping(value = "/attrList", method = RequestMethod.GET)
	public String attrlistGET(Model model,HttpSession session,ItemAttrVO attr,Integer num) throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 아이템작성 페이지 진입");
		
		List<ItemAttrVO> list = itemservice.itemAttr(num);
		model.addAttribute("list", list);
		
		return "admin/attrList";
	}
	
	//상품상세(중분류)등록 페이지 
	@RequestMapping(value = "/attrInsert", method = RequestMethod.GET)
	public String itemattrInsert(Model model,HttpSession session,ItemVO vo,Integer num,Integer code,ItemAttrVO attr) throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 상품상세 등록 페이지 진입");
		
		attr.setItemcode(code);
		
		if(code == null) { 
			//등록
			vo.setItemnum(num);
			vo = adminservice.itemInfo(vo);
			model.addAttribute("item", vo);
			model.addAttribute("num", 1);
		}else {	
			//수정
			attr = adminservice.attrInfo(attr);
			model.addAttribute("item", attr);
			model.addAttribute("num", 2);
		}
		return "admin/attrInsert";
	}
		
	//상품 상세 등록 실행
	@RequestMapping(value = "/attrInsertAction", method = RequestMethod.POST)
	public String itemattrInsertAction(ItemAttrVO attr) throws Exception {
		
		adminservice.itemattrInsert(attr);
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 상품상세 등록 실행");
		
		return "admin/adminMain";
	}
	
	//상품 상세 수정 실행
	@RequestMapping(value = "/attrUpdateAction", method = {RequestMethod.POST,RequestMethod.GET})
	public String attrUpdateGET(Model model,HttpSession session,ItemAttrVO attr,Integer num) throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 속성 진행 페이지 진입");
		
		adminservice.attrUpdate(attr);
		
		return "redirect:/adminMain";
	}
	
	//상품 한번에 삭제 
	@RequestMapping(value = "/itemDeleteAction", method = RequestMethod.GET)
	public String itemDeleteActionGET(ItemVO vo,Integer itemnum) throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 아이템 삭제");

		adminservice.itemDelete(itemnum);
		adminservice.attrDelete(itemnum);
		
		return "redirect:/itemSelect?num=1";
	}
	
	//상품옵션 개별 삭제
	@RequestMapping(value = "/attrselectDeleteAction", method = RequestMethod.GET)
	public String attrDeleteActionGET(Model model,HttpSession session,ItemAttrVO attr,Integer itemcode,Integer num) throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 아이템옵션 삭제");
		
		adminservice.attrselectDelete(itemcode);
		
		return "redirect:/attrList?num="+num;
	}
}
