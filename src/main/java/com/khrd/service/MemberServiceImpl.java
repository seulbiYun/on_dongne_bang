package com.khrd.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.khrd.domain.MemberVO;
import com.khrd.persistence.MemberDAO;
@Repository
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDAO dao;

	@Override
	public MemberVO memberById(String mId) {
		return dao.memberById(mId);
	}

	@Override
	public void memberRegister(MemberVO vo) {
		dao.memberRegister(vo);
	}

}
