package com.khrd.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.khrd.domain.RdHtVO;
import com.khrd.domain.SearchCriteria;
@Repository
public class RdHtDAOImpl implements RdHtDAO{
	private final static String namespace = "mappers.RdHtMapper";

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<RdHtVO> searchRdList(SearchCriteria scri) {
		return sqlSession.selectList(namespace+".searchRdList", scri);
	}

	@Override
	public int searchRdCount(SearchCriteria scri) {
		return sqlSession.selectOne(namespace+".searchRdCount", scri);
	}

}
