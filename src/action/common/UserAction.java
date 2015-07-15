package action.common;

import bean.User;
import business.UserBusiness;

import com.opensymphony.xwork2.ActionSupport;

public class UserAction extends ActionSupport{
	
	private User user;
	
	/* 新增用户 */
	public String add() {
		user.setRole(2);
		new UserBusiness().create(user);
		return SUCCESS;
	}
/*	private List<User> users = new ArrayList<User>();
	private User user;
	private Organization organization;
	private boolean message;
	private String oldPassword;
	private String userPassword;*/

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	/*
	 * 检查用户名密码是否存在，之后根据用户的类型，决定跳转的页面（admin,org,user）
	 */
/*	public String login() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		if (user != null) {
			if (user.getName().equals("admin") && user.getPassword().equals("admin")) {// 系统级管理员用户名admin，密码admin
				session.setAttribute("userName", "admin");
				session.setAttribute("userId", 0);
				session.setAttribute("userRole", "admin");
				return SUCCESS;
			}
		}
		user = new UserBusiness().findUserByNamePassword(user.getName(), user.getPassword());
		if (user == null) {
			addActionError("用户名或密码错误，请重试！");
			return INPUT;
		} else {
			session.setAttribute("userName", user.getName());
			session.setAttribute("userRole", user.getRole());
			session.setAttribute("userId", user.getId());
			session.setAttribute("organization", user.getOrganization());
			return SUCCESS;
		}
	}*/
}
