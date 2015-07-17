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
	private String message;

	/* ������֯ */
	public String add() {
		new OrganizationBusiness().create(organization);
		return SUCCESS;
	}
	
	/*��ȡ��֯�б� */
/*	public String list() {
		organizations = new OrganizationBusiness().getAllOrganization();
		if (organizations == null || organizations.isEmpty()){
			ActionContext.getContext().getSession().put("message", "Ŀǰ����֯");
		}
		return "list";
	}*/

/*	 ��ȡҪ�޸ĵ���֯��Ϣ 
	public String edit() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		if (organization == null)
			organization = (Organization) session.getAttribute("organization");
		organization = new OrganizationBusiness().find(organization);
		return SUCCESS;
	}

	 �����޸ĺ����֯��Ϣ 
	public String edited() {
		new OrganizationBusiness().update(organization);
		message = true;
		return SUCCESS;
	}

	 ɾ����֯��Ϣ 
	public String del() {
		new OrganizationBusiness().delete(organization);
		return list();
	}*/

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

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

}
