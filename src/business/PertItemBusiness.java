package business;

import java.util.List;

import bean.ApplicationComposition;
import bean.CountSession;
import bean.Pert;
import bean.PertItem;
import dao.BaseDAO;

public class PertItemBusiness extends BaseDAO<PertItem>{
	private BaseDAO<PertItem> dao=new BaseDAO<PertItem>();
	public List<PertItem> getPertItemsByPert(Pert u) {
		return dao.list("select c from PertItem c where c.pert.id="+u.getId());
	}
	
	public void create(PertItem p) {
		dao.create(p);
	}
	
	public void update(PertItem p) {
		PertItem pertItem = dao.find(PertItem.class, p.getId());
		pertItem.setMostLikely(p.getMostLikely());
		pertItem.setOptimistic(p.getOptimistic());
		pertItem.setPessimistic(p.getPessimistic());
		pertItem.setWeight(p.getWeight());
		dao.update(pertItem);
	}
}
