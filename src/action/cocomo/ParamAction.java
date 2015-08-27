package action.cocomo;

import bean.Organization;
import bean.Param;
import business.OrganizationBusiness;
import business.ParamBusiness;

import com.opensymphony.xwork2.ActionSupport;

public class ParamAction extends ActionSupport{
	private ParamBusiness pb = new ParamBusiness();
	private OrganizationBusiness ob = new OrganizationBusiness();
	private Param param;
	private Organization organization;
	
	/* 获取需要修改的调整因子信息 */
	public String edit() {
		organization = ob.getOrgById(organization.getId());
		param = pb.findParamByOrg(organization);
		return "edit";
	}
	
	/* 保存修改后的调整因子信息 */
	public String edited() {
		organization = ob.getOrgById(organization.getId());
		Param p = pb.findParamByOrg(organization);
		if(p!=null){
			pb.update(p);
		}
		else{
			param.setOrganization(organization);
			pb.create(param);
		}
		addActionMessage("设置成功！");
		return edit();
	}
	
	public Organization getOrganization() {
		return organization;
	}

	public void setOrganization(Organization organization) {
		this.organization = organization;
	}

	public Param getParam() {
		return param;
	}

	public void setParam(Param param) {
		this.param = param;
	}
}
