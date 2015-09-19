package cn.demo.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import cn.demo.model.Member;
import cn.demo.service.MemberService;
import cn.demo.util.MailUtils;

@Controller
@ParentPackage("struts-default")
@Namespace(value = "/")
public class MemberForm extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Autowired
	private MemberService memberService;
	private String msg;
	private String email;
	private String passWord;
	private String rpassWord;
	private String captcha;
	private String userName;
	private String vcode;

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getVcode() {
		return vcode;
	}

	public void setVcode(String vcode) {
		this.vcode = vcode;
	}

	public String getCaptcha() {
		return captcha;
	}

	public void setCaptcha(String captcha) {
		this.captcha = captcha;
	}

	public String getRpassWord() {
		return rpassWord;
	}

	public void setRpassWord(String rpassWord) {
		this.rpassWord = rpassWord;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassWord() {
		return passWord;
	}

	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	/*
	 * 注册功能
	 */
	@Action(value = "regist", results = {
			@Result(name = "success", location = "/WEB-INF/jsp/success.jsp"),
			@Result(name = "error", location = "/WEB-INF/jsp/error.jsp") })
	public String regist() {

		String view = "error";

		if (!MailUtils.mailValidate(email)) {
			msg = "注册失败，你输入的邮箱不合法！";
			System.out.println(msg);
			return view;
		}
		if (!passWord.equals(rpassWord)) {
			msg = "注册失败，两次输入的密码不一致！";
			System.out.println(msg);
			return view;
		}
		if (memberService.existMail(email)) {
			msg = "注册失败，你输入的已被占用！";
			System.out.println(msg);
			return view;
		}
		HttpServletRequest request = ServletActionContext.getRequest();
		String key = "";

		try {
			Object obj = request.getSession().getAttribute(
					"RANDOMVALIDATECODEKEY");
			System.out.println(obj);
			if (null != obj) {
				key = request.getSession()
						.getAttribute("RANDOMVALIDATECODEKEY").toString()
						.toUpperCase();
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		System.out.println(key);

		if (!key.equalsIgnoreCase(captcha)) {
			msg = "注册失败，验证码错误！";
			System.out.println(msg);
			return view;
		}

		view = "success";
		msg = "注册成功，您必须在五天之内到你的邮箱验证，否则账号将失效！";
		System.out.println(msg);
		String vCode = memberService.regist(email, passWord);
		Member member = memberService.validateLogin(email, passWord);
		ActionContext.getContext().getSession().put("LOGIN_USER", member);
		memberService.sendVcodeMail(email, vCode);

		return view;
	}
	
	/*
	 * 注册完成后修改username发送邮件获取验证码
	 */
	@Action(value = "getVcode", results = {
			@Result(name = "success", location = "/WEB-INF/jsp/success.jsp"),
			@Result(name = "error", location = "/WEB-INF/jsp/error.jsp") })
	public String getVcode1() {

		Object object = ActionContext.getContext().getSession().get("LOGIN_USER");
		String view = "error";
		System.out.println(object);
		if (null == object) {
			msg = "请先登录";
			return view;
		}
		Member member = (Member) object;
		
		msg = "验证码已成功发送到您的邮箱！";
		memberService.sendVcodeMail(member.getEmail(), member.getVcode());
		view = "success";
		return view;
	}

	/*
	 * 邮箱激活
	 */

	@Action(value = "validate", results = {
			@Result(name = "none", location = "/WEB-INF/jsp/validate.jsp"),
			@Result(name = "success", location = "/WEB-INF/jsp/success.jsp"),
			@Result(name = "error", location = "/WEB-INF/jsp/error.jsp") })
	public String validat() {
		String view = "error";
		Member member = (Member) ActionContext.getContext().getSession()
				.get("LOGIN_USER");
		if (userName == null && vcode == null)
			return "none";
		if (userName == "" && vcode == "")
			return "none";
		if(null == member ){
			msg="没有账户";
			return view;
		}
		if (!member.getVcode().equalsIgnoreCase(vcode)) {
			msg = "验证失败，验证码错误！请查看你的邮箱！";
			System.out.println(msg);
			return view;
		}

		msg = "验证成功，感谢你对云币的支持与信任！";
		System.out.println(msg);
		member.setUserName(userName);
		member.setValidated(true);
		memberService.update(member);
		view = "success";

		return view;
	}


	/**
	 * 登录
	 * @return
	 */
	@Action(value = "login", results = {
			@Result(name = "success", location = "/wallet",type="redirectAction"),
			@Result(name = "error", location = "/WEB-INF/jsp/error.jsp") })
	public String login() {
		String view = "error";

		if (!MailUtils.mailValidate(email)) {
			msg = "登陆失败，你输入的邮箱不合法！";
			System.out.println(msg);
			return view;
		}
		Member member = memberService.validateLogin(email, passWord);
		if (null == member) {
			msg = "登陆失败，用户名或密码不正确！";
			System.out.println(msg);
			return view;
		} 

		HttpServletRequest request = ServletActionContext.getRequest();
		String key = "";

		try {
			Object obj = request.getSession().getAttribute(
					"RANDOMVALIDATECODEKEY");
			System.out.println(obj);
			if (null != obj) {
				key = request.getSession()
						.getAttribute("RANDOMVALIDATECODEKEY").toString()
						.toUpperCase();
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		System.out.println(key);

		if (!key.equalsIgnoreCase(captcha)) {
			msg = "登陆失败，验证码错误！";
			System.out.println(msg);
			return view;
		}
		ActionContext.getContext().getSession().put("LOGIN_USER", member);
		if (!member.getValidated()) {
			msg = "登陆失败，该邮箱未被激活！！";
			System.out.println(msg);
			return view;
		}
		view = "success";
		msg = "登陆成功！！";
		System.out.println(msg);

		return view;
	}
	
	@Action(value = "logout", results = {
			@Result(name = "success", location = "/login.jsp")})
	public String logout(){
		
		ActionContext.getContext().getSession().remove("LOGIN_USER");
		return "success";
	}

	// @RequestMapping(value="/addresswho.json")
	// @ResponseBody
	// public Map<String,String> whoSaddress(@RequestParam String address){
	// String name = memberService.whoSaddress(address);
	// Map<String,String> map = new HashMap<String,String>();
	// map.put("userName", name);
	// return map;
	// }

}
