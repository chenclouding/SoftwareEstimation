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
	private String newPassword;
	
	/* �����û� */
	public String add() {
		user.setRole(2);
		Organization org = new OrganizationBusiness().getOrgById(organization.getId());
		user.setOrganization(org);
		new UserBusiness().create(user);
		return INPUT;
	}
	
	/*
	 * ����û��������Ƿ���ڣ�֮������û������ͣ�������ת��ҳ�棨admin,org,user��
	 */
	public String login() {
		Map<String,Object> map = ActionContext.getContext().getSession();
		User user0 = new UserBusiness().findUserByNameAndPassword(user.getName(), user.getPassword());
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

	/* �����û����� */
	public String reset() {
		if(user.getPassword().equals("admin")&&user.getRole().equals(0)){
			user.setId(null);
			user.setName("admin");
			user.setPassword(newPassword);
			new UserBusiness().create(user);
		}
		UserBusiness ub = new UserBusiness();
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
}
