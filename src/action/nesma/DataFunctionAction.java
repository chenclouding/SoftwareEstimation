package action.nesma;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import bean.CountSession;
import bean.DataFunction;
import bean.Module;
import bean.Organization;
import bean.Project;
import business.DataFunctionBusiness;
import business.ModuleBusiness;
import business.OrganizationBusiness;
import business.ProjectBusiness;
import business.CountSessionBusiness;

public class DataFunctionAction  extends ActionSupport{
	private CountSession countSession;
	private Module module;
	private Project project;
	private Boolean isDetail;
	private DataFunction dataFunction;
	private List<Module> modules;
	private String actionName;
	private List<DataFunction> dataFunctions;
	private CountSessionBusiness sb = new CountSessionBusiness();
	private ModuleBusiness mb = new ModuleBusiness();
	private DataFunctionBusiness db = new DataFunctionBusiness();

	public String add() {
		module = mb.find(module);
		countSession = sb.find(countSession);
		dataFunction.setCountSession(countSession);
		dataFunction.setModule(module);
		db.create(dataFunction);
		return list();
	}
	
	public String list() {
		countSession = sb.find(countSession);
		project = countSession.getProject();
		modules = mb.getModulesByProject(project);
/*		int fpCountAll = 0;*/
		for(Module m:modules){
			dataFunctions = db.listAllByCountSessionFunctionModule(countSession, m);
			m.setDataFunctions(dataFunctions);
/*			if(listAll==true){
				for(DataFunction d:dataFunctions){
					fpCountAll += d.getFpCount();
				}
			}*/
		}
/*		if(listAll==true){
			countSession.setUfpc(fpCountAll);
			return SUCCESS;
		}else{*/
			return "list";
/*		}*/
	}
	
	public String edit() {
		dataFunction = db.find(dataFunction);
		countSession = sb.find(dataFunction.getCountSession());
		module = mb.find(dataFunction.getModule());
		if(isDetail==true){
			actionName = "dataFunction!detail";
		}else{
			actionName = "dataFunction!edited";
		}
		return "edit";
	}
	
	public String edited() {
		db.update(dataFunction);
		return list();
	}
	
	public String delete() {
		db.delete(dataFunction);
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

	public DataFunction getDataFunction() {
		return dataFunction;
	}

	public void setDataFunction(DataFunction dataFunction) {
		this.dataFunction = dataFunction;
	}

	public List<Module> getModules() {
		return modules;
	}

	public void setModules(List<Module> modules) {
		this.modules = modules;
	}

	public List<DataFunction> getDataFunctions() {
		return dataFunctions;
	}

	public void setDataFunctions(List<DataFunction> dataFunctions) {
		this.dataFunctions = dataFunctions;
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
