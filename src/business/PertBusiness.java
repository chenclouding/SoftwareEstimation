package business;

import java.util.List;

import bean.ApplicationComposition;
import bean.CountSession;
import bean.Pert;
import dao.BaseDAO;

public class PertBusiness extends BaseDAO<Pert>{
	private BaseDAO<Pert> dao=new BaseDAO<Pert>();
	public List<Pert> getPertByCountSession(CountSession u) {
		return dao.list("select c from Pert c where c.countSession.id="+u.getId());
	}
	
	public void create(Pert p) {
		dao.create(p);
	}
	
	public void update(Pert p) {
		Pert pert = dao.find(Pert.class, p.getId());
		pert.setEstimateObject(p.getEstimateObject());
		pert.setPointEstimate(p.getPointEstimate());
		pert.setIntervalEstimateMin(p.getIntervalEstimateMin());
		pert.setIntervalEstimateMax(p.getIntervalEstimateMax());
		dao.update(pert);
	}
}
