package cn.demo.test;

import static org.junit.Assert.*;

import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;



import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.demo.dao.MemberDao;
import cn.demo.model.Member;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:applicationContext.xml" })
public class MemberDaoTest {

	@Autowired
	private MemberDao memberDao;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
	}

	@Test
	public void testSave() {
		Member m = new Member();
		m.setEmail("sda");
		m.setPassWord("123456");
		m.setVcode("ff");
		memberDao.save(m);
	}

	@Test
	public void testUpdate() {
		Member member = memberDao.getById(880);
		member.setEmail("haha");
		memberDao.update(member);
	}

	@Test
	public void testDelete() {
		memberDao.delete(880);
	}

	@Test
	public void testGetById() {
		Member member = memberDao.getById(880);
		System.out.println(member.getEmail());
	}

	@Test
	public void testFindAll() {
		fail("Not yet implemented");
	}

}
