package business;

import java.util.List;

import bean.Organization;
import bean.Param;
import bean.User;
import dao.BaseDAO;

public class ParamBusiness {
	private BaseDAO<Param> dao=new BaseDAO<Param>();
	
	public void update(Param p) {
		Param param = dao.find(Param.class, p.getId());
		param.setSf_PREC(p.getSf_PREC());
		param.setSf_FLEX(p.getSf_FLEX());
		param.setSf_RESL(p.getSf_RESL());
		param.setSf_TEAM(p.getSf_TEAM());
		param.setSf_PMAT(p.getSf_PMAT());
		
		param.setCd_ACAP(p.getCd_ACAP());
		param.setCd_AEXP(p.getCd_AEXP());
		param.setCd_CPLX(p.getCd_CPLX());
		param.setCd_DATA(p.getCd_DATA());
		param.setCd_DOCU(p.getCd_DOCU());
		param.setCd_LTEX(p.getCd_LTEX());
		param.setCd_PCAP(p.getCd_PCAP());
		param.setCd_PCON(p.getCd_PCON());
		param.setCd_PLEX(p.getCd_PLEX());
		param.setCd_PVOL(p.getCd_PVOL());
		param.setCd_RELY(p.getCd_RELY());
		param.setCd_RUSE(p.getCd_RUSE());
		param.setCd_SCED(p.getCd_SCED());
		param.setCd_SITE(p.getCd_SITE());
		param.setCd_STOR(p.getCd_STOR());
		param.setCd_TIME(p.getCd_TIME());
		param.setCd_TOOL(p.getCd_TOOL());
		dao.update(param);

	}
	
	public void create(Param p) {
		dao.create(p);
	}
	
	public Param findParamByOrg(Organization o) {
		List<Param> params = dao.list("select c from Param c where c.organization.id="+o.getId());
		if(params==null||params.isEmpty())
			return null;
		else
			return params.get(0);	
	}
}
