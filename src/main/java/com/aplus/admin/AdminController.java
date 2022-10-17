package com.aplus.admin;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.aplus.item.ItemAttrVO;
import com.aplus.item.ItemVO;
import com.aplus.model.MemberVO;

@Controller
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	private AdminDAO admindao;
	@Autowired
	private AdminService adminService;

	// 관리자 페이지 진입
	@RequestMapping(value = "/admin_main", method = RequestMethod.GET)
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
			return "admin/admin_main";
		} else {

			return "member/login";
		}
	}
	
	//-----------------------------------------미완성------------------------------------------- 
	//상품등록 페이지 
	@RequestMapping(value = "/itemInsert", method = RequestMethod.GET)
	public String itemInsert() {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 상품 등록 페이지 진입");
		return "admin/itemInsert";
	}
	
	//상품 등록 실행
	@RequestMapping(value = "/itemInsertAction", method = RequestMethod.POST)
	public void itemCreateAction(ItemVO item) throws Exception {
		adminService.itemInsert(item);
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 상품 등록실행");
	}
	
	//상품 상세 등록 실행
	@RequestMapping(value = "/itemattrInsertAction", method = RequestMethod.POST)
	public void itemattrInsertAction(ItemAttrVO itemattr) throws Exception {
		adminService.itemattrInsert(itemattr);
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 상품상세 등록 실행");
	}
	
}
