package oracle.java.s20200502.room.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import oracle.java.s20200502.room.service.Paging;
import oracle.java.s20200502.room.model.Reservation;
import oracle.java.s20200502.room.model.Room;
import oracle.java.s20200502.room.service.RoomImgService;
import oracle.java.s20200502.room.service.RoomReservationService;
import oracle.java.s20200502.room.service.RoomService;

@Controller
public class dubinController {
	
	private static final Logger logger = LoggerFactory.getLogger(dubinController.class);
	
	@Autowired
	private RoomService rs;
	@Autowired
	private RoomImgService ris;
	@Autowired
	private RoomReservationService res;
	
	
	@RequestMapping("roomMain")
	public String main(Model model) {		
		return "room/main";
	}
	
	@RequestMapping("roomJoin")
	public String join(Model model) {		
		return "room/join";
	}
	
	@RequestMapping("roomLogin")
	public String login(Model model) {		
		return "room/login";
	}
	
	@RequestMapping("roomInsertGo")
	public String roomInsertGo(Model model) {		
		return "room/roomInsert";
	}
	
	@RequestMapping("roomContent")
	public String roomContent(Model model, HttpServletRequest request) {
		int ro_num = Integer.parseInt(request.getParameter("ro_num"));
		
		Room room = rs.getRoomContent(ro_num);
		List<String> roomImg = ris.getRoomImg(ro_num);
		rs.upHit(ro_num);
		
		model.addAttribute("room", room);
		model.addAttribute("roomImg", roomImg);
		return "room/roomContent2";
	}
	
	/*@RequestMapping(value="calendar.do")
	public ModelAndView calendar(@RequestParam(value = "roomNo") int roomNo,
								 @RequestParam(value = "ddayYear", defaultValue = "0") int ddayYear,
								 @RequestParam(value = "ddayMonth", defaultValue = "0") int ddayMonth,
								 @RequestParam(value = "ddayOption", defaultValue = "default") String ddayOption) {
		ModelAndView mv = new ModelAndView();
		Map<String, Object> map = res.getOneDayList(roomNo, ddayYear, ddayMonth, ddayOption);
		mv.setViewName("room/roomContent2");
		System.out.println("나는 맵의 이어 -> " + map.get("ddayYear"));
		mv.addObject("calendarList", map.get("calendarList"));
		mv.addObject("ddayYear", map.get("ddayYear"));
		mv.addObject("ddayMonth", map.get("ddayMonth"));
		return mv;
	}*/
	
	@RequestMapping(value="calendar", method=RequestMethod.POST)
	public String calendar2(@RequestParam(value = "roomNo") int roomNo,
							@RequestParam(value = "ddayYear", defaultValue = "0") int ddayYear,
							@RequestParam(value = "ddayMonth", defaultValue = "0") int ddayMonth,
							@RequestParam(value = "ddayOption", defaultValue = "default") String ddayOption,
							Model model) {
		Map<String, Object> map = res.getOneDayList(roomNo, ddayYear, ddayMonth, ddayOption);
		
		model.addAttribute("calendarList", map.get("calendarList"));
		model.addAttribute("ddayYear", map.get("ddayYear"));
		model.addAttribute("ddayMonth", map.get("ddayMonth"));
		
		return "room/roomContent2";
	}
	
	
	
	@RequestMapping("roomList")
	public String list(Model model, Room room, String currentPage) {	
		System.out.println("dubinController list Start...");
		int total = rs.total();
		Paging pg = new Paging(total, currentPage);
		room.setStart(pg.getStart());
		room.setEnd(pg.getEnd());
		List<Room> listAll = rs.getList(room);
		
		model.addAttribute("list", listAll);
		model.addAttribute("pg", pg);
		return "room/list";
	}
	
	@RequestMapping("roomUpdateGo")
	public String updateGo(Model model, HttpServletRequest request) {	
		System.out.println("dubinController updateGo Start...");
		int ro_num = Integer.parseInt(request.getParameter("ro_num"));
	
		Room room = rs.getRoomContent(ro_num);
		List<String> roomImg = ris.getRoomImg(ro_num);
		
		model.addAttribute("room", room);
		model.addAttribute("roomImg", roomImg);
		return "room/roomUpdate";
	}
	
	@RequestMapping("roomDelete")
	public String delete(Model model, HttpServletRequest request) {	
		System.out.println("dubinController delete Start...");
		int ro_num = Integer.parseInt(request.getParameter("ro_num"));
		
		int result2 = ris.delete(ro_num);
		int result = rs.delete(ro_num);
		return "redirect:roomList";
	}
	
	@RequestMapping(value="roomInsert", method=RequestMethod.POST)
	public String roomInsert(MultipartHttpServletRequest mtfRequest, Model model) {	
		
		// 대표이미지
		MultipartFile file = mtfRequest.getFile("file2");
		String uploadPath = mtfRequest.getSession().getServletContext().getRealPath("/upload/");

		logger.info("originalName: " + file.getOriginalFilename());
		logger.info("size: " + file.getSize());
		logger.info("contextType: " + file.getContentType());
		String savedNameThum = null;
		try {
			savedNameThum = uploadFile(file.getOriginalFilename(), file.getBytes(), uploadPath);
			System.out.println("savedNameThum -> " + savedNameThum);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		logger.info("savedNameThum: " + savedNameThum);
		
		//이미지들
		List<MultipartFile> fileList = mtfRequest.getFiles("file");
		List<String> pathList = new ArrayList<String>();
		for(MultipartFile mf : fileList) {
			logger.info("originalName: " + mf.getOriginalFilename());
			logger.info("size: " + mf.getSize());
			logger.info("contextType: " + mf.getContentType());
			String savedName = null;
			try {
				savedName = uploadFile(mf.getOriginalFilename(), mf.getBytes(), uploadPath);
				System.out.println("savedName -> " + savedName);
			} catch (Exception e) {
				e.printStackTrace();
			}
			pathList.add(savedName);
		}
		
		// dto set
		Room room = new Room();
//		room.setM_num(Integer.parseInt(mtfRequest.getParameter("m_num")));
		room.setM_num(1);
		String ro_title = mtfRequest.getParameter("ro_title");
		room.setRo_title(ro_title);
		room.setRo_content(mtfRequest.getParameter("ro_content"));
		room.setRo_mReservation(Integer.parseInt(mtfRequest.getParameter("morning")));
		room.setRo_aftReservation(Integer.parseInt(mtfRequest.getParameter("afternoon")));
		room.setRo_nitReservation(Integer.parseInt(mtfRequest.getParameter("night")));
		room.setRo_spot1(mtfRequest.getParameter("spot1"));
		room.setRo_spot2(mtfRequest.getParameter("spot2"));
		room.setRo_img(savedNameThum);
		room.setRo_loc(mtfRequest.getParameter("ro_loc"));
		
		int result = rs.insert(room);
		int ro_num = rs.titleToNum(ro_title);
		int result2 = ris.insert(pathList, ro_num);
		
		return "room/roomInsert";
	}
	////////////////update@@@@@@@@@@@@@@@@@@@@@@@@
	@RequestMapping(value="roomUpdate", method=RequestMethod.POST)
	public String roomUpdate(MultipartHttpServletRequest mtfRequest, Model model) {	
		
		// 대표이미지
		MultipartFile file = mtfRequest.getFile("file2");
		String uploadPath = mtfRequest.getSession().getServletContext().getRealPath("/upload/");
		
		logger.info("originalName: " + file.getOriginalFilename());
		logger.info("size: " + file.getSize());
		logger.info("contextType: " + file.getContentType());
		String savedNameThum = null;
		try {
			savedNameThum = uploadFile(file.getOriginalFilename(), file.getBytes(), uploadPath);
			System.out.println("savedNameThum -> " + savedNameThum);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		logger.info("savedNameThum: " + savedNameThum);
		
		//이미지들
		List<MultipartFile> fileList = mtfRequest.getFiles("file");
		List<String> pathList = new ArrayList<String>();
		for(MultipartFile mf : fileList) {
			logger.info("originalName: " + mf.getOriginalFilename());
			logger.info("size: " + mf.getSize());
			logger.info("contextType: " + mf.getContentType());
			String savedName = null;
			try {
				savedName = uploadFile(mf.getOriginalFilename(), mf.getBytes(), uploadPath);
				System.out.println("savedName -> " + savedName);
			} catch (Exception e) {
				e.printStackTrace();
			}
			pathList.add(savedName);
		}
		
		// dto set
		Room room = new Room();
		int ro_num = Integer.parseInt(mtfRequest.getParameter("ro_num"));
		room.setRo_num(ro_num);
		room.setM_num(Integer.parseInt(mtfRequest.getParameter("m_num")));
		room.setRo_hit(Integer.parseInt(mtfRequest.getParameter("ro_hit")));
		room.setRo_title(mtfRequest.getParameter("ro_title"));
		room.setRo_content(mtfRequest.getParameter("ro_content"));
		room.setRo_mReservation(Integer.parseInt(mtfRequest.getParameter("morning")));
		room.setRo_aftReservation(Integer.parseInt(mtfRequest.getParameter("afternoon")));
		room.setRo_nitReservation(Integer.parseInt(mtfRequest.getParameter("night")));
		room.setRo_spot1(mtfRequest.getParameter("spot1"));
		room.setRo_spot2(mtfRequest.getParameter("spot2"));
		room.setRo_img(savedNameThum);
		room.setRo_loc(mtfRequest.getParameter("ro_loc"));
		
		// room update
		int result = rs.update(room);
		// roomImg delete
		int result2 = ris.delete(ro_num);
		// roomImg reInsert
		int result3 = ris.insert(pathList, ro_num);
		
		return "room/roomContent.do?ro_num="+room.getRo_num();
	}
	
	private String uploadFile(String originalName, byte[] fileData, String uploadPath) throws Exception {
		UUID uid = UUID.randomUUID();
		//requestPath = requestPath + "/resources/image";
		System.out.println("uploadPath -> " + uploadPath);
		// Directory 생성
		File fileDirectory = new File(uploadPath);
		if(!fileDirectory.exists()) {
			fileDirectory.mkdirs();
			System.out.println("업로드용 폴더 생성: " + uploadPath);
		}
		String savedName = uid.toString() + "_" + originalName;
		//String path1 = "C:\\spring\\springSrc39\\.metadata\\.plugins\\org.eclipse.wst.server...";
		File target = new File(uploadPath, savedName);
		//File target = new File(requestPath, savedName);
		FileCopyUtils.copy(fileData, target);
		
		return savedName;
	}
	
}
