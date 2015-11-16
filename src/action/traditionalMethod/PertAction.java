package action.traditionalMethod;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import bean.CountSession;
import bean.Pert;
import bean.PertItem;
import business.CountSessionBusiness;
import business.PertBusiness;
import business.PertItemBusiness;

public class PertAction {
	
	private Pert pert;
	private double pointEstimate;
	private double intervalEstimateMin;
	private double intervalEstimateMax;
	private CountSession countSession;
	private List<Pert> perts=new ArrayList<Pert>();
	private List<PertItem> pertItems;
	private PertBusiness pb=new PertBusiness();
	private CountSessionBusiness sb = new CountSessionBusiness();
	private PertItemBusiness pib = new PertItemBusiness();
	
	public String editPert() {
		// 查找结果为0条或1条
		perts = pb.getPertByCountSession(countSession);
		if(perts.size()!=0){
			pert = perts.get(0);
			pertItems=pib.getPertItemsByPert(pert);
		}
		return "pert";
	}

	public String editedPert() {
		countSession = sb.find(countSession);
		pert.setCountSession(countSession);	
		caculateEstimate(pertItems);
		pert.setPointEstimate(pointEstimate);
		pert.setIntervalEstimateMax(intervalEstimateMax);
		pert.setIntervalEstimateMin(intervalEstimateMin);
		if (pert.getId() == null) {
			pb.create(pert);
			pert=pb.getPertByCountSession(countSession).get(0);
			for(PertItem p:pertItems){
				p.setPert(pert);
				pib.create(p);
			}
		} else {
			List<PertItem> originalPertItems=pib.getPertItemsByPert(pert);
			for(PertItem p:originalPertItems){
				pib.delete(p);
			}
			for(PertItem p:pertItems){
				p.setPert(pert);
				pib.create(p);
			}
			pb.update(pert);
		}
		return editPert();
	}
	
	private void caculateEstimate(List<PertItem> pertItems){
		double variance,expectation,interval=0,weightSum=0;
		for(PertItem p:pertItems){
			expectation=(p.getOptimistic()+4*p.getMostLikely()+p.getPessimistic())/6;
			variance=Math.pow((p.getOptimistic()-p.getPessimistic()), 2)/36;
			weightSum+=p.getWeight();
			pointEstimate+=expectation*p.getWeight();
			interval+=variance*p.getWeight()*p.getWeight();
		}
		pointEstimate/=weightSum;
		interval/=(weightSum*weightSum);
		intervalEstimateMax=pointEstimate+Math.sqrt(interval);
		intervalEstimateMin=pointEstimate-Math.sqrt(interval);
		pointEstimate = new BigDecimal(pointEstimate).setScale(2,BigDecimal.ROUND_HALF_UP).doubleValue(); 
		intervalEstimateMax=new BigDecimal(intervalEstimateMax).setScale(2,BigDecimal.ROUND_HALF_UP).doubleValue(); 
		intervalEstimateMin=new BigDecimal(intervalEstimateMin).setScale(2,BigDecimal.ROUND_HALF_UP).doubleValue();
	}

	public Pert getPert() {
		return pert;
	}

	public void setPert(Pert pert) {
		this.pert = pert;
	}

	public CountSession getCountSession() {
		return countSession;
	}

	public void setCountSession(CountSession countSession) {
		this.countSession = countSession;
	}

	public List<PertItem> getPertItems() {
		return pertItems;
	}

	public void setPertItems(List<PertItem> pertItems) {
		this.pertItems = pertItems;
	}
}
