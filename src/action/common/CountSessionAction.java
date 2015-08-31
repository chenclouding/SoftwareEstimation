package action.common;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import bean.CountSession;
import bean.Project;
import business.ProjectBusiness;
import business.CountSessionBusiness;

public class CountSessionAction  extends ActionSupport{
	private Project project;
	private CountSession countSession;
	private List<Project> projects;
	private List<CountSession> countSessions;
	private String actionName;
	private ProjectBusiness pb = new ProjectBusiness();
	private CountSessionBusiness sb = new CountSessionBusiness();
	Date dt=new Date();//获取当前时间
	
	public String add() {
		project = pb.find(project);
		countSession.setProject(project);
		countSession.setTime(dt);
		sb.create(countSession);
		return list();
	}
	
	public String list() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		project = pb.find(project);
		session.setAttribute("projectId", project.getId());
		projects = pb.getProjectsByUser(project.getUser());		
		setCountSessions(sb.getCountSessionsByProject(project));
		return "list";		
	}
	
	public String edit() {
		actionName = "countSession!edited";
		countSession = sb.find(countSession);
		return "edit";
	}
	
	public String edited() {
		sb.update(countSession);
		return list();
	}
	
	public String delete() {
		sb.delete(countSession);
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
	
}
