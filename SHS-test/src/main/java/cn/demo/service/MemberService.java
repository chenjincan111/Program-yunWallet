package cn.demo.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.demo.dao.MemberDao;
import cn.demo.model.Member;
import cn.demo.util.MailUtils;
import cn.demo.util.Md5Utils;
import cn.demo.util.VCodeUtils;


@Service
public class MemberService {

//	private static Logger logger = Logger.getLogger(MemberService.class);
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private MailUtils mailUtils;

	/**
	 * 注册
	 * 
	 * @param email
	 * @param pwd
	 * @return
	 */
	public String regist(String email, String pwd) {

		String vCode = VCodeUtils.Vcode(6);
		Member m = new Member();
		m.setEmail(email);
		m.setPassWord(Md5Utils.md5(pwd));
		m.setVcode(vCode);
		memberDao.save(m);
		//logger.info("新注册用户：" + email);
		return vCode;
	}
	
	public void update(Member member){
		
		memberDao.update(member);
		
	}

	/**
	 * 判断邮箱是还已占用
	 * 
	 * @param email
	 * @return
	 */
	public boolean existMail(String email) {
		List<Member> result = memberDao.find("from Member where email = ?",
				email);
		if (null == result || result.size() <= 0) {
			return false;
		} else {
			return true;
		}
	}

	/**
	 * 发送注册邮件
	 * 
	 * @param email
	 * @param vCode
	 */
	public void sendVcodeMail(String email, String vCode) {
		String subject = "云币钱包注册验证";
		StringBuffer text = new StringBuffer("");
		text.append("<p><h2>你的云币账户已准备就绪！</h2></p>");
		text.append("<p>请点击以下链接进行激活</p>");
		text.append("<p><a href=\"" + "http://localhost:8080/SHS-test/validate" + "\">"
				+ "激活链接" + "</a></p>");
		text.append("<P>或输入：" + vCode + "</P>");
		text.append("<P>到注册表格中。</P>");

		mailUtils.sendMailUtis(email, subject, text.toString());

//		logger.info("发送验证码" + vCode + "到新用户邮箱：" + email);
	}

	/**
	 * 登陆
	 * 
	 * @param email2
	 * @param password
	 * @return
	 */
	public Member validateLogin(String email, String password) {
		List<Member> result = memberDao.find(
				"from Member where email=? and passWord=?", email,
				Md5Utils.md5(password));
		if (null == result || result.size() <= 0) {
			return null;
		} else {
			return result.get(0);
		}
	}

//	/**
//	 * 
//	 * @param m
//	 */
//	public void update(Member m) {
//		memberDao.update(m);
//	}
//
//	/**
//	 * 根据Address查找userName
//	 * @param address
//	 * @return
//	 */
//	public String whoSaddress(String address) {
//		Wallet wallet = walletDao.get(address);
//		if (null == wallet) {
//			return "";
//		}
//		Member member = memberDao.get(wallet.getMemId());
//		if (null == member) {
//			return "";
//		}
//		return member.getUserName();
//	}

}
