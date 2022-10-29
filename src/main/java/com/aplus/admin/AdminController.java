package com.aplus.admin;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.aplus.item.ItemAttrVO;
import com.aplus.item.ItemService;
import com.aplus.item.ItemVO;
import com.aplus.model.MemberVO;
import com.aplus.order.OrderVO;
import com.aplus.review.ReviewVO;

import net.coobird.thumbnailator.Thumbnailator;

@Controller
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Autowired
	private AdminService adminservice;
	
	@Autowired
	private ItemService itemservice;

	/* 관리자 페이지 진입 */
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

	/* 회원관리 페이지(회원리스트) */
	@RequestMapping(value = "/memberAdmin", method = RequestMethod.GET)
	public String memberAdminGET(MemberVO vo, Model model, HttpServletResponse response, HttpSession session)
			throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 회원관리 페이지 진입");

		model.addAttribute("list", adminservice.memberList());

		return "admin/memberAdmin";
	}

	/* 회원블랙 처리시 leave 1로 변경 */
	@RequestMapping(value = "/memberBlack", method = { RequestMethod.GET, RequestMethod.POST })
	public String memberBlack(MemberVO vo, Model model, String id, HttpSession session) throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  진입");

		vo.setId(id);
		adminservice.memberBlack(vo);

		return "redirect:/memberAdmin";
	}

	/* 블랙->일반으로 변경 */
	@RequestMapping(value = "/blackReturn", method = { RequestMethod.GET, RequestMethod.POST })
	public String blackReturn(MemberVO vo, Model model, String id, HttpSession session) throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  진입");

		vo.setId(id);
		adminservice.blackReturn(vo);

		return "redirect:/memberAdmin";
	}

	/* 주문관리 페이지 */
	@RequestMapping(value = "/orderAdmin", method = { RequestMethod.GET, RequestMethod.POST })
	public String orderAdminGET(Model model) throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 주문관리 페이지 진입");

		List<OrderVO> list = adminservice.orderAdmin();
		model.addAttribute("orderlist", list);

		return "admin/orderAdmin";
	}

	/* 주문,배송상태 변경 */
	@RequestMapping(value = "/state_selcted", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public void state_selctedGET(OrderVO vo, Model model, @RequestParam("state") String state,
			@RequestParam("num") Integer num) throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  stateChange 변경");

		vo.setOrdernum(num);
		vo.setState(state);
		adminservice.stateChange(vo);
	}

	/* 리뷰관리 페이지 */
	@RequestMapping(value = "/reviewAdmin", method = RequestMethod.GET)
	public String reviewAdminGET(Model model) throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 리뷰관리 페이지 진입");

		List<ReviewVO> list = adminservice.reviewAdmin();
		model.addAttribute("reviewlist", list);

		return "admin/reviewAdmin";
	}

	/* 리뷰 삭제 */
	@RequestMapping(value = "/reviewAdminDeleteAction", method = RequestMethod.GET)
	public String reviewAdminDeleteAction(MemberVO vo, Model model, Integer reviewnum) throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 리뷰관리 페이지 진입");

		adminservice.reviewDeleteAdmin(reviewnum);

		return "redirect:/reviewAdmin";
	}

	/* 1대1문의 페이지 */
	@RequestMapping(value = "/qnaAdmin", method = RequestMethod.GET)
	public String qnaAdminGET(MemberVO vo, HttpServletResponse response, HttpSession session) throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 관리자 페이지 진입");

		return "admin/qnaAdmin";
	}

	/* 상품관리 페이지 */
	@RequestMapping(value = "/itemAdmin", method = RequestMethod.GET)
	public String itemAdmin(MemberVO vo, HttpServletResponse response, HttpSession session) throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 관리자 페이지 진입");

		return "admin/itemAdmin";
	}

	/* 상품등록 페이지 */
	@RequestMapping(value = "/itemInsert",method = { RequestMethod.GET, RequestMethod.POST })
	public String itemInsert(Model model, HttpSession session, ItemVO vo, Integer num) throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 상품 등록 페이지 진입");
		vo.setItemnum(num);
		vo = adminservice.itemInfo(vo);
		model.addAttribute("item", vo);
		return "admin/itemInsert";
	}

	/* 상품(대분류)등록 실행 */
	@RequestMapping(value = "/itemInsertAction", method = RequestMethod.POST)
	public String itemCreateAction(ItemVO vo) throws Exception {

		adminservice.itemInsert(vo);
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 상품 등록실행");
		return "redirect:/adminMain";
	}

	/* 상품(대분류)수정 실행 */
	@RequestMapping(value = "/itemUpdateAction", method = RequestMethod.POST)
	public String itemupdateActionGET(Model model, HttpSession session, ItemVO vo, Integer num) throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 아이템작성 진행");

		vo.setItemnum(num);
		adminservice.itemUpdate(vo);

		return "redirect:/itemSelect?num=1";
	}

	/* 상품 선택 */
	@RequestMapping(value = "/itemSelect", method = RequestMethod.GET)
	public String itemselectGET(Model model, HttpSession session, ItemVO vo, Integer num) throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 아이템선택 페이지 진입");

		model.addAttribute("num", num);
		List<ItemVO> list = adminservice.itemSelect(vo);
		model.addAttribute("list", list);
		logger.info("vo" + vo);

		return "admin/itemSelect";
	}

	/* 상품상세(중분류)리스트 */
	@RequestMapping(value = "/attrList", method = RequestMethod.GET)
	public String attrlistGET(Model model, HttpSession session, ItemAttrVO attr, Integer num) throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 아이템작성 페이지 진입");

		List<ItemAttrVO> list = itemservice.itemAttr(num);
		model.addAttribute("list", list);

		return "admin/attrList";
	}

	/* 상품상세(중분류)등록 페이지 */
	@RequestMapping(value = "/attrInsert", method = RequestMethod.GET)
	public String itemattrInsert(Model model, HttpSession session, ItemVO vo, Integer num, Integer code,
			ItemAttrVO attr) throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 상품상세 등록 페이지 진입");

		attr.setItemcode(code);

		if (code == null) {
			// 등록
			vo.setItemnum(num);
			vo = adminservice.itemInfo(vo);
			model.addAttribute("item", vo);
			model.addAttribute("num", 1);
		} else {
			// 수정
			attr = adminservice.attrInfo(attr);
			model.addAttribute("item", attr);
			model.addAttribute("num", 2);
		}
		return "admin/attrInsert";
	}

	/* 상품 상세 등록 실행 */
	@RequestMapping(value = "/attrInsertAction", method = RequestMethod.POST)
	public String itemattrInsertAction(ItemAttrVO attr) throws Exception {

		adminservice.itemattrInsert(attr);
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 상품상세 등록 실행");

		return "admin/adminMain";
	}

	/* 상품 상세 수정 실행 */
	@RequestMapping(value = "/attrUpdateAction", method = { RequestMethod.POST, RequestMethod.GET })
	public String attrUpdateGET(Model model, HttpSession session, ItemAttrVO attr, Integer num) throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 속성 진행 페이지 진입");

		adminservice.attrUpdate(attr);

		return "redirect:/adminMain";
	}

	/* 상품 한번에 삭제 */
	@RequestMapping(value = "/itemDeleteAction", method = RequestMethod.GET)
	public String itemDeleteActionGET(ItemVO vo, Integer itemnum) throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 아이템 일괄 삭제");

		adminservice.itemDelete(itemnum);
		adminservice.attrDelete(itemnum);

		return "redirect:/itemSelect?num=1";
	}

	/* 상품옵션 개별 삭제 */
	@RequestMapping(value = "/attrselectDeleteAction", method = RequestMethod.GET)
	public String attrDeleteActionGET(Model model, HttpSession session, ItemAttrVO attr, Integer itemcode, Integer num)
			throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 아이템옵션 삭제");

		adminservice.attrselectDelete(itemcode);

		return "redirect:/attrList?num=" + num;
	}
	
	/* 첨부 파일 업로드 */
	/*<form> 태그를 이용하던 방식과 동일한 방식으로 처리됨*/
		/*Ajax 방식으로 결과 데이터를 전달하므로 Model을 사용하지 않음.*/
		@ResponseBody
		@RequestMapping(value="/uploadAjaxAction", method = { RequestMethod.GET, RequestMethod.POST })
		public ResponseEntity<List<AttachFileVO>> uploadAjaxAction(MultipartFile[] uploadFile) {
			
			String uploadFolder = "D:\\jsj60\\works\\egov39_1\\aaplus\\src\\main\\webapp\\resources\\itemImg";
			
			/*연/월/일 폴더 생성 시작-------*/
			File uploadPath = new File(uploadFolder, getFolder());
			logger.info("uploadPath : " + uploadPath);
			
			if(uploadPath.exists()==false) {//해당 경로가 없으면 생성해줘야함
				uploadPath.mkdirs();			
			}
			/*연/월/일 폴더 생성 끝-------*/
			
			/*첨부된 파일의 이름을 담을 List*/
			List<AttachFileVO> list = new ArrayList<AttachFileVO>();
						
			for(MultipartFile multipartFile : uploadFile) {
				
				logger.info("-----------");
				logger.info("파일명 : " + multipartFile.getOriginalFilename());
				logger.info("파일크기 : " + multipartFile.getSize());
				
				AttachFileVO attachFileVO = new AttachFileVO();
				/*1) fileName*/
				attachFileVO.setFileName(multipartFile.getOriginalFilename());
				
				/*-----------UUID 파일명 처리 시작 ----------------------------*/
				/*동일한 이름으로 업로드되면 기존 파일을 지우게 되므로 이를 방지하기 위함*/
				UUID uuid = UUID.randomUUID();
				
				String uploadFileName = uuid.toString() + "-" + multipartFile.getOriginalFilename();
				/* c:\\upload\\gongu03.jpg으로 조립*/
				/* 이렇게 업로드 하겠다라고 설계 uploadFolder -> uploadPath*/
				File saveFile = new File(uploadPath,uploadFileName);
				/*-----------UUID 파일명 처리 끝 ----------------------------*/
				
				try {
					
					/*transferTo() : 물리적으로 파일 업로드가 됨*/
					multipartFile.transferTo(saveFile);
				
					/*2) uploadPath*/
					attachFileVO.setUploadPath(uploadPath.getPath());
					/*3) uuid*/
					attachFileVO.setUuid(uuid.toString());
					/*-------썸네일 처리 시작---------*/
					/*이미지 파일인지 체킹*/
					if(checkImageType(saveFile)) {
						logger.info("이미지 파일? true");
						/*4) image여부*/
						attachFileVO.setImage(true);
						/*uploadPath : 연/월/일이 포함된 경로*/
						/*uploadFileName : UUID가 포함된 파일명*/
						FileOutputStream thumbnail = 
								new FileOutputStream(
										new File(uploadPath,"s_"+uploadFileName));
						Thumbnailator.createThumbnail(multipartFile.getInputStream(),
								thumbnail, 500, 500);
						thumbnail.close();
					}else {
						logger.info("이미지 파일? false");
					}
					/*-------썸네일 처리 끝---------*/
					
					/*파일 실제 명을 list에 담음*/
					list.add(attachFileVO);
				}catch(Exception e){
					logger.info(e.getMessage());
				}/*end catch*/
			}/*end for*/
			
			/*return list;*/
			return new ResponseEntity<List<AttachFileVO>>(list, HttpStatus.OK);
		}/*end uploadAjaxAction*/
		
		/*첨부파일을 보관하는 폴더를 연/월/일 계층 형태로 생성하기 위함*/
		private String getFolder() {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();
			String str = sdf.format(date);
			return str.replace("-", File.separator);
		}
		
		/*특정한 파일이 이미지 타입인지 검사해주는 메소드*/
		private boolean checkImageType(File file) {
			try {
				/*file.toPath() : 파일의 전체 경로*/
				logger.info("file.toPath() : " + file.toPath());
				String contentType = Files.probeContentType(file.toPath());
				logger.info("contentType : " + contentType);
				/*contentType이 image로 시작하면 이미지 타입이므로 true를 리턴함*/
				return contentType.startsWith("image");
			}catch(IOException e) {
				e.printStackTrace();
			}
			return false;
		}
}
