package business;

import java.util.List;

import action.cosmic.FunctionProcessAction;
import bean.CountSession;
import bean.DataMovement;
import bean.FunctionProcess;
import bean.Module;
import dao.BaseDAO;

public class DataMovementBusiness {
	private BaseDAO<DataMovement> dao = new BaseDAO<DataMovement>();

	public List<DataMovement> listAllByFunctionProcess(FunctionProcess functionProcess) {
		return dao.list("select c from DataMovement c where c.functionProcess.id=" + functionProcess.getId());
	}
	
	public void create(DataMovement p) {
		dao.create(p);
	}
	
		public DataMovement find(DataMovement p) {
		return dao.find(DataMovement.class, p.getId());
	}
	
	public void update(DataMovement p) {
		DataMovement dataMovement = dao.find(DataMovement.class, p.getId());
		dataMovement.setName(p.getName());
		dataMovement.setType(p.getType());
		dataMovement.setInterestObject(p.getInterestObject());
		dataMovement.setDataGroup(p.getDataGroup());
		dao.update(dataMovement);
	}
	
	public void delete(DataMovement p) {
		dao.delete(dao.find(DataMovement.class, p.getId()));
	}
}
