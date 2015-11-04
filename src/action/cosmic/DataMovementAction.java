package action.cosmic;

import java.io.Console;
import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.ActionSupport;

import bean.CountSession;
import bean.DataGroup;
import bean.DataMovement;
import bean.FunctionProcess;
import bean.InterestObject;
import bean.Module;
import bean.Project;
import business.DataGroupBusiness;
import business.DataMovementBusiness;
import business.FunctionProcessBusiness;
import business.InterestObjectBusiness;
import business.ModuleBusiness;
import business.CountSessionBusiness;
import business.ProjectBusiness;

public class DataMovementAction  extends ActionSupport{

	private Module module;
	private Boolean isDetail;
	private String actionName;
	private Project project;
	private CountSession countSession;
	private DataMovement dataMovement;
	private List<FunctionProcess> functionProcesses;
	private List<DataMovement> dataMovements;
	private List<Module> modules;
	private FunctionProcess functionProcess;
	private InterestObject interestObject;
	private List<InterestObject> interestObjects;
	private String interestObjectStr;
	private DataGroup dataGroup;
	private List<DataGroup> dataGroups;
	private ModuleBusiness mb = new ModuleBusiness();
	private CountSessionBusiness sb = new CountSessionBusiness();
	private FunctionProcessBusiness fb = new FunctionProcessBusiness();
	private DataMovementBusiness dmb = new DataMovementBusiness();
	private InterestObjectBusiness iob = new InterestObjectBusiness();
	private DataGroupBusiness dgb = new DataGroupBusiness();

	public String add() {
		functionProcess=fb.find(functionProcess);
		dataGroup=dgb.find(dataGroup);
		interestObject=iob.find(interestObject);
		module=mb.find(module);
		dataMovement.setFunctionProcess(functionProcess);
		dataMovement.setDataGroup(dataGroup);
		dataMovement.setInterestObject(interestObject);
		dmb.create(dataMovement);
		return list();
	}
	
	//列出模块中所有的functionProcess以及dataMovement
	public String list() {
		countSession=sb.find(countSession);
		setModules(mb.getModulesByProject(countSession.getProject()));
		functionProcesses = fb.listAllByCountSessionFunctionModule(countSession, module);
		for(FunctionProcess fp:functionProcesses){
			dataMovements = dmb.listAllByFunctionProcess(fp);
			fp.setDataMovements(dataMovements);
		}
			return "list";
	}
	
	public String passParams(){
		module=mb.find(module);
		functionProcess = fb.find(functionProcess);
		countSession = sb.find(countSession);
		project = countSession.getProject();
		modules = mb.getModulesByProject(project);
		interestObjects=new ArrayList<>();
		StringBuilder strB=concatDataGroups(modules, interestObjects);
		interestObjectStr=strB.toString();
		return "params";
	}
	
	public StringBuilder concatDataGroups(List<Module> modules,List<InterestObject> interestObjects){
		for(Module m:modules){
			//获取每个模块下的interestObject
			List<InterestObject> interestObjectsInModule = 
					iob.listAllByCountSessionFunctionModule(countSession, m);
			//合并到interestObjects中
			for(InterestObject i:interestObjectsInModule){
				//获取interestObject对应的dataGroup
				dataGroups = dgb.getDataGroupsByInterestObject(i);
				i.setDataGroups(dataGroups);
				interestObjects.add(i);
			}
		}
		//拼接字符串，用于jquery
		StringBuilder sb=new StringBuilder();
		sb.append("[");
		for(InterestObject i:interestObjects){
			sb.append("{\"id\":"+i.getId()+",\"dataGroups\":[");
			for(DataGroup d:i.getDataGroups()){
				sb.append("{\"name\":\""+d.getName()+"\","+"\"id\":"+d.getId()+"},");
			}
			sb.deleteCharAt(sb.length()-1);//删除最后一个多余逗号
			sb.append("]},");
		}
		sb.deleteCharAt(sb.length()-1);//删除最后一个多余逗号
		sb.append("]");
		return sb;
	}
	
	public String edit() {
		dataMovement=dmb.find(dataMovement);
		functionProcess=dataMovement.getFunctionProcess();
		//用于修改时显示
		interestObject=dataMovement.getInterestObject();
		dataGroup=dataMovement.getDataGroup();
		countSession = sb.find(functionProcess.getCountSession());
		project = countSession.getProject();
		modules = mb.getModulesByProject(project);
		module = mb.find(functionProcess.getModule());
		interestObjects=new ArrayList<>();
		StringBuilder strB=concatDataGroups(modules, interestObjects);
		interestObjectStr=strB.toString();
		if(isDetail==true){
			setActionName("dataMovement!detail");
		}else{
			setActionName("dataMovement!edited");
		}
		return "edit";
	}
	
	public String edited() {
		dataGroup=dgb.find(dataGroup);
		interestObject=iob.find(interestObject);
		module=mb.find(module);
		dataMovement.setDataGroup(dataGroup);
		dataMovement.setInterestObject(interestObject);
		dmb.update(dataMovement);
		return list();
	}
	
	public String delete() {
		module=mb.find(module);
		dmb.delete(dataMovement);
		return list();
	}
	
	public Boolean getIsDetail() {
		return isDetail;
	}

	public void setIsDetail(Boolean isDetail) {
		this.isDetail = isDetail;
	}
	
	public Module getModule() {
		return module;
	}

	public void setModule(Module module) {
		this.module = module;
	}

	public CountSession getCountSession() {
		return countSession;
	}

	public void setCountSession(CountSession countSession) {
		this.countSession = countSession;
	}

	public List<FunctionProcess> getFunctionProcesses() {
		return functionProcesses;
	}

	public void setFunctionProcesses(List<FunctionProcess> functionProcesses) {
		this.functionProcesses = functionProcesses;
	}

	public List<DataMovement> getDataMovements() {
		return dataMovements;
	}

	public void setDataMovements(List<DataMovement> dataMovements) {
		this.dataMovements = dataMovements;
	}

	public List<Module> getModules() {
		return modules;
	}

	public void setModules(List<Module> modules) {
		this.modules = modules;
	}

	public FunctionProcess getFunctionProcess() {
		return functionProcess;
	}

	public void setFunctionProcess(FunctionProcess functionProcess) {
		this.functionProcess = functionProcess;
	}
	
	public List<InterestObject> getInterestObjects() {
		return interestObjects;
	}

	public void setInterestObjects(List<InterestObject> interestObjects) {
		this.interestObjects = interestObjects;
	}

	public List<DataGroup> getDataGroups() {
		return dataGroups;
	}

	public void setDataGroups(List<DataGroup> dataGroups) {
		this.dataGroups = dataGroups;
	}

	public String getInterestObjectStr() {
		return interestObjectStr;
	}

	public void setInterestObjectStr(String interestObjectStr) {
		this.interestObjectStr = interestObjectStr;
	}

	public DataMovement getDataMovement() {
		return dataMovement;
	}

	public void setDataMovement(DataMovement dataMovement) {
		this.dataMovement = dataMovement;
	}

	public DataGroup getDataGroup() {
		return dataGroup;
	}

	public void setDataGroup(DataGroup dataGroup) {
		this.dataGroup = dataGroup;
	}

	public String getActionName() {
		return actionName;
	}

	public void setActionName(String actionName) {
		this.actionName = actionName;
	}

	public InterestObject getInterestObject() {
		return interestObject;
	}

	public void setInterestObject(InterestObject interestObject) {
		this.interestObject = interestObject;
	}
}
