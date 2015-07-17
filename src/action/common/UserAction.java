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
		if (user != null) {
			if (user.getName().equals("admin") && user.getPassword().equals("admin")) {// ϵͳ������Ա�û���admin������admin
				map.put("userName", "admin");
				map.put("userRole", "0");
				return "sysAdmin";
			}
		}
		user = new UserBusiness().findUserByNameAndPassword(user.getName(), user.getPassword());
		if (user == null) {
			addActionError("�û�����������������ԣ�");
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
