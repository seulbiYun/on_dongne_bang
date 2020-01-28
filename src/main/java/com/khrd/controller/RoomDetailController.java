package com.khrd.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.khrd.domain.Criteria;
import com.khrd.domain.HouseTypeVO;
import com.khrd.domain.MemberVO;
import com.khrd.domain.PageMaker;
import com.khrd.domain.RoomDetailVO;
import com.khrd.service.HouseService;
import com.khrd.service.RoomDetailService;
import com.khrd.util.UploadFileUtils;

@Controller
@RequestMapping("/rd/*")
public class RoomDetailController {
	private static final Logger logger = LoggerFactory.getLogger(RoomDetailController.class);
	
	@Autowired
	private RoomDetailService service;
	@Autowired
	private HouseService hService;
	
	@Resource(name = "uploadPath") // bean id값으로 주입(DI:dependency injection)
	private String uploadPath;
	
	@ResponseBody
	@RequestMapping(value = "rdList",method = RequestMethod.GET)
	public ResponseEntity<List<RoomDetailVO>> MyRoomDetailList(@RequestParam int hNo) {
		ResponseEntity<List<RoomDetailVO>> entity = null;
		
		try {
			System.out.println(hNo);
			List<RoomDetailVO> rdVo = service.rdList(hNo);
			System.out.println(rdVo);
			entity = new ResponseEntity<List<RoomDetailVO>>(rdVo,HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<RoomDetailVO>>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value = "rdListAjax/{hNo}",method = RequestMethod.GET)
	public Map<String,Object> rdListAjax(@PathVariable("hNo") int hNo){
		System.out.println(hNo+"====================hNo");
		Criteria cri = new Criteria();
		List<RoomDetailVO> rdList = service.rdCri(cri, hNo);
		
		System.out.println( rdList +"===================================");
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.rdCount(hNo));
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("rdList", rdList);
		map.put("pageMaker",pageMaker);
		
		return map;
		
	}
	
	@RequestMapping(value = "rdRegister",method=RequestMethod.GET)
	public void registGet(Criteria cri,Model model,HttpSession session) {
		logger.info("--------------------rdRegister GET-----------------");
		
		String member = (String) session.getAttribute("Auth");
		List<HouseTypeVO> htList = hService.htCri(cri,member);
		System.out.println(htList);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(hService.htCount(member));
		
		
		
		int result = htList.size();
		
		System.out.println("result =================================================="+result);
		
		model.addAttribute("result", result);
		model.addAttribute("htList", htList);
		model.addAttribute("pageMaker", pageMaker);
	}
	
	@RequestMapping(value = "rdRegister",method = RequestMethod.POST)
	public String registPost(RoomDetailVO rdVo,List<MultipartFile> imgFiles,Model model,String mId) throws IOException {
		logger.info("--------------------rdRegister POST-----------------");
		logger.info("--------------------imgFiles-----------------"+imgFiles);
		logger.info("--------------------mId-----------------"+mId);
		ArrayList<String> files = new ArrayList<String>();
		for(MultipartFile file : imgFiles) {
			if(file.isEmpty() == false) {
				String saveName = UploadFileUtils.uploadFile(uploadPath,
												file.getOriginalFilename(),
												file.getBytes());
				files.add(saveName);
			}
		}
		rdVo.setFiles(files);
		
		
				
		service.RoomDetailRegister(rdVo);
		
		model.addAttribute("idx", 1);
		
		return "redirect:/member/memberById";
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
