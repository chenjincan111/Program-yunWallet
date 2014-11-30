package cn.demo.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;

@Controller
@ParentPackage("struts-default")
@Namespace(value = "/")
public class HelloDemoAction extends ActionSupport {

	private static final long serialVersionUID = 1L;

	@Override
	@Action(value="hello",results={@Result(name="succes",location="/login.jsp")})
	public String execute() throws Exception {
		return "as";
	}
	
}
