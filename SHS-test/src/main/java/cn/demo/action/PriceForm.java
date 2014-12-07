package cn.demo.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import cn.demo.service.PriceSevice;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Controller
@ParentPackage("struts-default")
@Namespace(value = "/")
public class PriceForm extends ActionSupport {

	private static final long serialVersionUID = 1L;
	@Autowired
	private PriceSevice priceSevice;

	@Action(value="getBitPrice",results={
			@Result(name="success",location="/price.jsp"),
			@Result(name = "error", location = "/login.jsp")})
	public String getBitPrice() throws Exception {
		String price = priceSevice.getPriceFromNet();
		ActionContext.getContext().getApplication().put("price", price);
		System.out.println("ffffffffffffffff");
		return "success";
	}
	
}
