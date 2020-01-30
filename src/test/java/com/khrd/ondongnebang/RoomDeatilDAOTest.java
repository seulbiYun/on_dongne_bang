package com.khrd.ondongnebang;

import java.util.ArrayList;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.khrd.domain.RoomDetailVO;
import com.khrd.persistence.RoomDetailDAO;

@RunWith(SpringJUnit4ClassRunner.class)//bean을 가져올 수 있도록 등록
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})//bean과 연결
public class RoomDeatilDAOTest {
	private static final Logger logger = LoggerFactory.getLogger(RoomDeatilDAOTest.class);
	
	@Autowired
	private RoomDetailDAO dao;
	
	@Test
	public void testInsert() {
		ArrayList<String> files = new ArrayList<String>();
		
		files.add("/2020/01/29/s_30b24994-86b3-4074-b2c1-f20d4fbe02a2_8abecbfccb9b0bd1b18c25fe2fba82a8.jpg");
		files.add("/2020/01/29/s_30b24994-86b3-4074-b2c1-f20d4fbe02a2_8abecbfccb9b0bd1b18c25fe2fba82a8.jpg");
		files.add("/2020/01/29/s_30b24994-86b3-4074-b2c1-f20d4fbe02a2_8abecbfccb9b0bd1b18c25fe2fba82a8.jpg");
		files.add("/2020/01/29/s_30b24994-86b3-4074-b2c1-f20d4fbe02a2_8abecbfccb9b0bd1b18c25fe2fba82a8.jpg");
		files.add("/2020/01/29/s_30b24994-86b3-4074-b2c1-f20d4fbe02a2_8abecbfccb9b0bd1b18c25fe2fba82a8.jpg");
		files.add("/2020/01/29/s_30b24994-86b3-4074-b2c1-f20d4fbe02a2_8abecbfccb9b0bd1b18c25fe2fba82a8.jpg");
		files.add("/2020/01/29/s_30b24994-86b3-4074-b2c1-f20d4fbe02a2_8abecbfccb9b0bd1b18c25fe2fba82a8.jpg");
		RoomDetailVO vo = new RoomDetailVO(0, "5층",
				2,"전세","30m2",70000,"인터넷,수도세","2020-01-30",
				1,1,"개별 난방",200000000,0,1,
				1,1,1,1,1,1,
				1,1,1,1,"넓고 햇살 잘드는 방",
				"남향으로 해가 잘드네여하하하하하이렇게 좋은 집이  있다니 당장 계약해야겠다는 마음이 확드네요!!",1 ,
				files);
		dao.RoomDetailRegister(vo);
		for(String file : vo.getFiles()) {
			dao.addAttach(file, vo.getRdNo());
		}
	}
	
	//@Test
	public void testRead() {
		dao.selectJoinByAttach(10);
	}
}
