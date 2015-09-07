package business;

import java.util.List;

import bean.DevLang;
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
	
	public List<Project> getProjectsByOrg(Organization o){
		return dao.list("select c from Project c where c.user.id in (select u.id from User u where u.organization.id="+o.getId() +"and u.role=2)");
	}
	
	public Project find(Project p) {
		return dao.find(Project.class, p.getId());
	}
	
	public void update(Project p) {
		Project project = dao.find(Project.class, p.getId());
		project.setDescription(p.getDescription());
		project.setDevLang(p.getDevLang());
		project.setEndDate(p.getEndDate());
		project.setIde(p.getIde());
		project.setLifeCycleModel(p.getLifeCycleModel());
		project.setName(p.getName());
		project.setOs(p.getOs());
		project.setStartDate(p.getStartDate());
		project.setType(p.getType());
		project.setUsedDatabase(p.getUsedDatabase());
		dao.update(project);
	}
	
	public void delete(Project p) {
		dao.delete(dao.find(Project.class, p.getId()));
	}
}
