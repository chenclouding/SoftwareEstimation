package business;

import java.util.List;

import bean.Organization;
import bean.User;
import dao.BaseDAO;

public class UserBusiness {
	private BaseDAO<User> dao=new BaseDAO<User>();
	
	public void create(User p) {
		dao.create(p);
	}
	
	public User findUserByNameAndPassword(String name, String password) {
		List<User> users=dao.list("select c from User c where c.name='"+name+"' and c.password='"+password+"'");
		if(users==null||users.isEmpty())
			return null;
		else
			return users.get(0);		
	}
	
	public User find(User p) {
		return dao.find(User.class, p.getId());
	}
	
	public void update(User p) {
		User user = dao.find(User.class, p.getId());
		user.setEmail(p.getEmail());
		user.setName(p.getName());
		user.setOrganization(p.getOrganization());
		user.setPassword(p.getPassword());
		user.setRole(p.getRole());
		dao.update(user);
	}
	
	//p only need to have an id
	public void delete(User p) {
		dao.delete(dao.find(User.class, p.getId()));
	}
	
	/*
	 * 返回组织所有用户
	 */
	public List<User> getUsersByOrganization(Organization o) {
		return dao.list("select c from User c where c.organization.id="+o.getId());
	}
}
