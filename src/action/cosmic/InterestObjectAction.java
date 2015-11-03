package action.cosmic;

import java.util.List;

import com.opensymphony.xwork2.ActionSupport;

import bean.CountSession;
import bean.DataGroup;
import bean.InterestObject;
import bean.Module;
import bean.Project;
import business.DataGroupBusiness;
import business.InterestObjectBusiness;
import business.ModuleBusiness;
import business.CountSessionBusiness;

public class InterestObjectAction  extends ActionSupport{

	private Module module;
	private List<Module> modules;
	private Project project;
	private Boolean isDetail;
	private String actionName;
	private CountSession countSession;
	private InterestObject interestObject;	
	private List<DataGroup> dataGroups;
	private List<InterestObject> interestObjects;
	private ModuleBusiness mb = new ModuleBusiness();
	private InterestObjectBusiness iob = new InterestObjectBusiness();
	private CountSessionBusiness sb = new CountSessionBusiness();
	private DataGroupBusiness dgb = new DataGroupBusiness();

	public String add() {
		module = mb.find(module);
		countSession = sb.find(countSession);
		interestObject.setCountSession(countSession);
		interestObject.setModule(module);
		for(DataGroup d:interestObject.getDataGroups()){
			d.setInterestObject(interestObject);
		}
		iob.create(interestObject);
		return list();
	}
	
	public String list() {
		countSession = sb.find(countSession);
		project = countSession.getProject();
		modules = mb.getModulesByProject(project);
		for(Module m:modules){
			interestObjects = iob.listAllByCountSessionFunctionModule(countSession, m);
			m.setInterestObjects(interestObjects);
		}
			return "list";
	}
	
	public String passParams(){
		module = mb.find(module);
		countSession = sb.find(countSession);
		return "params";
	}
	
	public String edit() {
		interestObject = iob.find(interestObject);
		countSession = sb.find(interestObject.getCountSession());
		module = mb.find(interestObject.getModule());
		dataGroups=dgb.getDataGroupsByInterestObject(interestObject);
		if(isDetail==true){
			actionName = "interestObject!detail";
		}else{
			actionName = "interestObject!edited";
		}
		return "edit";
	}
	
	public String edited() {
		//若修改，先删除原来包含的DataGroup
		dataGroups=dgb.getDataGroupsByInterestObject(interestObject);
		for(DataGroup d:dataGroups){
			dgb.delete(d);
		}
		for(DataGroup d:interestObject.getDataGroups()){
			if(d!=null){
				d.setInterestObject(interestObject);
			}
		}
		iob.update(interestObject);
		return list();
	}
	
	public String delete() {
		iob.delete(interestObject);
		return list();
	}
	
	public List<Module> getModules() {
		return modules;
	}

	public void setModules(List<Module> modules) {
		this.modules = modules;
	}

	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	public CountSession getCountSession() {
		return countSession;
	}

	public void setCountSession(CountSession countSession) {
		this.countSession = countSession;
	}

	public List<InterestObject> getInterestObjects() {
		return interestObjects;
	}

	public void setInterestObjects(List<InterestObject> interestObjects) {
		this.interestObjects = interestObjects;
	}

	public Module getModule() {
		return module;
	}

	public void setModule(Module module) {
		this.module = module;
	}

	public InterestObject getInterestObject() {
		return interestObject;
	}

	public void setInterestObject(InterestObject interestObject) {
		this.interestObject = interestObject;
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

	public List<DataGroup> getDataGroups() {
		return dataGroups;
	}

	public void setDataGroups(List<DataGroup> dataGroups) {
		this.dataGroups = dataGroups;
	}
	
}
