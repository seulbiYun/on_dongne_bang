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
	public MemberVO mIdChek(String mId) {
		return sqlSession.selectOne(namespace + ".mIdChek", mId);
	}
	
	@Override
	public void memberRegister(MemberVO vo) {
		sqlSession.insert(namespace+".memberRegister", vo);
	}

	@Override
	public void modify(MemberVO vo) {
		sqlSession.update(namespace + ".modify", vo);
		
	}

	@Override
	public void modifyBySecession(String mId) {
		sqlSession.update(namespace+".modifyBySecession", mId);
	}

	@Override
	public MemberVO selectByIdAndPass(MemberVO vo) {
		return sqlSession.selectOne(namespace + ".selectByIdAndPass", vo);
	}

	

}
