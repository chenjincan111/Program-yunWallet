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
		m.setmId(882);
		m.setEmail("sda2");
		m.setPassWord("1234562");
		m.setVcode("ff");
		memberDao.saveOrUpdate(m);
	}

	@Test
	public void testUpdate() {
		Member member = memberDao.get(882);
		member.setEmail("haha");
		memberDao.update(member);
	}

	@Test
	public void testDelete() {
		Member member = memberDao.get(880);
		memberDao.delete(member);
	}

	@Test
	public void testGetById() {
		Member member = memberDao.get(882);
		System.out.println(member.getEmail());
	}

	@Test
	public void testFindAll() {
		System.out.println(memberDao.loadAll());
	}

}
