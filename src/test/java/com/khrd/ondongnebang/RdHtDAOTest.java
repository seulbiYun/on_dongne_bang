package com.khrd.ondongnebang;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.khrd.domain.SearchCriteria;
import com.khrd.persistence.RdHtDAO;

@RunWith(SpringJUnit4ClassRunner.class)//bean을 가져올 수 있도록 등록
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})//bean과 연결
public class RdHtDAOTest {
	private static final Logger logger = LoggerFactory.getLogger(RdHtDAOTest.class);
	@Autowired
	private RdHtDAO dao;
	
	//@Test
	public void testSearchList() {
		SearchCriteria scri = new SearchCriteria("동구");
		dao.searchRdList(scri);
			
	}
	@Test
	public void testSearchCount() {
		SearchCriteria scri = new SearchCriteria("동구");
		System.out.println(scri +"==============================scri");
		dao.searchRdCount(scri);
	}
}
