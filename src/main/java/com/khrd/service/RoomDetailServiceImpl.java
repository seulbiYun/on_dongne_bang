package com.khrd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.khrd.domain.Criteria;
import com.khrd.domain.RoomDetailVO;
import com.khrd.persistence.RoomDetailDAO;

@Repository
public class RoomDetailServiceImpl implements RoomDetailService{

	@Autowired
	private RoomDetailDAO dao;
	
	@Override
	public RoomDetailVO readByRdNo(int rdNo) {
		return dao.readByRdNo(rdNo);
	}

	@Override
	@Transactional
	public void RoomDetailRegister(RoomDetailVO vo) {
		dao.RoomDetailRegister(vo);
		for(String file : vo.getFiles()) {
			dao.addAttach(file,vo.getRdNo());
		}
	}

	@Override
	public void deleteAttachByRdNoAndFullname(String fullname, int rdNo) {
		if(fullname != null) {
			dao.deleteAttachByRdNoAndFullname(fullname, rdNo);
		}
	}

	@Override
	public RoomDetailVO selectJoinByAttach(int rdNo) {
		return dao.selectJoinByAttach(rdNo);
	}

	@Override
	public void modifyAttach(String fullname, int rdNo) {
		if(fullname != null) {
			dao.modifyAttach(fullname, rdNo);
		}
	}

	@Override
	public List<RoomDetailVO> rdList(int hNo) {
		return dao.rdList(hNo);
	}

	@Override
	public List<RoomDetailVO> rdCri(Criteria cri, int hNo) {
		return dao.rdCri(cri, hNo);
	}

	@Override
	public int rdCount(int hNo) {
		return dao.rdCount(hNo);
	}

}
