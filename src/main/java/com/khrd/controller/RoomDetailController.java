package com.khrd.controller;

import java.util.List;

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

import com.khrd.domain.Criteria;
import com.khrd.domain.HouseTypeVO;
import com.khrd.domain.PageMaker;
import com.khrd.domain.RoomDetailVO;
import com.khrd.service.HouseService;
import com.khrd.service.RoomDetailService;

@Controller
@RequestMapping("/rd/*")
public class RoomDetailController {
	private static final Logger logger = LoggerFactory.getLogger(RoomDetailController.class);
	
	@Autowired
	private RoomDetailService service;
	@Autowired
	private HouseService hService;
	
	@ResponseBody
	@RequestMapping(value = "rdList",method = RequestMethod.GET)
	public ResponseEntity<List<RoomDetailVO>> MyRoomDetailList(@RequestParam String mId) {
		ResponseEntity<List<RoomDetailVO>> entity = null;
		
		try {
			System.out.println(mId);
			List<RoomDetailVO> rdVo = service.selectByMemberId(mId);
			System.out.println(rdVo);
			entity = new ResponseEntity<List<RoomDetailVO>>(rdVo,HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<RoomDetailVO>>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
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
		
		model.addAttribute("htList", htList);
		model.addAttribute("pageMaker", pageMaker);
	}
	
	@RequestMapping(value = "rdRegister",method = RequestMethod.POST)
	public String registPost(RoomDetailVO rdVo) {
		logger.info("--------------------rdRegister GET-----------------");
	
		service.RoomDetailRegister(rdVo);
		
		return "redirect:/rd/rdList";
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
