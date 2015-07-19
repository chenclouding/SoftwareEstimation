package action.common;

import java.util.List;
import java.util.Map;

import bean.Organization;
import business.OrganizationBusiness;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class OrganizationAction extends ActionSupport {
	private Organization organization;
	private List<Organization> organizations;

	/* ������֯ */
	public String add() {
		new OrganizationBusiness().create(organization);
		return SUCCESS;
	}
	
	/*��ȡҪ�޸ĵ���֯��Ϣ */
	public String edit() {
		if (organization == null)
			organization = new OrganizationBusiness().find(organization);
		return INPUT;
	}
	
	/*ɾ����֯��Ϣ*/
	public String delete() {
		new OrganizationBusiness().delete(organization);
		return INPUT;
	}
	
	/*��ȡ��֯�б� */
/*	public String list() {
		organizations = new OrganizationBusiness().getAllOrganization();
		if (organizations == null || organizations.isEmpty()){
			ActionContext.getContext().getSession().put("message", "Ŀǰ����֯");
		}
		return "list";
	}*/



	 /*�����޸ĺ����֯��Ϣ 
	public String edited() {
		new OrganizationBusiness().update(organization);
		message = true;
		return SUCCESS;
	}

*/

	public Organization getOrganization() {
		return organization;
	}

	public void setOrganization(Organization organization) {
		this.organization = organization;
	}

	 public List<Organization> getOrganizations() {
		return organizations;
	}

	public void setOrganizations(List<Organization> organizations) {
		this.organizations = organizations;
	}

}
