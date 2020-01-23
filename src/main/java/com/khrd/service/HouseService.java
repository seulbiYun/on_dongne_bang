package com.khrd.service;

import java.util.List;

import com.khrd.domain.Criteria;
import com.khrd.domain.HouseTypeVO;

public interface HouseService {
	//건물 정보 추가
	public void htRegister(HouseTypeVO htVo);
	//건물 리스트
	public List<HouseTypeVO> htList();
	//건물 상세 정보
	public HouseTypeVO selectByHNo(int hNo);
	//건물 리스트 페이징
	public List<HouseTypeVO> htCri(Criteria cri,String member);
	public int htCount(String member);
}
