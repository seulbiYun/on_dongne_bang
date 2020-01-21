package com.khrd.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.khrd.domain.RoomDetailVO;
@Repository
public class RoomDetailDAOImpl implements RoomDetailDAO {
	private final static String namespace = "mappers.RoomDetailMapper";
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<RoomDetailVO> selectByMemberId(String mId) {
		return sqlSession.selectList(namespace+".selectByMemberId", mId);
	}

	@Override
	public RoomDetailVO readByRdNo(int rdNo) {
		return sqlSession.selectOne(namespace + ".readByRdNo", rdNo);
	}

	@Override
	public void RoomDetailRegister(RoomDetailVO vo) {
		sqlSession.insert(namespace + ".RoomDetailRegister", vo);
	}

}
