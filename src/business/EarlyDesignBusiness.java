package business;

import java.util.List;

import bean.ApplicationComposition;
import bean.CountSession;
import bean.DataFunction;
import bean.EarlyDesignAndPostArchitecture;
import bean.Module;

import com.opensymphony.xwork2.ActionSupport;

import dao.BaseDAO;

public class EarlyDesignBusiness extends ActionSupport{
	private BaseDAO<EarlyDesignAndPostArchitecture> dao=new BaseDAO<EarlyDesignAndPostArchitecture>();
	public List<EarlyDesignAndPostArchitecture> getEarlyDesignByCountSession(CountSession u) {
		return dao.list("select c from EarlyDesignAndPostArchitecture c where c.countSession.id="+u.getId()+" and c.type='Early Design'");
	}
	
	public void create(EarlyDesignAndPostArchitecture p) {
		dao.create(p);
	}

		public void update(EarlyDesignAndPostArchitecture p) {
		EarlyDesignAndPostArchitecture e = dao.find(EarlyDesignAndPostArchitecture.class, p.getId());
		e.setLanguage(p.getLanguage());
		e.setLinesPerFP(p.getLinesPerFP());
		e.setDuration(p.getDuration());
		e.setEffort(p.getEffort());
		e.setCost(p.getCost());
		e.setKSLOC(p.getKSLOC());
		dao.update(e);
	}
}
