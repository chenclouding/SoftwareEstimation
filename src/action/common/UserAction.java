package action.common;

import java.util.List;
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
		Map<String,Object> map = ActionContext.getContext().getSession();
		User user0 = ub.findUserByNameAndPassword(user.getName(), user.getPassword());
		if (user0 == null) {
			if (user.getName().equals("admin") && user.getPassword().equals("admin")) {// ϵͳ������Ա�û���admin������admin
				map.put("userName", "admin");
				map.put("userRole", "0");
				return "sysAdmin";
			}else{
				return INPUT;
			}
		}
		else
		{
			if(user0.getRole()==0){
			map.put("userName", user0.getName());
			map.put("userRole", user0.getRole());
			map.put("userId", user0.getId());
			return "sysAdmin";
			}else if(user0.getRole()==1){			
				map.put("userName", user0.getName());
				map.put("userRole", user0.getRole());
				map.put("userId", user0.getId());
				return "orgAdmin";
			}else{
				map.put("userName", user0.getName());
				map.put("userRole", user0.getRole());
				map.put("userId", user0.getId());
				return "commonUser";
			}
		}
	}

	/* 重置密码 */
	public String reset() {
		if(user.getPassword().equals("admin")&&user.getRole().equals(0)){
			user.setId(null);
			user.setName("admin");
			user.setPassword(newPassword);
			ub.create(user);
		}
		User u = ub.find(user);
		if (u != null && u.getPassword() == user.getPassword()) {
			u.setPassword(newPassword);
			ub.update(u);
		} 
		return "reset";
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
