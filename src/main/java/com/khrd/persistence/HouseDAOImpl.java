package com.khrd.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.khrd.domain.Criteria;
import com.khrd.domain.HouseTypeVO;
@Repository
public class HouseDAOImpl implements HouseDAO{
	private final static String namespace = "mappers.HouseTypeMapper";
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void htRegister(HouseTypeVO htVo) {
		sqlSession.insert(namespace+".htRegister", htVo);
	}

	@Override
	public List<HouseTypeVO> htList() {
		return sqlSession.selectList(namespace+".htList");
	}

	@Override
	public HouseTypeVO selectByHNo(int hNo) {
		return sqlSession.selectOne(namespace+".selectByHNo", hNo);
	}

	@Override
	public List<HouseTypeVO> htPage(int page, int perPage) {
		page = (page-1) * perPage;
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("page",page);
		map.put("perPage",perPage);
		return sqlSession.selectList(namespace+".htPage", map);
	}

	@Override
	public List<HouseTypeVO> htCri(Criteria cri,String member) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member", member);
		map.put("cri", cri);
		return sqlSession.selectList(namespace+".htCri", map);
	}

	@Override
	public int htCount(String member) {
		return sqlSession.selectOne(namespace+".htCount", member);
		
	}

}
