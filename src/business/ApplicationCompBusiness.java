package business;

import java.util.List;

import bean.ApplicationComposition;
import bean.CountSession;
import bean.DataFunction;
import bean.Module;

import com.opensymphony.xwork2.ActionSupport;

import dao.BaseDAO;

public class ApplicationCompBusiness extends ActionSupport{
	private BaseDAO<ApplicationComposition> dao=new BaseDAO<ApplicationComposition>();
	public List<ApplicationComposition> getApplicationCompositionByCountSession(CountSession u) {
		return dao.list("select c from ApplicationComposition c where c.countSession.id="+u.getId());
	}
	
	public void create(ApplicationComposition p) {
		dao.create(p);
	}
	
	public void update(ApplicationComposition p) {
		ApplicationComposition applicationComposition = dao.find(ApplicationComposition.class, p.getId());
		applicationComposition.setNop(p.getNop());
		applicationComposition.setProd(p.getProd());
		applicationComposition.setMonthlyAvg(p.getMonthlyAvg());
		applicationComposition.setEffort(p.getEffort());
		applicationComposition.setCost(p.getCost());
		dao.update(applicationComposition);
	}
}
