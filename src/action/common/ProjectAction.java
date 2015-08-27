package action.common;

import java.util.List;

import com.opensymphony.xwork2.ActionSupport;

import bean.Project;
import bean.User;
import business.ProjectBusiness;
import business.UserBusiness;

public class ProjectAction extends ActionSupport{
	private User user;
	private Project project;
	private List<Project> projects;
	private UserBusiness ub = new UserBusiness();
	private ProjectBusiness pb = new ProjectBusiness();
	public String add() {
		user = ub.find(user);
		project.setUser(user);
		pb.create(project);
		return list();
	}
	
	public String list() {
		projects = pb.getProjectsByUser(user);
		return "list";		
	}
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	public List<Project> getProjects() {
		return projects;
	}

	public void setProjects(List<Project> projects) {
		this.projects = projects;
	}
}
