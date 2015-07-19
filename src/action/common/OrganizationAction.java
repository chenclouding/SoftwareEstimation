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

	/* 新增组织 */
	public String add() {
		new OrganizationBusiness().create(organization);
		return SUCCESS;
	}
	
	/*获取要修改的组织信息 */
	public String edit() {
		if (organization == null)
			organization = new OrganizationBusiness().find(organization);
		return INPUT;
	}
	
	/*删除组织信息*/
	public String delete() {
		new OrganizationBusiness().delete(organization);
		return INPUT;
	}
	
	/*获取组织列表 */
/*	public String list() {
		organizations = new OrganizationBusiness().getAllOrganization();
		if (organizations == null || organizations.isEmpty()){
			ActionContext.getContext().getSession().put("message", "目前无组织");
		}
		return "list";
	}*/



	 /*保存修改后的组织信息 
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
