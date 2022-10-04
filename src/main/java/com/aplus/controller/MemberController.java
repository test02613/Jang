package com.aplus.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.aplus.service.MemberService;
import com.aplus.dao.MemberDAO;
import com.aplus.model.MemberVO;

@Controller
/* @RequestMapping(value = "/member") */
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	private MemberService memberService; // 코드 추가

	@Autowired
	private JavaMailSender mailSender;

	// 회원가입 페이지 이동
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String joinGET() {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 회원가입 페이지 진입");
		return "member/join";
	}

	// 회원가입
	@RequestMapping(value = "/joinAction", method = RequestMethod.POST)
	public String joinPost(MemberVO member) throws Exception {

		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> join 진입");

		// 회원가입 서비스 실행
		memberService.memberJoin(member);

		logger.info("join Service 성공");

		return "redirect:/main";
	}

	

	// 아이디 중복 검사z
	@RequestMapping(value = "/memberIdChk", method = RequestMethod.POST)
	@ResponseBody
	public String memberIdChkPOST(String id) throws Exception {

		// logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> memberIdChk 진입");
		logger.info("vo 진입"+id);
		int result = memberService.idCheck(id);

		logger.info("결과값 : " + result);

		if (result != 0) {

			return "fail"; // 중복아이디가 존재하면 fail

		} else {

			return "success"; // 중복아이디가 존재하지 않는다면 success
		}
	}

	// 이메일 인증
	@RequestMapping(value = "mailCheck", method = RequestMethod.GET)
	@ResponseBody
	/* 변경전 */
   /* public void mailCheckGET(String email) throws Exception{*/
 
    /* 변경후 */
    public String mailCheckGET(String email) throws Exception{

		// 뷰에서 넘어온 데이터 확인
		logger.info("========================== 이메일 데이터 전송 확인 ============================");
		logger.info("인증번호 : [ " + email + " ]");

		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		logger.info("인증번호(checkNum) [ " + checkNum + " ]");

		// 이메일 보내기
		String setFrom = "dhkdwk997@gmail.com";
		String toMail = email;
		String title = "회원가입 인증 이메일 입니다.";
		String content = "방문해주셔서 감사합니다." + "<br><br>" + "인증번호는 " + checkNum + "입니다." + "<br>"
				+ "해당 인증번호를 확인하여 정확히 입력해주세요.";

		try {

			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);

		} catch (Exception e) {

			e.printStackTrace();
		}
		String num = Integer.toString(checkNum);
		return num;
	}
		
}
