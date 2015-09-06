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
	
	public User findUserByEmailAndPassword(String email, String password) {
		List<User> users=dao.list("select c from User c where c.email='"+email+"' and c.password='"+password+"'");
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
		//update user role only
		if(p.getName()==null){
			user.setRole(p.getRole());
		}else{
			user.setEmail(p.getEmail());
			user.setName(p.getName());
			user.setPassword(p.getPassword());
			user.setOrganization(p.getOrganization());
		}
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
