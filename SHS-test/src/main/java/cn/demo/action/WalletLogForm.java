package cn.demo.action;


import java.util.List;
import java.util.Map;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.interceptor.RequestAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import cn.demo.common.PageResult;
import cn.demo.model.Member;
import cn.demo.model.WalletLogIn;
import cn.demo.model.WalletLogOut;
import cn.demo.service.WalletLogService;

@Controller
@ParentPackage("struts-default")
@Namespace(value = "/")
public class WalletLogForm  extends ActionSupport  implements RequestAware{


	@Autowired
	private WalletLogService logService;
	private Map<String, Object> map;
	
	private int currentPage;
	
	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	
	@Action(value = "/transactions", results = {
			@Result(name = "success", location = "/WEB-INF/jsp/transactions.jsp"),
			@Result(name = "error", location = "/login.jsp") })
	public String transactions() {
		
		Object object = ActionContext.getContext().getSession().get("LOGIN_USER");
		String view = "error";
		if (null == object) {
			return view;
		}
		Member loginUser = (Member) object;
		WalletLogOut logOutSeach = new WalletLogOut();
		logOutSeach.setMemId(loginUser.getmId());
		WalletLogIn logInSeach = new WalletLogIn();
		logInSeach.setMemId(loginUser.getmId());

		PageResult<WalletLogOut> logOutPage = logService.logOutPageResult(
				logOutSeach, currentPage);
		System.out.println(logOutPage.getCurrentList());
		PageResult<WalletLogIn> logInPage = logService.logInPageResult(
				logInSeach, currentPage);
		System.out.println(logInPage.getCurrentList());
		int count = logService.getCount();
		List unfinishList = logService.getUnfinish();
		map.put("unfinishList", unfinishList);
		map.put("countFinish", count);
		map.put("outlog", logOutPage);
		map.put("inlog", logInPage);
		return "success";
	}
	
	@Action(value = "/unfinishTransactions", results = {
			@Result(name = "success", location = "/WEB-INF/jsp/unfinishtransactions.jsp"),
			@Result(name = "error", location = "/login.jsp") })
	public String unfinishTransactions() {
		
		Object object = ActionContext.getContext().getSession().get("LOGIN_USER");
		String view = "error";
		if (null == object) {
			return view;
		}
		List unfinishList = logService.getUnfinish();
		map.put("unfinishList", unfinishList);
		return "success";
	}

	public void setRequest(Map<String, Object> arg0) {
		this.map = arg0;
	}

}
