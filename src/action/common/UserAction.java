package action.common;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import bean.Organization;
import bean.User;
import business.OrganizationBusiness;
import business.UserBusiness;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UserAction extends ActionSupport{

	private User user;
	private Organization organization;
	private List<Organization> organizations;
	private List<User> users;
	private String newPassword;
	private OrganizationBusiness ob = new OrganizationBusiness();
	private UserBusiness ub = new UserBusiness();
	private String actionName;
	
	/* 新增用户*/
	public String add() {
		user.setRole(2);
		Organization org = ob.getOrgById(organization.getId());
		user.setOrganization(org);
		ub.create(user);
		return INPUT;
	}
	
	/*
	 * 检查用户名密码是否存在，根据用户类型admin,org,user跳转不同页面
	 */
	public String login() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		User user0 = ub.findUserByNameAndPassword(user.getName(), user.getPassword());
		if (user0 == null) {
			if (user.getName().equals("admin") && user.getPassword().equals("admin")) {
				session.setAttribute("userName", "admin");
				session.setAttribute("userRole", "0");
				return "sysAdmin";
			}else{
				return INPUT;
			}
		}
		else
		{
			session.setAttribute("userName", user0.getName());
			session.setAttribute("userRole", user0.getRole());
			session.setAttribute("userId", user0.getId());
			if(user0.getRole()==0){
			return "sysAdmin";
			}else if(user0.getRole()==1){			
				return "orgAdmin";
			}else{
				return "commonUser";
			}
		}
	}

	/* 重置密码 */
	public String reset() {
/*		if(user.getPassword().equals("admin")&&user.getRole().equals(0)){
			user.setId(null);
			user.setName("admin");
			user.setPassword(newPassword);
			ub.create(user);
		}*/
		User u = ub.find(user);
		if (u != null && u.getPassword().equals(user.getPassword())) {
			u.setPassword(newPassword);
			ub.update(u);
			addActionMessage("修改成功！");
		}else{
			addActionError("用户名或密码错误！");
		}
		return "reset";
	}
	
	/* 获取用户列表 */
	public String list() {
		organizations = ob.getAllOrganization();
		for(Organization org:organizations){
			List<User> users = org.getUsers();
			System.out.println(users);
		}
		return "list";
	}
	
	/* 删除用户信息 */
	public String delete() {
		ub.delete(user);
		return list();
	}
	
	/* 保存修改后的用户信息 */
	public String edited() {
		ub.update(user);
		return list();
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

	public String getNewPassword() {
		return newPassword;
	}

	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}

	public List<Organization> getOrganizations() {
		return organizations;
	}

	public void setOrganizations(List<Organization> organizations) {
		this.organizations = organizations;
	}

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

	public String getActionName() {
		return actionName;
	}

	public void setActionName(String actionName) {
		this.actionName = actionName;
	}
}
