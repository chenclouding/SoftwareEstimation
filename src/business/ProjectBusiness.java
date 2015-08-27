package business;

import java.util.List;

import bean.Organization;
import bean.Project;
import bean.User;
import dao.BaseDAO;

public class ProjectBusiness {
	private BaseDAO<Project> dao=new BaseDAO<Project>();
	
	public void create(Project p) {
		dao.create(p);
	}
	
	public List<Project> getProjectsByUser(User u) {
		return dao.list("select c from Project c where c.user.id="+u.getId());
	}
}
