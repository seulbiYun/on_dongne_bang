package com.khrd.persistence;

import java.util.List;

import com.khrd.domain.Criteria;
import com.khrd.domain.HouseTypeVO;
import com.khrd.domain.RoomDetailVO;
import com.khrd.domain.SearchCriteria;

public interface RoomDetailDAO {
	//내가 올린 방 리스트
	public List<RoomDetailVO> rdList(int hNo);
	//방 상세보기
	public RoomDetailVO readByRdNo(int rdNo);
	//방올리기
	public void RoomDetailRegister(RoomDetailVO vo);
	//image
	public void deleteAttachByRdNoAndFullname(String fullname,int rdNo);
	
	public void addAttach(String fullname, int rdNo); 
	
	public RoomDetailVO selectJoinByAttach(int rdNo);
	
	public void deleteAttachByRdNo(int rdNo);
	
	public void modifyAttach(String fullname,int rdNo);
	//방 리스트 페이징
	public List<RoomDetailVO> rdPage(int page, int perPage);
	public List<RoomDetailVO> rdCri(Criteria cri,int hNo);
	public int rdCount(int hNo);
}
