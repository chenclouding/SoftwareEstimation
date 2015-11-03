package business;

import java.util.List;

import bean.CountSession;
import bean.InterestObject;
import bean.Module;
import dao.BaseDAO;

public class InterestObjectBusiness {
	private BaseDAO<InterestObject> dao = new BaseDAO<InterestObject>();

	public List<InterestObject> listAllByCountSessionFunctionModule(CountSession countSession, Module module) {
		return dao.list("select c from InterestObject c where c.countSession.id=" + countSession.getId() + " and c.module.id="
				+ module.getId());
	}
	
	public void create(InterestObject p) {
		dao.create(p);
	}
	
	public InterestObject find(InterestObject p) {
		return dao.find(InterestObject.class, p.getId());
	}
	
	public void update(InterestObject p) {
		InterestObject interestObject = dao.find(InterestObject.class, p.getId());
		interestObject.setDescription(p.getDescription());
		interestObject.setName(p.getName());
		interestObject.setDataGroups(p.getDataGroups());
		dao.update(interestObject);
	}
	
	public void delete(InterestObject p) {
		dao.delete(dao.find(InterestObject.class, p.getId()));
	}
}
