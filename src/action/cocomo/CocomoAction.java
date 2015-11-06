package action.cocomo;

import java.text.DecimalFormat;
import java.util.List;

import javax.crypto.interfaces.PBEKey;

import bean.ApplicationComposition;
import bean.CountSession;
import bean.EarlyDesignAndPostArchitecture;
import bean.Organization;
import bean.Param;
import bean.Project;
import bean.User;
import business.ApplicationCompBusiness;
import business.CountSessionBusiness;
import business.ParamBusiness;

public class CocomoAction {
	private ApplicationComposition applicationComposition;
	private List<ApplicationComposition> applicationCompositions;
	private CountSession countSession;
	private EarlyDesignAndPostArchitecture earlyDesAndPostArch;
	private List<EarlyDesignAndPostArchitecture> earlyDesAndPostArchs;
	private ApplicationCompBusiness ab=new ApplicationCompBusiness();
	private CountSessionBusiness sb=new CountSessionBusiness();
	private ParamBusiness pb=new ParamBusiness();
	public String editAppComp(){
		//查找结果为0条或1条
		applicationCompositions=ab.getApplicationCompositionByCountSession(countSession);
		//第一次估算,使用默认组织的薪资水平
		if(applicationCompositions.size()==0){
			countSession =sb.find(countSession);
			Project project=countSession.getProject();
			User user=project.getUser();
			Organization organization=user.getOrganization();
			Param param=pb.findParamByOrg(organization);
			applicationComposition=new ApplicationComposition();
			applicationComposition.setMonthlyAvg(param.getMonthlyAvg());
		}else{
			applicationComposition=applicationCompositions.get(0);
		}
		return "applicationComp";
	}
	
	//计算应用组装子模型的工作量、工期和成本
	//PM=(NOP )/PROD,cost=pm*monthlyAvg
	public String editedAppCom(){
		//第一次估算
		DecimalFormat df = new DecimalFormat("0.00");  
		double pm=(double)applicationComposition.getNop()*1.0/applicationComposition.getProd();
		pm=Double.parseDouble(df.format(pm));
		applicationComposition.setEffort(pm);
		applicationComposition.setCost(Double.parseDouble(
				df.format(pm*applicationComposition.getMonthlyAvg())));
		countSession=sb.find(countSession);
		applicationComposition.setCountSession(countSession);
		if(applicationComposition.getId()==null){
			ab.create(applicationComposition);
		}else{
			ab.update(applicationComposition);
		}
		return editAppComp();
	}
	
/*	public String editEarlyDesign(){
		//查找结果为0条或1条
		earlyDesAndPostArchs=ab.getApplicationCompositionByCountSession(countSession);
		//第一次估算,使用默认组织的薪资水平
		if(applicationCompositions.size()==0){
			countSession =sb.find(countSession);
			Project project=countSession.getProject();
			User user=project.getUser();
			Organization organization=user.getOrganization();
			Param param=pb.findParamByOrg(organization);
			applicationComposition=new ApplicationComposition();
			applicationComposition.setMonthlyAvg(param.getMonthlyAvg());
		}else{
			applicationComposition=applicationCompositions.get(0);
		}
		return "applicationComp";
	}*/
	
	public ApplicationComposition getAppCom() {
		return applicationComposition;
	}
	public void setAppCom(ApplicationComposition applicationComposition) {
		this.applicationComposition = applicationComposition;
	}
	public CountSession getCountSession() {
		return countSession;
	}
	public void setCountSession(CountSession countSession) {
		this.countSession = countSession;
	}

	public ApplicationComposition getApplicationComposition() {
		return applicationComposition;
	}

	public void setApplicationComposition(
			ApplicationComposition applicationComposition) {
		this.applicationComposition = applicationComposition;
	}

	public EarlyDesignAndPostArchitecture getEarlyDesAndPostArch() {
		return earlyDesAndPostArch;
	}

	public void setEarlyDesAndPostArch(EarlyDesignAndPostArchitecture earlyDesAndPostArch) {
		this.earlyDesAndPostArch = earlyDesAndPostArch;
	}
}
