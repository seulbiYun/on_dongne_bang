package com.khrd.persistence;

import java.util.List;

import com.khrd.domain.RoomDetailVO;

public interface RoomDetailDAO {
	//내가 올린 방 리스트
	public List<RoomDetailVO> selectByMemberId(String mId);
	//방 상세보기
	public RoomDetailVO readByRdNo(int rdNo);
	//방올리기
	public void RoomDetailRegister(RoomDetailVO vo);
	
}
