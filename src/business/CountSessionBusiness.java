package business;

import java.util.List;

import com.opensymphony.xwork2.ActionSupport;

import bean.Module;
import bean.Project;
import bean.CountSession;
import dao.BaseDAO;

public class CountSessionBusiness extends ActionSupport{
	private BaseDAO<CountSession> dao=new BaseDAO<CountSession>();
	
	public void create(CountSession p) {
		dao.create(p);
	}
	
	public List<CountSession> getCountSessionsByProject(Project u) {
		return dao.list("select c from CountSession c where c.project.id="+u.getId());
	}
	
	public CountSession find(CountSession p) {
		return dao.find(CountSession.class, p.getId());
	}
	
	public void update(CountSession p) {
		CountSession countSession = dao.find(CountSession.class, p.getId());
		countSession.setDescription(p.getDescription());
		countSession.setLifecyclePhase(p.getLifecyclePhase());
		countSession.setMethodType(p.getMethodType());
		countSession.setName(p.getName());
		countSession.setPurpose(p.getPurpose());
		countSession.setScope(p.getScope());
		countSession.setUfpc(p.getUfpc());
		dao.update(countSession);
	}
	
	public void delete(CountSession p) {
		dao.delete(dao.find(CountSession.class, p.getId()));
	}
}
