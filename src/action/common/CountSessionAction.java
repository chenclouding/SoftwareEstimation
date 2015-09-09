package action.common;

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
import bean.TransFunction;
import business.DataFunctionBusiness;
import business.ModuleBusiness;
import business.OrganizationBusiness;
import business.ProjectBusiness;
import business.CountSessionBusiness;
import business.TransFunctionBusiness;

public class CountSessionAction  extends ActionSupport{
	private Project project;
	private Organization organization;
	private CountSession countSession;
	private List<Project> projects;
	private List<Module> modules;
	private List<Organization> organizations;
	private List<CountSession> countSessions;
	private List<DataFunction> dataFunctions;
	private List<TransFunction> transFunctions;
	private String actionName;
	private Boolean isDetail;
	private ProjectBusiness pb = new ProjectBusiness();
	private OrganizationBusiness ob = new OrganizationBusiness();
	private CountSessionBusiness sb = new CountSessionBusiness();
	private DataFunctionBusiness db = new DataFunctionBusiness();
	private TransFunctionBusiness tb = new TransFunctionBusiness();
	private ModuleBusiness mb = new ModuleBusiness();
	Date dt=new Date();//获取当前时间
	
	public String add() {
		project = pb.find(project);
		countSession.setProject(project);
		countSession.setTime(dt);
		sb.create(countSession);
		return list();
	}
	
	public String list() {
		if(project!=null){
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpSession session = request.getSession();
			project = pb.find(project);
			session.setAttribute("projectId", project.getId());
			projects = pb.getProjectsByUser(project.getUser());		
			setCountSessions(sb.getCountSessionsByProject(project));
			return "list";	
		}
		else if(organization!=null){
			projects = pb.getProjectsByOrg(organization);	
			// 若直接取list，会有重复的项，for循环将sessions的值设为正确
			for(Project p:projects){
				List<CountSession> sessions = sb.getCountSessionsByProject(p);
				p.setCountSessions(sessions);
			}
			return "sessionList";
		}else{
			organizations = ob.getAllOrganization();
			return "sessionList";
		}	
	}
	
	public String edit() {
		countSession = sb.find(countSession);
		if(isDetail==true){
			actionName = "countSession!detail";
		}else{
			actionName = "countSession!edited";
		}
		return "edit";
	}
	
	/* 选择对应的估算场景开始估算 */
	public String select() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		session.setAttribute("countSessionId", countSession.getId());
		countSession = new CountSessionBusiness().find(countSession);
		session.setAttribute("methodType", countSession.getMethodType());
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
	
	public String listFunctions(){
		countSession = sb.find(countSession);
		project = countSession.getProject();
		modules = mb.getModulesByProject(project);
		int fpCountAll = 0;
		for(Module m:modules){
			dataFunctions = db.listAllByCountSessionFunctionModule(countSession, m);
			transFunctions = tb.listAllByCountSessionFunctionModule(countSession, m);
			m.setDataFunctions(dataFunctions);
			m.setTransFunctions(transFunctions);
			for(DataFunction d:dataFunctions){
				fpCountAll += d.getFpCount();
			}
			for(TransFunction t:transFunctions){
				fpCountAll += t.getFpCount();
			}
		}
		countSession.setUfpc(fpCountAll);
		return "functions";
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

	public List<CountSession> getCountSessions() {
		return countSessions;
	}

	public void setCountSessions(List<CountSession> countSessions) {
		this.countSessions = countSessions;
	}

	public CountSession getCountSession() {
		return countSession;
	}

	public void setCountSession(CountSession countSession) {
		this.countSession = countSession;
	}

	public Boolean getIsDetail() {
		return isDetail;
	}

	public void setIsDetail(Boolean isDetail) {
		this.isDetail = isDetail;
	}

	public Organization getOrganization() {
		return organization;
	}

	public void setOrganization(Organization organization) {
		this.organization = organization;
	}

	public List<Organization> getOrganizations() {
		return organizations;
	}

	public void setOrganizations(List<Organization> organizations) {
		this.organizations = organizations;
	}

	public List<Module> getModules() {
		return modules;
	}

	public void setModules(List<Module> modules) {
		this.modules = modules;
	}
	
}
