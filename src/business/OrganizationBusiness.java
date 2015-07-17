package business;

import java.util.List;

import dao.BaseDAO;
import bean.Organization;
public class OrganizationBusiness {
	private BaseDAO<Organization> dao=new BaseDAO<Organization>();
	
	public void create(Organization p) {
		dao.create(p);
	}
	
	public List<Organization> getAllOrganization(){
		return dao.list("from Organization");
	}
	
	public Organization getOrgById(int orgId){
		return dao.find(Organization.class, orgId);
	}
}
