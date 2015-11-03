package action.common;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import bean.CountSession;
import bean.Module;
import bean.Project;
import business.CountSessionBusiness;
import business.ModuleBusiness;
import business.ProjectBusiness;

public class ModuleAction extends ActionSupport{
	private Project project;
	private Module module;
	private List<Project> projects;
	private List<Module> modules;
	private String actionName;
	private Boolean isDetail;
	private CountSession countSession;
	private ProjectBusiness pb = new ProjectBusiness();
	private ModuleBusiness mb = new ModuleBusiness();
	private CountSessionBusiness sb = new CountSessionBusiness();

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
		modules = mb.getModulesByProject(project);
/*		//若在countSession界面调用list功能，返回dataFunctionList.jsp或transFunctionList.jsp
		if(actionName.equals("dataFunction")){
			return "dataFunction";
		}
		else if(actionName.equals("transFunction")){
			return "transFunction";
		}else{*/
		return "list";
/*		}*/
	}
	
	public String listModulesForFunctionProcess() {
		countSession=sb.find(countSession);
		modules = mb.getModulesByProject(countSession.getProject());
		return "listModulesForFP";
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

	public CountSession getCountSession() {
		return countSession;
	}

	public void setCountSession(CountSession countSession) {
		this.countSession = countSession;
	}
}
