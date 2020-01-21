package com.khrd.controller;

import java.util.List;

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

import com.khrd.domain.RoomDetailVO;
import com.khrd.service.RoomDetailService;

@Controller
@RequestMapping("/rd/*")
public class RoomDetailController {
	private static final Logger logger = LoggerFactory.getLogger(RoomDetailController.class);
	
	@Autowired
	private RoomDetailService service;
	
	@ResponseBody
	@RequestMapping(value = "rdList",method = RequestMethod.GET)
	public ResponseEntity<List<RoomDetailVO>> MyRoomDetailList(@RequestParam String mId) {
		ResponseEntity<List<RoomDetailVO>> entity = null;
		
		try {
			System.out.println(mId);
			List<RoomDetailVO> vo = service.selectByMemberId(mId);
			System.out.println(vo);
			entity = new ResponseEntity<List<RoomDetailVO>>(vo,HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<RoomDetailVO>>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
		
		
	}
	
}
