package action.common;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import bean.DevLang;
import bean.Module;
import bean.Organization;
import bean.Project;
import bean.User;
import business.DevLangBusiness;
import business.ModuleBusiness;
import business.ProjectBusiness;
import business.UserBusiness;

public class ModuleAction extends ActionSupport{
	private Project project;
	private Module module;
	private List<Project> projects;
	private List<Module> modules;
	private String actionName;
	private Boolean isDetail;
	private ProjectBusiness pb = new ProjectBusiness();
	private ModuleBusiness mb = new ModuleBusiness();

	public String add() {
		project = pb.find(project);
		module.setProject(project);
		mb.create(module);
		return list();
	}
	
	public String list() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		project = pb.find(project);
		session.setAttribute("projectId", project.getId());
		projects = pb.getProjectsByUser(project.getUser());		
		setModules(mb.getModulesByProject(project));
		return "list";		
	}
	
	public String edit() {
		module = mb.find(module);
		if(isDetail==true){
			actionName = "module!detail";
		}else{
			actionName = "module!edited";
		}
		return "edit";
	}
	
	public String edited() {
		mb.update(module);
		return list();
	}
	
	public String delete() {
		mb.delete(module);
		return list();
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

	public List<Module> getModules() {
		return modules;
	}

	public void setModules(List<Module> modules) {
		this.modules = modules;
	}
	
	public Module getModule() {
		return module;
	}

	public void setModule(Module module) {
		this.module = module;
	}

	public Boolean getIsDetail() {
		return isDetail;
	}

	public void setIsDetail(Boolean isDetail) {
		this.isDetail = isDetail;
	}
}
