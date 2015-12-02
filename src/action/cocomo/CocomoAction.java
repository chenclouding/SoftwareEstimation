package action.cocomo;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.List;

import javax.crypto.interfaces.PBEKey;

import org.hibernate.dialect.DB2390Dialect;

import bean.ApplicationComposition;
import bean.CountSession;
import bean.DataGroup;
import bean.DevLang;
import bean.EarlyDesignAndPostArchitecture;
import bean.InterestObject;
import bean.Module;
import bean.Organization;
import bean.Param;
import bean.Project;
import bean.User;
import business.ApplicationCompBusiness;
import business.CountSessionBusiness;
import business.DevLangBusiness;
import business.ParamBusiness;
import business.EarlyDesignBusiness;
import business.PostArchitectureBusiness;

public class CocomoAction {
	private ApplicationComposition applicationComposition;
	private List<ApplicationComposition> applicationCompositions;
	private CountSession countSession;
	private Param param;
	private Double CFP_to_FP;
	private List<DevLang> devLangs;
	private String devLangsString;
	private EarlyDesignAndPostArchitecture earlyDesAndPostArch;
	private EarlyDesignAndPostArchitecture earlyDesign;
	private EarlyDesignAndPostArchitecture postArchitecture;
	private List<EarlyDesignAndPostArchitecture> earlyDesAndPostArchs;
	private ApplicationCompBusiness ab = new ApplicationCompBusiness();
	private EarlyDesignBusiness eb = new EarlyDesignBusiness();
	private PostArchitectureBusiness pab = new PostArchitectureBusiness();
	private CountSessionBusiness sb = new CountSessionBusiness();
	private ParamBusiness pb = new ParamBusiness();
	private DevLangBusiness db = new DevLangBusiness();
	double scaleFactors[]=new double[5];
	double costDrivers[]=new double[17];
	double ed_costDrivers[]=new double[7];
	
	public String getAllEstimations(){
		applicationCompositions=ab
				.getApplicationCompositionByCountSession(countSession);
		if(applicationCompositions.size()!=0)//获取application composition
			applicationComposition=applicationCompositions.get(0);
		
		earlyDesAndPostArchs = eb.getEarlyDesignByCountSession(countSession);
		if(earlyDesAndPostArchs.size()!=0)//获取early design
			earlyDesign=earlyDesAndPostArchs.get(0);
		
		earlyDesAndPostArchs = pab.getPostArchitectureByCountSession(countSession);
		if(earlyDesAndPostArchs.size()!=0)//再获取post architecture
			postArchitecture=earlyDesAndPostArchs.get(0);
		return "list";
	}
	
	public String editAppComp() {
		// 查找结果为0条或1条
		applicationCompositions = ab
				.getApplicationCompositionByCountSession(countSession);
		// 第一次估算,使用默认组织的薪资水平
		if (applicationCompositions.size() == 0) {
			countSession = sb.find(countSession);
			Project project = countSession.getProject();
			User user = project.getUser();
			Organization organization = user.getOrganization();
			Param param = pb.findParamByOrg(organization);
			applicationComposition = new ApplicationComposition();
			applicationComposition.setMonthlyAvg(param.getMonthlyAvg());
		} else {
			applicationComposition = applicationCompositions.get(0);
		}
		return "applicationComp";
	}

	// 计算应用组装子模型的工作量、工期和成本
	// PM=(NOP )/PROD,cost=pm*monthlyAvg
	public String editedAppCom() {
		// 第一次估算
		DecimalFormat df = new DecimalFormat("0.00");
		double pm = applicationComposition.getNop() * 1.0
				/ applicationComposition.getProd();
		pm = Double.parseDouble(df.format(pm));
		applicationComposition.setEffort(pm);
		applicationComposition.setCost(Double.parseDouble(df.format(pm
				* applicationComposition.getMonthlyAvg())));
		countSession = sb.find(countSession);
		applicationComposition.setCountSession(countSession);
		if (applicationComposition.getId() == null) {
			ab.create(applicationComposition);
		} else {
			ab.update(applicationComposition);
		}
		return editAppComp();
	}

	//打开早期设计子模型页面
	public String editEarlyDesign() {
		// 查找结果为0条或1条
		earlyDesAndPostArchs = eb.getEarlyDesignByCountSession(countSession);
		countSession = sb.find(countSession);
		Project project = countSession.getProject();
		User user = project.getUser();
		Organization organization = user.getOrganization();
		//判断是否为COSMIC，若是则先转换为FP
		if(countSession.getMethodType().equals("COSMIC")){
			if(countSession.getUfpc()<=305){
				CFP_to_FP=(8.2 + countSession.getUfpc())/0.847;
			}else{
				CFP_to_FP=(197 + countSession.getUfpc())/1.30;
			}
			CFP_to_FP=new BigDecimal(CFP_to_FP).setScale(2,BigDecimal.ROUND_HALF_UP).doubleValue();
		}
		// 第一次估算,使用默认组织的薪资水平
		if (earlyDesAndPostArchs.size() == 0) {
			setParam(pb.findParamByOrg(organization));
			setDevLangs(db.findDevLangByOrg(organization));
		} else {
			earlyDesAndPostArch = earlyDesAndPostArchs.get(0);
			param = pb.findParamByEarlyDesignAndPostArchitecture(earlyDesAndPostArch);
			// 只保存上一次设置的因子值，其他都从组织级中来
			devLangs = db.findDevLangByOrg(organization);
			for (int i = 0; i < devLangs.size(); i++) {
				if ((devLangs.get(i).getName()).equals(earlyDesAndPostArch.getLanguage())) {
					// 只替换上次被改过的编程语言
					DevLang devLang=devLangs.get(i);
					devLang.setLinesPerFP(earlyDesAndPostArch.getLinesPerFP());
					devLangs.set(i, devLang);
					break;
				}
			}
		}
		// 拼接json用于jquery动态改变语言对应的千行代码行数
		StringBuilder strBuilder = concatDevLangs(devLangs);
		devLangsString = strBuilder.toString();
		return "earlyDesign";
	}
	
	//打开后体系架构子模型页面
	public String editPostArchitecture() {
		// 查找结果为0条或1条
		earlyDesAndPostArchs = pab.getPostArchitectureByCountSession(countSession);
		List<EarlyDesignAndPostArchitecture> earlyDesigns=eb.getEarlyDesignByCountSession(countSession);
		countSession = sb.find(countSession);
		Project project = countSession.getProject();
		User user = project.getUser();
		Organization organization = user.getOrganization();
		//判断是否为COSMIC，若是则先转换为FP
		if(countSession.getMethodType().equals("COSMIC")){
			if(countSession.getUfpc()<=305){
				CFP_to_FP=(8.2 + countSession.getUfpc())/0.847;
			}else{
				CFP_to_FP=(197 + countSession.getUfpc())/1.30;
			}
			CFP_to_FP=new BigDecimal(CFP_to_FP).setScale(2,BigDecimal.ROUND_HALF_UP).doubleValue();
		}
		// 第一次估算,若有后体系架构的参数，则使用；
		// 否则，使用组织级参数
		if (earlyDesAndPostArchs.size() == 0) {
				param=pb.findParamByOrg(organization);
				devLangs=db.findDevLangByOrg(organization);
		} else {
			earlyDesAndPostArch = earlyDesAndPostArchs.get(0);
			param = pb.findParamByEarlyDesignAndPostArchitecture(earlyDesAndPostArch);
			// 只保存上一次设置的因子值，其他都从组织级中来
			devLangs = db.findDevLangByOrg(organization);
			for (int i = 0; i < devLangs.size(); i++) {
				if ((devLangs.get(i).getName()).equals(earlyDesAndPostArch.getLanguage())) {
					// 只替换上次被改过的编程语言
					DevLang devLang=devLangs.get(i);
					devLang.setLinesPerFP(earlyDesAndPostArch.getLinesPerFP());
					devLangs.set(i, devLang);
					break;
				}
			}
		}
		// 拼接json用于jquery动态改变语言对应的千行代码行数
		StringBuilder strBuilder = concatDevLangs(devLangs);
		devLangsString = strBuilder.toString();
		return "postArchitecture";
	}

	public StringBuilder concatDevLangs(List<DevLang> devLangs) {
		// 拼接字符串，用于jquery
		StringBuilder sb = new StringBuilder();
		sb.append("[");
		for (DevLang i : devLangs) {
			sb.append("{\"name\":\"" + i.getName() + "\"," + "\"linesPerFP\":"
					+ i.getLinesPerFP() + "},");
		}
		sb.deleteCharAt(sb.length() - 1);// 删除最后一个多余逗号
		sb.append("]");
		return sb;
	}

	// 根据17个因子等级打分获取7个因子的值
	// 计算早期设计子模型的工作量、工期和成本
	// PM=A ×Size^E × ∑EM(i=1到7),cost=pm*monthlyAvg	
	public String editedEarlyDesign() {
		//新建或修改EarlyDesignAndPostArchitecture
	//转换为保留两位小数
		double pm = new BigDecimal(caculatePM(true)).setScale(2,BigDecimal.ROUND_HALF_UP).doubleValue(); 
		double duration=new BigDecimal(caculateDuration(pm)).setScale(2,BigDecimal.ROUND_HALF_UP).doubleValue(); 		
		double cost=new BigDecimal(pm*param.getMonthlyAvg()).setScale(2,BigDecimal.ROUND_HALF_UP).doubleValue();
		earlyDesAndPostArch.setEffort(pm);
		earlyDesAndPostArch.setDuration(duration);
		earlyDesAndPostArch.setCost(cost);
		if (earlyDesAndPostArch.getId() == null) {
			earlyDesAndPostArch.setType("Early Design");
			countSession=sb.find(countSession);
			earlyDesAndPostArch.setCountSession(countSession);
			eb.create(earlyDesAndPostArch);
			//找到刚插入的记录
			List<EarlyDesignAndPostArchitecture> e=eb.getEarlyDesignByCountSession(countSession);
			param.setEarlyDesignAndPostArchitecture(e.get(0));
			param.setId(null);
			pb.create(param);
		} else {
			eb.update(earlyDesAndPostArch);
			pb.updateEarlyDesign(param);
		}
				
		return editEarlyDesign();
	}
	
	// 计算后体系架构子模型的工作量、工期和成本
	// PM=A ×Size^E × ∑EM(i=1到17),cost=pm*monthlyAvg	
	public String editedPostArchitecture() {
		//新建或修改EarlyDesignAndPostArchitecture
	//转换为保留两位小数
		double pm = new BigDecimal(caculatePM(false)).setScale(2,BigDecimal.ROUND_HALF_UP).doubleValue(); 
		double duration=new BigDecimal(caculateDuration(pm)).setScale(2,BigDecimal.ROUND_HALF_UP).doubleValue(); 		
		double cost=new BigDecimal(pm*param.getMonthlyAvg()).setScale(2,BigDecimal.ROUND_HALF_UP).doubleValue();
		earlyDesAndPostArch.setEffort(pm);
		earlyDesAndPostArch.setDuration(duration);
		earlyDesAndPostArch.setCost(cost);
		if (earlyDesAndPostArch.getId() == null) {
			earlyDesAndPostArch.setType("Post Architecture");
			countSession=sb.find(countSession);
			earlyDesAndPostArch.setCountSession(countSession);
			pab.create(earlyDesAndPostArch);
			//找到刚插入的记录
			List<EarlyDesignAndPostArchitecture> e=pab.getPostArchitectureByCountSession(countSession);
			param.setEarlyDesignAndPostArchitecture(e.get(0));
			param.setId(null);
			pb.create(param);
		} else {
			eb.update(earlyDesAndPostArch);
			pb.updatePostArchitecture(param);
		}
				
		return editPostArchitecture();
	}
	
	// TDEV=C*PM^F F=D+0.2*0.01*∑SF
	//C和D都是常量，分别为3.67和0.28 
	public double caculateDuration(double pm){
		double scaleFactorsSum = getScaleFactors();
		double F=0.28+0.2*0.01*scaleFactorsSum;
		double tdev=(3.67*Math.pow(pm, F));
		return tdev;
	}
	
	// PM=A ×Size^E × ∏EM
	// E=B+0.01*∑SF(i=1到5)
	// A=2.94， B=0.91
	// 早期设计：7个因子；后体系架构：17个因子
	public double caculatePM(boolean isEarlyDesign){
		double scaleFactorsSum = getScaleFactors();
		double costDriversProduct;
		if(isEarlyDesign==true){
			costDriversProduct = getCostDriverForEarlyDesign();
		}else{//后体系架构子模型的计算方法，17个cost drivers直乘
			costDriversProduct = getCostDriverForPostArch();
		}
		double E=(0.91+0.01*scaleFactorsSum);
		double pm=2.94*Math.pow(earlyDesAndPostArch.getKSLOC(), E)*costDriversProduct;
		return pm;
	}
	
	private double getCostDriverForEarlyDesign(){
		
		//RCPX
		if(param.getEd_RCPX().equals("极其低")){
			ed_costDrivers[0]=0.49;
		}else if(param.getEd_RCPX().equals("非常低")){
			ed_costDrivers[0]=0.60;
		}else if(param.getEd_RCPX().equals("低")){
			ed_costDrivers[0]=0.83;
		}else if(param.getEd_RCPX().equals("一般")){
			ed_costDrivers[0]=1.00;
		}else if(param.getEd_RCPX().equals("高")){
			ed_costDrivers[0]=1.33;
		}else if(param.getEd_RCPX().equals("非常高")){
			ed_costDrivers[0]=1.91;
		}else {
			ed_costDrivers[0]=2.72;
		}

		//RUSE
		if(param.getEd_RUSE().equals("低")){
			ed_costDrivers[1]=0.95;
		}else if(param.getEd_RUSE().equals("一般")){
			ed_costDrivers[1]=1.00;
		}else if(param.getEd_RUSE().equals("高")){
			ed_costDrivers[1]=1.07;
		}else if(param.getEd_RUSE().equals("非常高")){
			ed_costDrivers[1]=1.15;
		}else{
			ed_costDrivers[1]=1.24;
		}
		
		//SCED
		if(param.getEd_SCED().equals("非常低")){
			ed_costDrivers[2]=1.43;
		}else if(param.getEd_SCED().equals("低")){
			ed_costDrivers[2]=1.14;
		}else if(param.getEd_SCED().equals("一般")){
			ed_costDrivers[2]=1.00;
		}else if(param.getEd_SCED().equals("高")){
			ed_costDrivers[2]=1.00;
		}else{
			ed_costDrivers[2]=1.00;
		}
		
		//PDIF
		if(param.getEd_PDIF().equals("低")){
			ed_costDrivers[3]=0.87;
		}else if(param.getEd_PDIF().equals("一般")){
			ed_costDrivers[3]=1.00;
		}else if(param.getEd_PDIF().equals("高")){
			ed_costDrivers[3]=1.29;
		}else if(param.getEd_PDIF().equals("非常高")){
			ed_costDrivers[3]=1.81;
		}else {
			ed_costDrivers[3]=2.61;
		}
		
		//PERS
		if(param.getEd_PERS().equals("极其低")){
			ed_costDrivers[4]=2.12;
		}else if(param.getEd_PERS().equals("非常低")){
			ed_costDrivers[4]=1.62;
		}else if(param.getEd_PERS().equals("低")){
			ed_costDrivers[4]=1.26;
		}else if(param.getEd_PERS().equals("一般")){
			ed_costDrivers[4]=1.00;
		}else if(param.getEd_PERS().equals("高")){
			ed_costDrivers[4]=0.83;
		}else if(param.getEd_PERS().equals("非常高")){
			ed_costDrivers[4]=0.63;
		}else {
			ed_costDrivers[4]=0.50;
		}
		
		//PREX
		if(param.getEd_PREX().equals("极其低")){
			ed_costDrivers[5]=1.59;
		}else if(param.getEd_PREX().equals("非常低")){
			ed_costDrivers[5]=1.33;
		}else if(param.getEd_PREX().equals("低")){
			ed_costDrivers[5]=1.22;
		}else if(param.getEd_PREX().equals("一般")){
			ed_costDrivers[5]=1.00;
		}else if(param.getEd_PREX().equals("高")){
			ed_costDrivers[5]=0.87;
		}else if(param.getEd_PREX().equals("非常高")){
			ed_costDrivers[5]=0.74;
		}else {
			ed_costDrivers[5]=0.62;
		}
		
		//FCIL
		if(param.getEd_FCIL().equals("极其低")){
			ed_costDrivers[6]=1.43;
		}else if(param.getEd_FCIL().equals("非常低")){
			ed_costDrivers[6]=1.30;
		}else if(param.getEd_FCIL().equals("低")){
			ed_costDrivers[6]=1.10;
		}else if(param.getEd_FCIL().equals("一般")){
			ed_costDrivers[6]=1.00;
		}else if(param.getEd_FCIL().equals("高")){
			ed_costDrivers[6]=0.87;
		}else if(param.getEd_FCIL().equals("非常高")){
			ed_costDrivers[6]=0.73;
		}else {
			ed_costDrivers[6]=0.62;
		}
	
		double ed_costDriversProduct=1.0f;
		for(double f:ed_costDrivers){
			ed_costDriversProduct*=f;
		}
		return ed_costDriversProduct;
	}
	
	private double getCostDriverForPostArch(){
		//RELY
		if(param.getCd_RELY().equals("非常低")){
			costDrivers[0]=0.82f;
		}else if(param.getCd_RELY().equals("低")){
			costDrivers[0]=0.92f;
		}else if(param.getCd_RELY().equals("一般")){
			costDrivers[0]=1.00f;
		}else if(param.getCd_RELY().equals("高")){
			costDrivers[0]=1.10f;
		}else {
			costDrivers[0]=1.26f;
		}
		//DATA
		if(param.getCd_DATA().equals("低")){
			costDrivers[1]=0.9f;
		}else if(param.getCd_DATA().equals("一般")){
			costDrivers[1]=1.00f;
		}else if(param.getCd_DATA().equals("高")){
			costDrivers[1]=1.14f;
		}else {
			costDrivers[1]=1.28f;
		}
		//CPLX
		if(param.getCd_CPLX().equals("非常低")){
			costDrivers[2]=0.73f;
		}else if(param.getCd_CPLX().equals("低")){
			costDrivers[2]=0.87f;
		}else if(param.getCd_CPLX().equals("一般")){
			costDrivers[2]=1.00f;
		}else if(param.getCd_CPLX().equals("高")){
			costDrivers[2]=1.17f;
		}else if(param.getCd_CPLX().equals("非常高")){
			costDrivers[2]=1.34f;
		}else{
			costDrivers[2]=1.74f;
		}
		//RUSE
		if(param.getCd_RUSE().equals("低")){
			costDrivers[3]=0.95f;
		}else if(param.getCd_RUSE().equals("一般")){
			costDrivers[3]=1.00f;
		}else if(param.getCd_RUSE().equals("高")){
			costDrivers[3]=1.07f;
		}else if(param.getCd_RUSE().equals("非常高")){
			costDrivers[3]=1.15f;
		}else{
			costDrivers[3]=1.24f;
		}
		//DOCU
		if(param.getCd_DOCU().equals("非常低")){
			costDrivers[4]=0.81f;
		}else if(param.getCd_DOCU().equals("低")){
			costDrivers[4]=0.91f;
		}else if(param.getCd_DOCU().equals("一般")){
			costDrivers[4]=1.00f;
		}else if(param.getCd_DOCU().equals("高")){
			costDrivers[4]=1.11f;
		}else {
			costDrivers[4]=1.23f;
		}
		//TIME
		if(param.getCd_TIME().equals("一般")){
			costDrivers[5]=1.00f;
		}else if(param.getCd_TIME().equals("高")){
			costDrivers[5]=1.11f;
		}else if(param.getCd_TIME().equals("非常高")){
			costDrivers[5]=1.29f;
		}else{
			costDrivers[5]=1.63f;
		}
		//STOR
		if(param.getCd_STOR().equals("一般")){
			costDrivers[6]=1.00f;
		}else if(param.getCd_STOR().equals("高")){
			costDrivers[6]=1.05f;
		}else if(param.getCd_STOR().equals("非常高")){
			costDrivers[6]=1.17f;
		}else{
			costDrivers[6]=1.46f;
		}
		//PVOL
		if(param.getCd_PVOL().equals("低")){
			costDrivers[7]=0.87f;
		}else if(param.getCd_PVOL().equals("一般")){
			costDrivers[7]=1.00f;
		}else if(param.getCd_PVOL().equals("高")){
			costDrivers[7]=1.15f;
		}else {
			costDrivers[7]=1.30f;
		}
		//ACAP
		if(param.getCd_ACAP().equals("非常低")){
			costDrivers[8]=1.42f;
		}else if(param.getCd_ACAP().equals("低")){
			costDrivers[8]=1.19f;
		}else if(param.getCd_ACAP().equals("一般")){
			costDrivers[8]=1.00f;
		}else if(param.getCd_ACAP().equals("高")){
			costDrivers[8]=0.85f;
		}else {
			costDrivers[8]=0.71f;
		}
		//PCAP
		if(param.getCd_PCAP().equals("非常低")){
			costDrivers[9]=1.34f;
		}else if(param.getCd_PCAP().equals("低")){
			costDrivers[9]=1.15f;
		}else if(param.getCd_PCAP().equals("一般")){
			costDrivers[9]=1.00f;
		}else if(param.getCd_PCAP().equals("高")){
			costDrivers[9]=0.88f;
		}else{
			costDrivers[9]=0.76f;
		}
		//AEXP
		if(param.getCd_AEXP().equals("非常低")){
			costDrivers[10]=1.22f;
		}else if(param.getCd_AEXP().equals("低")){
			costDrivers[10]=1.10f;
		}else if(param.getCd_AEXP().equals("一般")){
			costDrivers[10]=1.00f;
		}else if(param.getCd_AEXP().equals("高")){
			costDrivers[10]=0.88f;
		}else{
			costDrivers[10]=0.81f;
		}
		//PLEX
		if(param.getCd_PLEX().equals("非常低")){
			costDrivers[11]=1.19f;
		}else if(param.getCd_PLEX().equals("低")){
			costDrivers[11]=1.09f;
		}else if(param.getCd_PLEX().equals("一般")){
			costDrivers[11]=1.00f;
		}else if(param.getCd_PLEX().equals("高")){
			costDrivers[11]=0.91f;
		}else{
			costDrivers[11]=0.85f;
		}
		//LTEX
		if(param.getCd_LTEX().equals("非常低")){
			costDrivers[12]=1.20f;
		}else if(param.getCd_LTEX().equals("低")){
			costDrivers[12]=1.09f;
		}else if(param.getCd_LTEX().equals("一般")){
			costDrivers[12]=1.00f;
		}else if(param.getCd_LTEX().equals("高")){
			costDrivers[12]=0.91f;
		}else{
			costDrivers[12]=0.84f;
		}
		//PCON
		if(param.getCd_PCON().equals("非常低")){
			costDrivers[13]=1.29f;
		}else if(param.getCd_PCON().equals("低")){
			costDrivers[13]=1.12f;
		}else if(param.getCd_PCON().equals("一般")){
			costDrivers[13]=1.00f;
		}else if(param.getCd_PCON().equals("高")){
			costDrivers[13]=0.90f;
		}else{
			costDrivers[13]=0.81f;
		}
		//TOOL
		if(param.getCd_TOOL().equals("非常低")){
			costDrivers[14]=1.17f;
		}else if(param.getCd_TOOL().equals("低")){
			costDrivers[14]=1.09f;
		}else if(param.getCd_TOOL().equals("一般")){
			costDrivers[14]=1.00f;
		}else if(param.getCd_TOOL().equals("高")){
			costDrivers[14]=0.9f;
		}else {
			costDrivers[14]=0.78f;
		}
		//SITE
		if(param.getCd_SITE().equals("非常低")){
			costDrivers[15]=1.22f;
		}else if(param.getCd_SITE().equals("低")){
			costDrivers[15]=1.09f;
		}else if(param.getCd_SITE().equals("一般")){
			costDrivers[15]=1.00f;
		}else if(param.getCd_SITE().equals("高")){
			costDrivers[15]=0.93f;
		}else if(param.getCd_SITE().equals("非常高")){
			costDrivers[15]=0.86f;
		}else{
			costDrivers[15]=0.80f;
		}
		//SCED
		if(param.getCd_SCED().equals("非常低")){
			costDrivers[16]=1.43f;
		}else if(param.getCd_SCED().equals("低")){
			costDrivers[16]=1.14f;
		}else if(param.getCd_SCED().equals("一般")){
			costDrivers[16]=1.00f;
		}else if(param.getCd_SCED().equals("高")){
			costDrivers[16]=1.00f;
		}else{
			costDrivers[16]=1.00f;
		}
		double costDriversProduct=1.0f;
		for(double f:costDrivers){
			costDriversProduct*=f;
		}
		return costDriversProduct;
	}
	
	private double getScaleFactors(){
		//PREC 待完善，以后可以设置为常数表的值 这样组织也可以自行修改，不用固化在代码中
		if(param.getSf_PREC().equals("非常低")){
			scaleFactors[0]=6.2f;
		}else if(param.getSf_PREC().equals("低")){
			scaleFactors[0]=4.96f;
		}else if(param.getSf_PREC().equals("一般")){
			scaleFactors[0]=3.72f;
		}else if(param.getSf_PREC().equals("高")){
			scaleFactors[0]=2.48f;
		}else if(param.getSf_PREC().equals("非常高")){
			scaleFactors[0]=1.24f;
		}else{
			scaleFactors[0]=0.00f;
		}
		
		//FLEX
		if(param.getSf_FLEX().equals("非常低")){
			scaleFactors[1]=5.07f;
		}else if(param.getSf_FLEX().equals("低")){
			scaleFactors[1]=4.05f;
		}else if(param.getSf_FLEX().equals("一般")){
			scaleFactors[1]=3.04f;
		}else if(param.getSf_FLEX().equals("高")){
			scaleFactors[1]=2.03f;
		}else if(param.getSf_FLEX().equals("非常高")){
			scaleFactors[1]=1.01f;
		}else{
			scaleFactors[1]=0.00f;
		}
		
		//RESL
		if(param.getSf_RESL().equals("非常低")){
			scaleFactors[2]=7.07f;
		}else if(param.getSf_RESL().equals("低")){
			scaleFactors[2]=5.65f;
		}else if(param.getSf_RESL().equals("一般")){
			scaleFactors[2]=4.24f;
		}else if(param.getSf_RESL().equals("高")){
			scaleFactors[2]=2.83f;
		}else if(param.getSf_RESL().equals("非常高")){
			scaleFactors[2]=1.41f;
		}else{
			scaleFactors[2]=0.00f;
		}
		
		//TEAM
		if(param.getSf_TEAM().equals("非常低")){
			scaleFactors[3]=5.48f;
		}else if(param.getSf_TEAM().equals("低")){
			scaleFactors[3]=4.38f;
		}else if(param.getSf_TEAM().equals("一般")){
			scaleFactors[3]=3.29f;
		}else if(param.getSf_TEAM().equals("高")){
			scaleFactors[3]=2.19f;
		}else if(param.getSf_TEAM().equals("非常高")){
			scaleFactors[3]=1.10f;
		}else{
			scaleFactors[3]=0.00f;
		}
		
		//PMAT
		if(param.getSf_PMAT().equals("非常低")){
			scaleFactors[4]=7.80f;
		}else if(param.getSf_PMAT().equals("低")){
			scaleFactors[4]=6.24f;
		}else if(param.getSf_PMAT().equals("一般")){
			scaleFactors[4]=4.68f;
		}else if(param.getSf_PMAT().equals("高")){
			scaleFactors[4]=3.12f;
		}else if(param.getSf_PMAT().equals("非常高")){
			scaleFactors[4]=1.56f;
		}else{
			scaleFactors[4]=0.00f;
		}
		
		double scaleFactorSum=0.0f;
		for(double f:scaleFactors){
			scaleFactorSum+=f;
		}
		return scaleFactorSum;
	}

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

	public void setEarlyDesAndPostArch(
			EarlyDesignAndPostArchitecture earlyDesAndPostArch) {
		this.earlyDesAndPostArch = earlyDesAndPostArch;
	}

	public Param getParam() {
		return param;
	}

	public void setParam(Param param) {
		this.param = param;
	}

	public List<DevLang> getDevLangs() {
		return devLangs;
	}

	public void setDevLangs(List<DevLang> devLangs) {
		this.devLangs = devLangs;
	}

	public String getDevLangsString() {
		return devLangsString;
	}

	public void setDevLangsString(String devLangsString) {
		this.devLangsString = devLangsString;
	}
	public EarlyDesignAndPostArchitecture getEarlyDesign() {
		return earlyDesign;
	}

	public void setEarlyDesign(EarlyDesignAndPostArchitecture earlyDesign) {
		this.earlyDesign = earlyDesign;
	}

	public EarlyDesignAndPostArchitecture getPostArchitecture() {
		return postArchitecture;
	}

	public void setPostArchitecture(EarlyDesignAndPostArchitecture postArchitecture) {
		this.postArchitecture = postArchitecture;
	}

	public Double getCFP_to_FP() {
		return CFP_to_FP;
	}

	public void setCFP_to_FP(Double cFP_to_FP) {
		CFP_to_FP = cFP_to_FP;
	}
}
