/*package business;

import java.util.List;

import bean.ApplicationComposition;
import bean.CountSession;
import bean.DataFunction;
import bean.Module;

import com.opensymphony.xwork2.ActionSupport;

import dao.BaseDAO;

public class EarlyDesignBusiness extends ActionSupport{
	private BaseDAO<EarlyDesignAndPostArchitecture> dao=new BaseDAO<EarlyDesignAndPostArchitecture>();
	public List<EarlyDesignAndPostArchitecture> getApplicationCompositionByCountSession(CountSession u) {
		return dao.list("select c from EarlyDesignAndPostArchitecture c where c.countSession.id="+u.getId());
	}
	
	public void create(EarlyDesignAndPostArchitecture p) {
		dao.create(p);
	}
	
	public void update(EarlyDesignAndPostArchitecture p) {
		ApplicationComposition applicationComposition = dao.find(ApplicationComposition.class, p.getId());
		applicationComposition.setNop(p.getNop());
		applicationComposition.setProd(p.getProd());
		applicationComposition.setMonthlyAvg(p.getMonthlyAvg());
		applicationComposition.setEffort(p.getEffort());
		applicationComposition.setCost(p.getCost());
		dao.update(applicationComposition);
	}
}
*/