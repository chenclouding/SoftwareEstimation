package action.common;

import java.util.Map;

import bean.Organization;
import bean.User;
import business.OrganizationBusiness;
import business.UserBusiness;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UserAction extends ActionSupport{
	
	private User user;
	private Organization organization;
	
	/* 新增用户 */
	public String add() {
		user.setRole(2);
		Organization org = new OrganizationBusiness().getOrgById(organization.getId());
		user.setOrganization(org);
		new UserBusiness().create(user);
		return INPUT;
	}
	
	/*
	 * 检查用户名密码是否存在，之后根据用户的类型，决定跳转的页面（admin,org,user）
	 */
	public String login() {
		Map<String,Object> map = ActionContext.getContext().getSession();
		if (user != null) {
			if (user.getName().equals("admin") && user.getPassword().equals("admin")) {// 系统级管理员用户名admin，密码admin
				map.put("userName", "admin");
				map.put("userRole", "0");
				return "sysAdmin";
			}
		}
		user = new UserBusiness().findUserByNameAndPassword(user.getName(), user.getPassword());
		if (user == null) {
			addActionError("用户名或密码错误，请重试！");
			return INPUT;
		} else if(user.getRole()==1){			
			map.put("userName", user.getName());
			map.put("userRole", user.getRole());
			return "orgAdmin";
		}else{
			map.put("userName", user.getName());
			map.put("userRole", user.getRole());
			return "commonUser";
		}
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}


	public Organization getOrganization() {
		return organization;
	}


	public void setOrganization(Organization organization) {
		this.organization = organization;
	}
}
