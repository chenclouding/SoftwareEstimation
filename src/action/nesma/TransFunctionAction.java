package action.nesma;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import bean.CountSession;
import bean.TransFunction;
import bean.Module;
import bean.Organization;
import bean.Project;
import business.TransFunctionBusiness;
import business.ModuleBusiness;
import business.OrganizationBusiness;
import business.ProjectBusiness;
import business.CountSessionBusiness;

public class TransFunctionAction  extends ActionSupport{
	private CountSession countSession;
	private Module module;
	private Project project;
	private Boolean isDetail;
	private TransFunction transFunction;
	private List<Module> modules;
	private String actionName;
	private List<TransFunction> transFunctions;
	private CountSessionBusiness sb = new CountSessionBusiness();
	private ModuleBusiness mb = new ModuleBusiness();
	private TransFunctionBusiness tb = new TransFunctionBusiness();
	
	public String add() {
		module = mb.find(module);
		countSession = sb.find(countSession);
		transFunction.setCountSession(countSession);
		transFunction.setModule(module);
		tb.create(transFunction);
		return list();
	}
	
	public String list() {
		countSession = sb.find(countSession);
		project = countSession.getProject();
		modules = mb.getModulesByProject(project);
		for(Module m:modules){
			transFunctions = tb.listAllByCountSessionFunctionModule(countSession, m);
			m.setTransFunctions(transFunctions);
		}
			return "list";
	}
	
	public String edit() {
		transFunction = tb.find(transFunction);
		countSession = sb.find(transFunction.getCountSession());
		module = mb.find(transFunction.getModule());
		if(isDetail==true){
			actionName = "transFunction!detail";
		}else{
			actionName = "transFunction!edited";
		}
		return "edit";
	}
	
	public String edited() {
		tb.update(transFunction);
		return list();
	}
	
	public String delete() {
		tb.delete(transFunction);
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

	public TransFunction getTransFunction() {
		return transFunction;
	}

	public void setTransFunction(TransFunction transFunction) {
		this.transFunction = transFunction;
	}

	public List<Module> getModules() {
		return modules;
	}

	public void setModules(List<Module> modules) {
		this.modules = modules;
	}

	public List<TransFunction> getTransFunctions() {
		return transFunctions;
	}

	public void setTransFunctions(List<TransFunction> transFunctions) {
		this.transFunctions = transFunctions;
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

	
	/*	public String edit() {
		countSession = sb.find(countSession);
		if(isDetail==true){
			actionName = "countSession!detail";
		}else{
			actionName = "countSession!edited";
		}
		return "edit";
	}
	
	 选择对应的估算场景开始估算 
	public String select() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		session.setAttribute("countSessionId", countSession.getId());
		countSession = new CountSessionBusiness().find(countSession);
		session.setAttribute("methodType", countSession.getMethodType());
		session.setAttribute("countSessionName", countSession.getName());
		session.setAttribute("projectName", countSession.getProject().getName());
		if (countSession.getMethodType().equals("COSMIC")){
			return "cosmic";
		}else{
			return SUCCESS;
		}
	}
	
	public String edited() {
		sb.update(countSession);
		return list();
	}
	
	public String delete() {
		sb.delete(countSession);
		return list();
	}
	*/
}
