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
	public MemberVO mIdChek(String mId) {
		return dao.mIdChek(mId);
	}

	@Override
	public void memberRegister(MemberVO vo) {
		dao.memberRegister(vo);
	}

	@Override
	public void modify(MemberVO vo) {
		dao.modify(vo);
	}

	@Override
	public void modifyBySecession(String mId) {
		dao.modifyBySecession(mId);
	}

	@Override
	public MemberVO selectByIdAndPass(MemberVO vo) {
		return dao.selectByIdAndPass(vo);
	}

}
