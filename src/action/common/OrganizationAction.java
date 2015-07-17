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

	/* 新增组织 */
	public String add() {
		new OrganizationBusiness().create(organization);
		return SUCCESS;
	}
	
	/*获取组织列表 */
/*	public String list() {
		organizations = new OrganizationBusiness().getAllOrganization();
		if (organizations == null || organizations.isEmpty()){
			ActionContext.getContext().getSession().put("message", "目前无组织");
		}
		return "list";
	}*/

/*	 获取要修改的组织信息 
	public String edit() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		if (organization == null)
			organization = (Organization) session.getAttribute("organization");
		organization = new OrganizationBusiness().find(organization);
		return SUCCESS;
	}

	 保存修改后的组织信息 
	public String edited() {
		new OrganizationBusiness().update(organization);
		message = true;
		return SUCCESS;
	}

	 删除组织信息 
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
