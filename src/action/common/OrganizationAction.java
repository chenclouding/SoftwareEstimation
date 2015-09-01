package action.common;

import java.util.List;
import java.util.Map;

import bean.Organization;
import bean.User;
import business.OrganizationBusiness;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class OrganizationAction extends ActionSupport {
	private Organization organization;
	private List<Organization> organizations;
	private OrganizationBusiness ob = new OrganizationBusiness();
	private String actionName;
	private Boolean isDetail;
	
	/* 新增组织 */
	public String add() {
		ob.create(organization);
		return SUCCESS;
	}
	
	/* 获取需要修改的组织信息 */
	public String edit() {
		organization = ob.find(organization);
		if(isDetail==true){
			actionName = "organization!detail";
		}else{
		actionName = "organization!edited";
		}
		return "edit";
	}
	
/*	 获取需要组织信息 
	public String detail() {
		actionName = "organization!detail";
		organization = ob.find(organization);
		return "edit";
	}*/
	
	/* 删除组织信息 */
	public String delete() {
		ob.delete(organization);
		return list();
	}
	
	/* 获取组织列表 */
	public String list() {
		organizations = ob.getAllOrganization();
		return INPUT;
	}
	
	/* 获取组织列表 */
	public String listOrg() {
		actionName = "user!add";
		organizations = ob.getAllOrganization();
		return "list";
	}

	  /* 保存修改后的组织信息 */
	public String edited() {
		ob.update(organization);
		return list();
	}

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

	public String getActionName() {
		return actionName;
	}

	public void setActionName(String actionName) {
		this.actionName = actionName;
	}

	public Boolean getIsDetail() {
		return isDetail;
	}

	public void setIsDetail(Boolean isDetail) {
		this.isDetail = isDetail;
	}

}
