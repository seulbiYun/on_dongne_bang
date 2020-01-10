package com.khrd.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.khrd.domain.MemberVO;
@Repository
public class MemberDAOImpl implements MemberDAO {
	
	private final static String namespace = "mappers.MemberMapper";
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public MemberVO memberById(String mId) {
		return sqlSession.selectOne(namespace+".memberById", mId);
	}

	@Override
	public void memberRegister(MemberVO vo) {
		sqlSession.insert(namespace+".memberRegister", vo);
	}

}
