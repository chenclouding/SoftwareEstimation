package business;

import java.util.List;

import bean.DataGroup;
import bean.InterestObject;
import bean.Module;
import bean.Project;
import dao.BaseDAO;

public class DataGroupBusiness {
	private BaseDAO<DataGroup> dao = new BaseDAO<DataGroup>();
	
	public DataGroup find(DataGroup p) {
		return dao.find(DataGroup.class, p.getId());
	}
	
	public void create(DataGroup p) {
		dao.create(p);
	}
	
	public List<DataGroup> getDataGroupsByInterestObject(InterestObject u) {
		return dao.list("select c from DataGroup c where c.interestObject.id="+u.getId());
	}
	
	public void delete(DataGroup p) {
		dao.delete(dao.find(DataGroup.class, p.getId()));
	}
}
