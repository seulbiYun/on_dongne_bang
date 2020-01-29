package com.khrd.persistence;

import java.util.List;

import com.khrd.domain.RdHtVO;
import com.khrd.domain.SearchCriteria;

public interface RdHtDAO {
	//검색 rdList
	public List<RdHtVO> searchRdList(SearchCriteria scri);
	public int searchRdCount(SearchCriteria scri);
}
