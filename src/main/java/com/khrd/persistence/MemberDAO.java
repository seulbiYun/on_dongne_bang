package com.khrd.persistence;

import com.khrd.domain.MemberVO;

public interface MemberDAO {
	//LIST--------------------------------
	public MemberVO memberById(String mId);
	
	//REGISTER----------------------------
	public void memberRegister(MemberVO vo);
	
}
