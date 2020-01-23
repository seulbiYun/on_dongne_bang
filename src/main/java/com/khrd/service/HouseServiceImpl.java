package com.khrd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.khrd.domain.Criteria;
import com.khrd.domain.HouseTypeVO;
import com.khrd.persistence.HouseDAO;
@Repository
public class HouseServiceImpl implements HouseService {

	@Autowired
	private HouseDAO dao;
	
	@Override
	public void htRegister(HouseTypeVO htVo) {
		dao.htRegister(htVo);
	}

	@Override
	public List<HouseTypeVO> htList() {
		return dao.htList();
	}

	@Override
	public HouseTypeVO selectByHNo(int hNo) {
		return dao.selectByHNo(hNo);
	}

	@Override
	public List<HouseTypeVO> htCri(Criteria cri,String member) {
		return dao.htCri(cri,member);
	}

	@Override
	public int htCount(String member) {
		return dao.htCount(member);
	}

}
