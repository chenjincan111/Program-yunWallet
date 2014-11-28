package cn.demo.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



import cn.demo.dao.MemberDao;
import cn.demo.model.Member;


@Service
public class MemberServiceImpl {

	@Autowired
	private MemberDao memberDao;
	
	/**
	 * 注册
	 * 
	 * @param email
	 * @param pwd
	 * @return
	 */
	public String regist() {

		Member m = new Member();
		m.setEmail("sda");
		m.setPassWord("123456");
		m.setVcode("ff");
		//memberDao.save(m);
		return "";
	}
	
	public static void main(String[] args) {
		MemberServiceImpl mmm = new MemberServiceImpl();
		mmm.regist();
	}
	
}
