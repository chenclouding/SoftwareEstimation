package action.cosmic;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import bean.CountSession;
import bean.FunctionProcess;
import bean.Module;
import bean.Organization;
import bean.Project;
import business.FunctionProcessBusiness;
import business.ModuleBusiness;
import business.OrganizationBusiness;
import business.ProjectBusiness;
import business.CountSessionBusiness;

public class FunctionProcessAction  extends ActionSupport{
	private CountSession countSession;
	private Module module;
	private Project project;
	private Boolean isDetail;
	private FunctionProcess functionProcess;
	private List<Module> modules;
	private String actionName;
	private List<FunctionProcess> functionProcesses;
	private CountSessionBusiness sb = new CountSessionBusiness();
	private ModuleBusiness mb = new ModuleBusiness();
	private FunctionProcessBusiness fb = new FunctionProcessBusiness();

	public String add() {
		module = mb.find(module);
		countSession = sb.find(countSession);
		functionProcess.setCountSession(countSession);
		functionProcess.setModule(module);
		fb.create(functionProcess);
		return list();
	}
	
	public String list() {
		countSession = sb.find(countSession);
		project = countSession.getProject();
		modules = mb.getModulesByProject(project);
		for(Module m:modules){
			functionProcesses = fb.listAllByCountSessionFunctionModule(countSession, m);
			m.setFunctionProcesses(functionProcesses);
		}
			return "list";
	}
	
	public String edit() {
		functionProcess = fb.find(functionProcess);
		countSession = sb.find(functionProcess.getCountSession());
		module = mb.find(functionProcess.getModule());
		if(isDetail==true){
			actionName = "functionProcess!detail";
		}else{
			actionName = "functionProcess!edited";
		}
		return "edit";
	}
	
	public String edited() {
		fb.update(functionProcess);
		return list();
	}
	
	public String delete() {
		fb.delete(functionProcess);
		return list();
	}
	
	public String passParams(){
		module = mb.find(module);
		countSession = sb.find(countSession);
		return "params";
	}

	public CountSession getCountSession() {
		return countSession;
	}

	public void setCountSession(CountSession countSession) {
		this.countSession = countSession;
	}

	public Module getModule() {
		return module;
	}

	public void setModule(Module module) {
		this.module = module;
	}

	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	public FunctionProcess getFunctionProcess() {
		return functionProcess;
	}

	public void setFunctionProcess(FunctionProcess functionProcess) {
		this.functionProcess = functionProcess;
	}

	public List<Module> getModules() {
		return modules;
	}

	public void setModules(List<Module> modules) {
		this.modules = modules;
	}

	public List<FunctionProcess> getFunctionProcesses() {
		return functionProcesses;
	}

	public void setFunctionProcesses(List<FunctionProcess> functionProcesses) {
		this.functionProcesses = functionProcesses;
	}

	public Boolean getIsDetail() {
		return isDetail;
	}

	public void setIsDetail(Boolean isDetail) {
		this.isDetail = isDetail;
	}

	public String getActionName() {
		return actionName;
	}

	public void setActionName(String actionName) {
		this.actionName = actionName;
	}
	
}
