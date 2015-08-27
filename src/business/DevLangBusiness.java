package business;

import java.util.List;
import bean.DevLang;
import bean.Organization;
import bean.Param;
import bean.User;
import dao.BaseDAO;

public class DevLangBusiness {
	private BaseDAO<DevLang> dao=new BaseDAO<DevLang>();
	
	public void create(DevLang p) {
		dao.create(p);
	}
	
	public void update(DevLang p) {
		DevLang devLang = dao.find(DevLang.class, p.getId());
		devLang.setLinesPerFP(p.getLinesPerFP());
		dao.update(devLang);
	}
	
	public List<DevLang> findDevLangByOrg(Organization o) {
		List<DevLang> devLangs = dao.list("select c from DevLang c where c.organization.id="+o.getId());
		if(devLangs==null||devLangs.isEmpty())
			return null;
		else
			return devLangs;	
	}
	
	public void delete(DevLang p) {
		dao.delete(dao.find(DevLang.class, p.getId()));
	}
}
