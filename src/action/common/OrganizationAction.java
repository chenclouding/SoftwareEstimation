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
	private OrganizationBusiness ob = new OrganizationBusiness();
	
	/* ������֯ */
	public String add() {
		ob.create(organization);
		return SUCCESS;
	}
	
	/*��ȡҪ�޸ĵ���֯��Ϣ */
	public String edit() {
		if (organization == null)
			organization = ob.find(organization);
		return INPUT;
	}
	
	/*ɾ����֯��Ϣ*/
	public String delete() {
		ob.delete(organization);
		return INPUT;
	}
	
	/*��ȡ��֯�б� */
	public String list() {
		organizations = ob.getAllOrganization();
		return SUCCESS;
	}



	 /*�����޸ĺ����֯��Ϣ 
	public String edited() {
		ob.update(organization);
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
