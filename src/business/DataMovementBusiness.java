package business;

import java.util.List;

import action.cosmic.FunctionProcessAction;
import bean.CountSession;
import bean.DataMovement;
import bean.FunctionProcess;
import bean.InterestObject;
import bean.Module;
import dao.BaseDAO;

public class DataMovementBusiness {
	private BaseDAO<DataMovement> dao = new BaseDAO<DataMovement>();

	public List<DataMovement> listAllByFunctionProcess(FunctionProcess functionProcess) {
		return dao.list("select c from DataMovement c where c.functionProcess.id=" + functionProcess.getId());
	}
	
/*	public void create(InterestObject p) {
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
	}*/
}
