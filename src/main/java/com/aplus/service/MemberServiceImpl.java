package com.aplus.service;

import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aplus.model.MemberVO;
import com.aplus.controller.LoginController;
import com.aplus.dao.MemberDAO;
import com.aplus.model.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	/*@Autowired
	MemberMapper memberMapper;*/
	@Autowired MemberDAO dao;

	//회원가입
	@Override
	public void memberJoin(MemberVO member) throws Exception {

		dao.memberJoin(member);
	}

	//로그인
	@Override
	public String loginAction(MemberVO vo, HttpSession session) throws Exception {
		String name = dao.loginAction(vo);
		 logger.info("Name2:"+name);
		 if (name != null) { // 세션 변수 저장
		  session.setAttribute("id", vo.getId());
		  session.setAttribute("admin", vo.getAdmin());
		  session.setAttribute("name", name);
		}
		 return name; 
		}
	
	//관리자 로그인
	@Override
	public int loginAction_admin(MemberVO vo) throws Exception {
		int admin = dao.loginAction_admin(vo);
		 logger.info("Name2:"+admin);
		
		/* session.setAttribute("admin",vo.getAdmin());
		 session.setAttribute("admin", admin);*/
		 return admin; 
		}
	
	//아이디 중복 검사
	@Override
	public int idCheck(String id) throws Exception {
		return dao.idCheck(id);
	}
	
	//아이디 찾기
	@Override
	public String findId(HttpServletResponse response, MemberVO vo) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String id = dao.findId(vo);
		logger.info("id1:"+id);
		if (id == null) {
			out.println("<script>");
			out.println("alert('가입된 아이디가 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		} else {
			return id;
		}
	}
	
	//비밀번호 찾기	
	@Override
	public String findPw(HttpServletResponse response, MemberVO vo) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String pw = dao.findPw(vo);
		logger.info("id1:"+pw);
		return pw;
	}

	//비밀번호 변경
	@Override
	public String updatePw(HttpServletResponse response, MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		String pw = dao.updatePw(vo);
		return pw;
		}
	}



