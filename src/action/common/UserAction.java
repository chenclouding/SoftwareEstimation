package action.common;

import bean.User;
import business.UserBusiness;

import com.opensymphony.xwork2.ActionSupport;

public class UserAction extends ActionSupport{
	
	private User user;
	
	/* �����û� */
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
	 * ����û��������Ƿ���ڣ�֮������û������ͣ�������ת��ҳ�棨admin,org,user��
	 */
/*	public String login() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		if (user != null) {
			if (user.getName().equals("admin") && user.getPassword().equals("admin")) {// ϵͳ������Ա�û���admin������admin
				session.setAttribute("userName", "admin");
				session.setAttribute("userId", 0);
				session.setAttribute("userRole", "admin");
				return SUCCESS;
			}
		}
		user = new UserBusiness().findUserByNamePassword(user.getName(), user.getPassword());
		if (user == null) {
			addActionError("�û�����������������ԣ�");
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
