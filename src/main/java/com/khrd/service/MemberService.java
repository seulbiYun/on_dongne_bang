package com.khrd.service;

import com.khrd.domain.MemberVO;

public interface MemberService {
	//LIST--------------------------------
	public MemberVO memberById(String mId);
	public MemberVO mIdChek(String mId);
	public MemberVO selectByIdAndPass(MemberVO vo); //login
	
	//REGISTER----------------------------
	public void memberRegister(MemberVO vo);
	
	// modify-----------------------------
	public void modify(MemberVO vo);
	public void modifyBySecession(String mId);
}
