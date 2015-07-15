package business;

import bean.User;
import dao.BaseDAO;

public class UserBusiness {
	private BaseDAO<User> dao=new BaseDAO<User>();
	
	public void create(User p) {
		dao.create(p);
	}
}
