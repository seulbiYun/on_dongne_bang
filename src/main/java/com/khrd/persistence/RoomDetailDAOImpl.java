package com.khrd.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.khrd.domain.Criteria;
import com.khrd.domain.RoomDetailVO;
@Repository
public class RoomDetailDAOImpl implements RoomDetailDAO {
	private final static String namespace = "mappers.RoomDetailMapper";
	
	@Autowired
	private SqlSession sqlSession;
	
	
	@Override
	public RoomDetailVO readByRdNo(int rdNo) {
		return sqlSession.selectOne(namespace + ".readByRdNo", rdNo);
	}

	@Override
	public void RoomDetailRegister(RoomDetailVO vo) {
		sqlSession.insert(namespace + ".RoomDetailRegister", vo);
	}

	@Override
	public void deleteAttachByRdNoAndFullname(String fullname, int rdNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("fullname",fullname);
		map.put("rdNo",rdNo);
		sqlSession.delete(namespace +".deleteAttachByRdNoAndFullname", map);
	}

	@Override
	public void addAttach(String fullname,int rdNo) {
		System.out.println(fullname);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("fullname",fullname);
		map.put("rdNo",rdNo);
		sqlSession.insert(namespace+".addAttach", map);
	}

	@Override
	public RoomDetailVO selectJoinByAttach(int rdNo) {
		return sqlSession.selectOne(namespace+".selectJoinByAttach", rdNo);
	}

	@Override
	public void deleteAttachByRdNo(int rdNo) {
		sqlSession.delete(namespace+".deleteAttachByRdNo", rdNo);
	}

	@Override
	public void modifyAttach(String fullname, int rdNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("fullname",fullname);
		map.put("rdNo",rdNo);
		sqlSession.insert(namespace+".modifyAttach", map);
	}

	@Override
	public List<RoomDetailVO> rdList(int hNo) {
		return sqlSession.selectList(namespace+".rdList", hNo);
	}

	@Override
	public List<RoomDetailVO> rdPage(int page, int perPage) {
		page = (page-1) * perPage;
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("page",page);
		map.put("perPage",perPage);
		return sqlSession.selectList(namespace+".rdPage", map);
	}

	@Override
	public List<RoomDetailVO> rdCri(Criteria cri, int hNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("hNo", hNo);
		map.put("cri", cri);
		return sqlSession.selectList(namespace+".rdCri", map);
	}

	@Override
	public int rdCount(int hNo) {
		return sqlSession.selectOne(namespace+".rdCount", hNo);
	}

}
