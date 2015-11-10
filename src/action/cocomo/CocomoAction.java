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
	double RCPX,RUSE,PDIF,PERS,PREX,FCIL,SCED;

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
		System.out.print(devLangsString);
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
		// 第一次估算,若有后体系架构的参数，则使用；
		// 否则，若有早期设计的参数，则使用；
		// 否则，若没有使用组织级参数
		if (earlyDesAndPostArchs.size() == 0) {
			if(earlyDesigns.size()==0){
				param=pb.findParamByOrg(organization);
				devLangs=db.findDevLangByOrg(organization);
			}
			else{
				earlyDesign=earlyDesigns.get(0);
				param=pb.findParamByEarlyDesignAndPostArchitecture(earlyDesign);
				devLangs=db.findDevLangByOrg(organization);
				for (int i = 0; i < devLangs.size(); i++) {
					if ((devLangs.get(i).getName()).equals(earlyDesigns.get(0).getLanguage())) {
						// 只替换上次被改过的编程语言
						DevLang devLang=devLangs.get(i);
						devLang.setLinesPerFP(earlyDesigns.get(0).getLinesPerFP());
						devLangs.set(i, devLang);
						break;
					}
				}
			}
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
			pb.update(param);
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
			pb.update(param);
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
		double temp=countSession.getUfpc()*earlyDesAndPostArch.getLinesPerFP();
		double pm=2.94*Math.pow(temp/1000, E)*costDriversProduct;
		return pm;
	}
	
	private double getCostDriverForEarlyDesign(){
		//非常低-1，低-2，一般-3，高-4，非常高-5
		//RELY
		getValueForCostDriver(param.getCd_RELY(), 0); 
		//DATA
		getValueForCostDriver(param.getCd_DATA(), 1);
		//CPLX
		getValueForCostDriver(param.getCd_CPLX(), 2);
		//RUSE
		getValueForCostDriver(param.getCd_RUSE(), 3);
		//DOCU
		getValueForCostDriver(param.getCd_DOCU(), 4);
		//TIME
		getValueForCostDriver(param.getCd_TIME(), 5);
		//STOR
		getValueForCostDriver(param.getCd_STOR(), 6);
		//PVOL
		getValueForCostDriver(param.getCd_PVOL(), 7);
		//ACAP
		getValueForCostDriver(param.getCd_ACAP(), 8);
		//PCAP
		getValueForCostDriver(param.getCd_PCAP(), 9);
		//AEXP
		getValueForCostDriver(param.getCd_AEXP(), 10);
		//PLEX
		getValueForCostDriver(param.getCd_PLEX(), 11);
		//LTEX
		getValueForCostDriver(param.getCd_LTEX(), 12);
		//PCON
		getValueForCostDriver(param.getCd_PCON(), 13);
		//TOOL
		getValueForCostDriver(param.getCd_TOOL(), 14);
		//SITE
		getValueForCostDriver(param.getCd_SITE(), 15);
		//SCED
		getValueForCostDriver(param.getCd_SCED(), 16);
		
		//RCPX
		double RCPX_sum=costDrivers[0]+costDrivers[1]+costDrivers[2]+costDrivers[4];
		if(RCPX_sum>=5.0&&RCPX_sum<=6.0){
			RCPX=0.49;
		}else if(RCPX_sum>=7.0&&RCPX_sum<=8.0){
			RCPX=0.60;
		}else if(RCPX_sum>=9.0&&RCPX_sum<=11.0){
			RCPX=0.83;
		}else if(RCPX_sum==12.0){
			RCPX=1.00;
		}else if(RCPX_sum>=13.0&&RCPX_sum<=15.0){
			RCPX=1.33;
		}else if(RCPX_sum>=16.0&&RCPX_sum<=18.0){
			RCPX=1.91;
		}else {
			RCPX=2.72;
		}

		//RUSE
		double RUSE_sum=costDrivers[3];
		if(RUSE_sum==2.0){
			RUSE=0.95;
		}else if(RUSE_sum==3.0){
			RUSE=1.00;
		}else if(RUSE_sum==4.0){
			RUSE=1.07;
		}else if(RUSE_sum==5.0){
			RUSE=1.15;
		}else{
			RUSE=1.24;
		}
		
		//SCED
		double SCED_sum=costDrivers[16];
		if(SCED_sum==1.0){
			SCED=1.43;
		}else if(SCED_sum==2.0){
			SCED=1.14;
		}else if(SCED_sum==3.0){
			SCED=1.00;
		}else if(SCED_sum==4.0){
			SCED=1.00;
		}else{
			SCED=1.00;
		}
		
		//PDIF
		double PDIF_sum=costDrivers[5]+costDrivers[6]+costDrivers[7];
		if(PDIF_sum==8.0){
			PDIF=0.87;
		}else if(PDIF_sum==9.0){
			PDIF=1.00;
		}else if(PDIF_sum>=10.0&&PDIF_sum<=12.0){
			PDIF=1.29;
		}else if(PDIF_sum>=13.0&&PDIF_sum<=15.0){
			PDIF=1.81;
		}else {
			PDIF=2.61;
		}
		
		//PERS
		double PERS_sum=costDrivers[8]+costDrivers[9]+costDrivers[13];
		if(PERS_sum>=3.0&&PERS_sum<=4.0){
			PERS=2.12;
		}else if(PERS_sum>=5.0&&PERS_sum<=6.0){
			PERS=1.62;
		}else if(PERS_sum>=7.0&&PERS_sum<=8.0){
			PERS=1.26;
		}else if(PERS_sum>=9.0){
			PERS=1.00;
		}else if(PERS_sum>=10.0&&PERS_sum<=11.0){
			PERS=0.83;
		}else if(PERS_sum>=12.0&&PERS_sum<=13.0){
			PERS=0.63;
		}else {
			PERS=0.50;
		}
		
		//PREX
		double PREX_sum=costDrivers[10]+costDrivers[11]+costDrivers[12];
		if(PREX_sum>=3.0&&PREX_sum<=4.0){
			PREX=1.59;
		}else if(PREX_sum>=5.0&&PREX_sum<=6.0){
			PREX=1.33;
		}else if(PREX_sum>=7.0&&PREX_sum<=8.0){
			PREX=1.22;
		}else if(PREX_sum==9.0){
			PREX=1.00;
		}else if(PREX_sum>=10.0&&PREX_sum<=11.0){
			PREX=0.87;
		}else if(PREX_sum>=12.0&&PREX_sum<=13.0){
			PREX=0.74;
		}else {
			PREX=0.62;
		}
		
		//FCIL
		double FCIL_sum=costDrivers[14]+costDrivers[15];
		if(FCIL_sum==2.0){
			FCIL=1.43;
		}else if(FCIL_sum==3.0){
			FCIL=1.30;
		}else if(FCIL_sum>=4.0&&FCIL_sum<=5.0){
			FCIL=1.10;
		}else if(FCIL_sum==6.0){
			FCIL=1.00;
		}else if(FCIL_sum>=7.0&&FCIL_sum<=8.0){
			FCIL=0.87;
		}else if(FCIL_sum>=9.0&&FCIL_sum<=10.0){
			FCIL=0.73;
		}else {
			FCIL=0.62;
		}
	
		return RCPX*RUSE*PDIF*PERS*PREX*FCIL*SCED;
	}

	private void getValueForCostDriver(String level,int i){
		//非常低-1，低-2，一般-3，高-4，非常高-5
		if(level.equals("非常低")){
			costDrivers[i]=1.0f;
		}else if(level.equals("低")){
			costDrivers[i]=2.0f;
		}else if(level.equals("一般")){
			costDrivers[i]=3.0f;
		}else if(level.equals("高")){
			costDrivers[i]=4.0f;
		}else if(level.equals("非常高")){
			costDrivers[i]=5.0f;
		}else{
			costDrivers[i]=6.0f;
		}
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
	public double getRCPX() {
		return RCPX;
	}
	public void setRCPX(double rCPX) {
		RCPX = rCPX;
	}
	public double getRUSE() {
		return RUSE;
	}
	public void setRUSE(double rUSE) {
		RUSE = rUSE;
	}
	public double getPDIF() {
		return PDIF;
	}
	public void setPDIF(double pDIF) {
		PDIF = pDIF;
	}
	public double getPERS() {
		return PERS;
	}
	public void setPERS(double pERS) {
		PERS = pERS;
	}
	public double getPREX() {
		return PREX;
	}
	public void setPREX(double pREX) {
		PREX = pREX;
	}
	public double getFCIL() {
		return FCIL;
	}
	public void setFCIL(double fCIL) {
		FCIL = fCIL;
	}
	public double getSCED() {
		return SCED;
	}
	public void setSCED(double sCED) {
		SCED = sCED;
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
}
