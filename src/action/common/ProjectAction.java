package action.common;

import java.util.List;

import com.opensymphony.xwork2.ActionSupport;

import bean.DevLang;
import bean.Organization;
import bean.Project;
import bean.User;
import business.DevLangBusiness;
import business.ProjectBusiness;
import business.UserBusiness;

public class ProjectAction extends ActionSupport{
	private User user;
	private Project project;
	private List<Project> projects;
	private String actionName;
	private List<DevLang> devLangs;
	private Organization organization;
	private DevLangBusiness dlb = new DevLangBusiness();
	private UserBusiness ub = new UserBusiness();
	private ProjectBusiness pb = new ProjectBusiness();
	private Boolean isDetail;
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
	
	public String listProjects() {
		projects = pb.getProjectsByUser(user);
		return SUCCESS;		
	}
	
	public String listProjectsForSession() {
		projects = pb.getProjectsByUser(user);
		return INPUT;		
	}
	
	public String edit() {
		project = pb.find(project);
		if(isDetail==true){
			actionName = "project!detail";
		}else{
			actionName = "project!edited";
		}
		organization = project.getUser().getOrganization();
		devLangs = dlb.findDevLangByOrg(organization);
		return "edit";
	}
	
	public String edited() {
		pb.update(project);
		return list();
	}
	
	public String delete() {
		pb.delete(project);
		return list();
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

	public String getActionName() {
		return actionName;
	}

	public void setActionName(String actionName) {
		this.actionName = actionName;
	}

	public List<DevLang> getDevLangs() {
		return devLangs;
	}

	public void setDevLangs(List<DevLang> devLangs) {
		this.devLangs = devLangs;
	}

	public Boolean getIsDetail() {
		return isDetail;
	}

	public void setIsDetail(Boolean isDetail) {
		this.isDetail = isDetail;
	}
}
