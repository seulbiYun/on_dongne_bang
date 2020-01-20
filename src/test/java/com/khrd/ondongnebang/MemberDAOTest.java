package com.khrd.ondongnebang;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.khrd.domain.MemberVO;
import com.khrd.persistence.MemberDAO;

@RunWith(SpringJUnit4ClassRunner.class)//bean을 가져올 수 있도록 등록
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})//bean과 연결
public class MemberDAOTest {
	private static final Logger logger = LoggerFactory.getLogger(MemberDAOTest.class);
	
	@Autowired
	private MemberDAO dao;

	//@Test
	public void testMemberById() {
		dao.memberById("bangmana");
	}
	//@Test
	public void testMemberRegister() throws Exception {
		String date_s = "1995-10-18";
		MemberVO vo = new MemberVO("user1", "test", "Name", "01010041004", "email@email.com", date_s, 0);
		dao.memberRegister(vo);
	}
	
	@Test
	public void testModify() {
		MemberVO vo = new MemberVO();
		vo.setmPassword("password");
		vo.setmName("newName");
		vo.setmTel("01033334444");
		vo.setmEmail("email98@email.com");
		dao.modify(vo);
	}
	
}
