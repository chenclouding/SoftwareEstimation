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
	private DataFunction dataFunction;
	private List<Module> modules;
	private List<DataFunction> dataFunctions;
	private CountSessionBusiness sb = new CountSessionBusiness();
	private ModuleBusiness mb = new ModuleBusiness();
	private DataFunctionBusiness db = new DataFunctionBusiness();
	/*	private Organization organization;

	private List<Project> projects;
	private List<Organization> organizations;
	private List<CountSession> countSessions;
	private String actionName;
	private Boolean isDetail;
	private ProjectBusiness pb = new ProjectBusiness();
	private OrganizationBusiness ob = new OrganizationBusiness();

	Date dt=new Date();//获取当前时间
*/	
	public String add() {
		module = mb.find(module);
		countSession = sb.find(countSession);
		dataFunction.setCountSession(countSession);
		dataFunction.setModule(module);
		if(countSession.getMethodType().equals("NESMA-预估型")){
			if(dataFunction.getType()=="ILF"){
			dataFunction.setFpCount(35);
			}else{
				dataFunction.setFpCount(15);
			}
		}else if(countSession.getMethodType().equals("NESMA-估计型")){
			if(dataFunction.getType()=="ILF"){
			dataFunction.setFpCount(7);
			}else{
				dataFunction.setFpCount(5);
			}
		}else{
			int detCount = dataFunction.getDetCount();
			int retCount = dataFunction.getRetCount();
			if((detCount>=1&&detCount<=19 && retCount==1)||
			   (detCount>=20&&detCount<=50 && retCount==1)||
			   (detCount>=1&&detCount<=19 && retCount>=2&& retCount<=5)){
				if(dataFunction.getType()=="ILF"){
					dataFunction.setFpCount(7);//ILF复杂度为低
				}else{
					dataFunction.setFpCount(5);//EIF复杂度为低
				}			
			}else if((detCount>=1&&detCount<=19 && retCount>=6)||
					(detCount>=20&&detCount<=50 && retCount>=2 && retCount<=5)||
					(detCount>=51 && retCount==1)){
				if(dataFunction.getType()=="ILF"){
					dataFunction.setFpCount(10);//ILF复杂度为中等
				}else{
					dataFunction.setFpCount(7);//EIF复杂度为中等
				}	
			}else if((detCount>=51 && retCount>=2 && retCount<=5)||
					(detCount>=20 && retCount>=6)){
				if(dataFunction.getType()=="ILF"){
					dataFunction.setFpCount(15);//ILF复杂度为高
				}else{
					dataFunction.setFpCount(10);//EIF复杂度为高
				}	
			}
		}
		db.create(dataFunction);
		return list();
	}
	
	public String list() {
		countSession = sb.find(countSession);
		project = countSession.getProject();
		modules = mb.getModulesByProject(project);
		for(Module m:modules){
			dataFunctions = db.listAllByCountSessionFunctionModule(countSession, m);
			m.setDataFunctions(dataFunctions);
		}
		return "list";
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
