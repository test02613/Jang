package com.aplus.event;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

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

import com.aplus.admin.AttachFileVO;

@Controller
public class EventController {
	private static final Logger logger = LoggerFactory.getLogger(EventController.class);

	@Autowired
	private EventService eventService;

	// 이벤트 페이지 진입 (글 목록 + 페이징)
	@RequestMapping(value = "/event", method = RequestMethod.GET)
	public String eventListGET(PagingVO vo, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) throws Exception {
		
		int total = eventService.countEvent();
		
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", vo);
		model.addAttribute("viewAll", eventService.selectEvent(vo));
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>paging:" + vo);
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>eventService.selectEvent(vo):" + eventService.selectEvent(vo));
		
		return "event/event";
	}

	// 이벤트 글 작성 페이지 진입
	@RequestMapping(value = "/eventCreate", method = RequestMethod.GET)
	public String eventCreate() {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 이벤트 글 작성 페이지 진입");
		return "event/eventCreate";
	}

	// 상세페이지 진입
	@RequestMapping(value = "/eventDetail", method = { RequestMethod.GET, RequestMethod.POST })
	public String eventDetailGET(Integer num, Model model) throws Exception {

		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 디테일 진입");

		EventVO vo = eventService.eventDetail(num);
		model.addAttribute("detail", vo);
		logger.info("vo" + vo);
		return "event/eventDetail";
	}

	// 이벤트 글 작성 실행
	@RequestMapping(value = "/eventCreateAction", method = RequestMethod.POST)
	public String eventCreateAction(EventVO event) throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>이벤트 글 작성 페이지 진입" + event);

		eventService.EventCreate(event);
		return "redirect:/event";
	}

	// 글 수정 페이지 진입
	@RequestMapping(value = "/eventUpdate", method = RequestMethod.GET)
	public String eventUpdate(Integer num, Model model) throws Exception {

		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 이벤트 글 수정 페이지  진입");

		EventVO vo = eventService.eventDetail(num);
		model.addAttribute("detail", vo);

		return "event/eventCreate";
	}

	// 글 수정 실행
	@RequestMapping(value = "/eventUpdateAction", method = RequestMethod.POST)
	public String eventUpdateAction(EventVO vo, Integer num) throws Exception {

		eventService.eventDetail(num);
		vo.setEventnum(num);

		eventService.eventUpdate(vo);

		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 이벤트 글 수정 실행");

		return "redirect:/eventDetail?num=" + num;
	}

	// 글 삭제 실행
	@RequestMapping(value = "/eventDeleteAction", method = RequestMethod.GET)
	public String eventDeleteAction(Integer num) throws Exception {

		eventService.eventDelete(num);
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 이벤트 글 삭제 실행");

		return "redirect:/event";
	}

	// 첨부 파일 업로드
	// <form> 태그를 이용하던 방식과 동일한 방식으로 처리됨
	// Ajax 방식으로 결과 데이터를 전달하므로 Model을 사용하지 않음.
	@ResponseBody
	@RequestMapping(value = "/uploadAjaxAction2", method = { RequestMethod.GET, RequestMethod.POST })
	public ResponseEntity<List<AttachFileVO>> uploadAjaxAction(MultipartFile[] uploadFile) {

		String uploadFolder = "D:\\jsj60\\works\\egov39_1\\aaplus\\src\\main\\webapp\\resources\\eventImg";

		// 연/월/일 폴더 생성 시작-------
		File uploadPath = new File(uploadFolder, getFolder());
		logger.info("uploadPath : " + uploadPath);

		if (uploadPath.exists() == false) { // 해당 경로가 없으면 생성해줘야함
			uploadPath.mkdirs();
		}
		// 연/월/일 폴더 생성 끝-------

		// 첨부된 파일의 이름을 담을 List
		List<AttachFileVO> list = new ArrayList<AttachFileVO>();

		for (MultipartFile multipartFile : uploadFile) {

			logger.info("-----------");
			logger.info("파일명 : " + multipartFile.getOriginalFilename());
			logger.info("파일크기 : " + multipartFile.getSize());

			AttachFileVO attachFileVO = new AttachFileVO();
			// 1) fileName
			attachFileVO.setFileName(multipartFile.getOriginalFilename());

			// -----------UUID 파일명 처리 시작 ----------------------------
			// 동일한 이름으로 업로드되면 기존 파일을 지우게 되므로 이를 방지하기 위함
			UUID uuid = UUID.randomUUID();

			String uploadFileName = uuid.toString() + "-" + multipartFile.getOriginalFilename();
			// c:\\upload\\gongu03.jpg으로 조립
			// 이렇게 업로드 하겠다라고 설계 uploadFolder -> uploadPath
			File saveFile = new File(uploadPath, uploadFileName);
			// -----------UUID 파일명 처리 끝 ----------------------------

			try {

				// transferTo() : 물리적으로 파일 업로드가 됨
				multipartFile.transferTo(saveFile);

				// 2) uploadPath
				attachFileVO.setUploadPath(uploadPath.getPath());
				// 3) uuid
				attachFileVO.setUuid(uuid.toString());

				// 파일 실제 명을 list에 담음
				list.add(attachFileVO);
			} catch (Exception e) {
				logger.info(e.getMessage());
			} // end catch
		} // end for

		// return list;
		return new ResponseEntity<List<AttachFileVO>>(list, HttpStatus.OK);
	} // end uploadAjaxAction

	// 첨부파일을 보관하는 폴더를 연/월/일 계층 형태로 생성하기 위함
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		return str.replace("-", File.separator);
	}
	


}
