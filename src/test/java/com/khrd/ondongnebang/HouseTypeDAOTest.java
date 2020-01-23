package com.khrd.ondongnebang;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.khrd.domain.HouseTypeVO;
import com.khrd.persistence.HouseDAO;

@RunWith(SpringJUnit4ClassRunner.class)//bean을 가져올 수 있도록 등록
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})//bean과 연결
public class HouseTypeDAOTest {
	private static final Logger logger = LoggerFactory.getLogger(HouseTypeDAOTest.class);
	
	@Autowired
	private HouseDAO dao;
	
	@Test
	public void insertTest() {
		HouseTypeVO htVo = new HouseTypeVO(0,"아파트","대구 남구 큰골길2",0,1,"33층","bangmana");
		
		dao.htRegister(htVo);
	}
}
