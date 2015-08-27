package action.cocomo;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import bean.DevLang;
import bean.Organization;
import bean.Param;
import business.DevLangBusiness;
import business.OrganizationBusiness;

import com.opensymphony.xwork2.ActionSupport;

public class DevLangAction extends ActionSupport{

	private DevLang devLang;
	private List<DevLang> devLangs;
	private Organization organization;
	private DevLangBusiness dlb = new DevLangBusiness();
	private OrganizationBusiness ob = new OrganizationBusiness();
	
	/* 新增编程语言 */
	public String add() {
		devLangs = dlb.findDevLangByOrg(organization);
		for(DevLang dl:devLangs){
			if(dl.getName().equalsIgnoreCase(devLang.getName())){
				addActionError("该语言已存在！");
				return edit();
			}
		}
		organization = ob.getOrgById(organization.getId());
		devLang.setOrganization(organization);
		dlb.create(devLang);
		addActionMessage("新增成功！");
		return edit();
	}
	
	/* 删除编程语言信息 */
	public String delete() {
		dlb.delete(devLang);
		addActionMessage("删除成功！");
		return edit();
	}
	
	
	/* 获取需要修改的编程语言信息 */
	public String edit() {
		devLangs = dlb.findDevLangByOrg(organization);
		//为每个组织的编程语言设置初始默认值
		if(devLangs==null){
			organization = ob.getOrgById(organization.getId());
			HashMap<String, Integer> map = new HashMap<>();
		    map.put("C",128);
		    map.put("Pascal",91);
		    map.put("Perl",27);
		    map.put("C++",55);
		    map.put("Java",53);
	        Iterator it = map.keySet().iterator();  

	        while(it.hasNext()) {  
		        DevLang dl = new DevLang();
	            String key = (String)it.next();  
				dl.setOrganization(organization);
				dl.setName(key);
				dl.setLinesPerFP(map.get(key));
				dlb.create(dl);
	        }  
			devLangs = dlb.findDevLangByOrg(organization);
		}
		return "edit";
	}
	
	/*	 保存修改后的编程语言信息 */
	public String edited() {
		for(DevLang dl:devLangs){
			dlb.update(dl);
		}
		addActionMessage("设置成功！");
		return edit();
	}
	
	/* 获取组织内所有编程语言列表 */
	public String list() {
		organization = ob.getOrgById(organization.getId());
		devLangs = dlb.findDevLangByOrg(organization);
		return "list";
	}
	
	public DevLang getDevLang() {
		return devLang;
	}

	public void setDevLang(DevLang devLang) {
		this.devLang = devLang;
	}

	public List<DevLang> getDevLangs() {
		return devLangs;
	}

	public void setDevLangs(List<DevLang> devLangs) {
		this.devLangs = devLangs;
	}

	public Organization getOrganization() {
		return organization;
	}

	public void setOrganization(Organization organization) {
		this.organization = organization;
	}
}
