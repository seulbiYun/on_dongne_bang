package com.khrd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.khrd.domain.RoomDetailVO;
import com.khrd.persistence.RoomDetailDAO;

@Repository
public class RoomDetailServiceImpl implements RoomDetailService{

	@Autowired
	private RoomDetailDAO dao;
	
	@Override
	public List<RoomDetailVO> selectByMemberId(String mId) {
		return dao.selectByMemberId(mId);
	}

	@Override
	public RoomDetailVO readByRdNo(int rdNo) {
		return dao.readByRdNo(rdNo);
	}

	@Override
	public void RoomDetailRegister(RoomDetailVO vo) {
		dao.RoomDetailRegister(vo);
	}

}
