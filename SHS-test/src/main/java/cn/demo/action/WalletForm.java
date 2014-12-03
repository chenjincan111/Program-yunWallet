package cn.demo.action;

import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.interceptor.RequestAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import cn.demo.common.PageRequest;
import cn.demo.common.PageResult;
import cn.demo.model.Member;
import cn.demo.model.Wallet;
import cn.demo.service.MemberService;
import cn.demo.service.WalletService;

@Controller
@ParentPackage("struts-default")
@Namespace(value = "/")
public class WalletForm extends ActionSupport implements RequestAware{

	@Autowired
	private WalletService walletService;
	@Autowired
	private MemberService memberService;

	private Map<String, Object> map;
	private int currentPage;
	private String address;
	private double amount;
	private String toAddress;
	private String msg;
	private boolean locked;

	// @Autowired
	// private WalletLogService walletLogService;

	public boolean isLocked() {
		return locked;
	}

	public void setLocked(boolean locked) {
		this.locked = locked;
	}

	public String getMsg() {
		return msg;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String getToAddress() {
		return toAddress;
	}

	public void setToAddress(String toAddress) {
		this.toAddress = toAddress;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	/*
	 * 钱包页面
	 */
	@Action(value = "/wallet", results = {
			@Result(name = "success", location = "/WEB-INF/jsp/wallet.jsp"),
			@Result(name = "error", location = "/login.jsp") })
	public String walletPage() {
		Object object = ActionContext.getContext().getSession().get("LOGIN_USER");
		String view = "error";
		if (null == object) {
			return view;
		}
		Member loginUser = (Member) object;
		Wallet search = new Wallet();
		search.setMemId(loginUser.getmId());
		PageResult<Wallet> result = walletService.pageResault(search,currentPage);
		
		System.out.println(result.getCurrentList());
		map.put("result", result);

		return "success";
	}
	/*
	 * 删除
	 */
	@Action(value = "/delete", results = {
			@Result(name = "success", location = "/wallet",type="redirect"),
			@Result(name = "error", location = "/login.jsp") })
	public String delete(){
		
		Object object = ActionContext.getContext().getSession().get("LOGIN_USER");
		String view = "error";
		if (null == object) {
			return view;
		}
		Wallet currentWallet = walletService.getWallet(address);
		walletService.deleteWallet(currentWallet);
		System.out.println("delete");
		return "success";
	}
	
	/*
	 * 更新
	 */
	@Action(value = "/update", results = {
			@Result(name = "success", location = "/wallet",type="redirect"),
			@Result(name = "error", location = "/login.jsp") })
	public String update(){
		System.out.println("update");
		Object object = ActionContext.getContext().getSession().get("LOGIN_USER");
		String view = "error";
		if (null == object) {
			return view;
		}
		Member loginUser = (Member) object;
		Wallet wallet = new Wallet();
		wallet.setAddressId(address);
		wallet.setAmount(amount);
		wallet.setLocked(locked);
		wallet.setMemId(loginUser.getmId());
		wallet.setGenTime(new Date());
		walletService.updateWallet(wallet);
		
		return "success";
	}
	
	/*
	 * 钱包付款页面
	 */
	@Action(value = "wallet_address", results = {
			@Result(name = "success", location = "/WEB-INF/jsp/address.jsp"),
			@Result(name = "error", location = "/login.jsp") })
	public String showAddress(){
		
		Object object = ActionContext.getContext().getSession().get("LOGIN_USER");
		String view = "error";
		if (null == object) {
			return view;
		}
		Member loginUser = (Member) object;
		Wallet search = new Wallet();
		search.setMemId(loginUser.getmId());
		PageResult<Wallet> result = walletService.pageResault(search,currentPage);
		Wallet currentWallet = walletService.getWallet(address);
		map.put("result", result);
		map.put("wallet", currentWallet);
		
		return "success";
	}
	
	/*
	 * 新添地址
	 */
	@Action(value = "newAddress", results = {
			@Result(name = "success", location = "/wallet",type="redirect"),
			@Result(name = "error", location = "/login.jsp") })
	public String addAddress() {
		
		Object object = ActionContext.getContext().getSession()
				.get("LOGIN_USER");
		String view = "error";
		if (null == object) {
			return view;
		}
		Member loginUser = (Member) object;
		walletService.newWallet(loginUser.getmId());
		view = "success";

		return view;
	}
	/*
	 * 钱包付款
	 */
	@Action(value = "payto", results = {
			@Result(name = "success", location = "/wallet"),
			@Result(name = "none", location = "/login.jsp"),
			@Result(name = "error", location = "/WEB-INF/jsp/error.jsp")})
	public String payto(){
		
		String view = "error";
		Object object =  ActionContext.getContext().getSession().get("LOGIN_USER");

		if (null == object) {
			return "none";
		}
		Member loginUser = (Member) object;

		if ("".equals(address)) {
			msg = "交易失败，地址为空";
			System.out.println(msg);
			return view;
		}
		Wallet wallet = walletService.getWallet(address);
		if (null == wallet) {
			msg = "交易失败，地址不存在";
			System.out.println(msg);
			return view;
		}
		if (wallet.getMemId() != loginUser.getmId()) {
			msg = "交易失败，账户非法";
			System.out.println(msg);
			return view;
		}
		if (amount > wallet.getAmount()) {
			msg = "交易失败，价格溢出";
			System.out.println(msg);
			return view;
		}
		Wallet toWallet = walletService.getWallet(toAddress);
		if (null == toWallet) {
			msg = "交易失败，目标地址不存在";
			System.out.println(msg);
			return view;
		}

//		log.setMemId(loginUser.getmId());
//		log.setGenTime(new Date());
//		walletLogService.outLog(log);
//		view.addObject("user", loginUser);
//		view.setViewName("/wallet/log/1");
		
		
		return "success";
	}
	
	

	public void setRequest(Map<String, Object> arg0) {
		this.map = arg0;
		
	}


}
