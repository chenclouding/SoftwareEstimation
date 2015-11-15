package action.traditionalMethod;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import bean.ApplicationComposition;
import bean.CountSession;
import bean.Organization;
import bean.Param;
import bean.Pert;
import bean.Project;
import bean.User;
import business.CountSessionBusiness;
import business.PertBusiness;

public class PertAction {
	
	Pert pert;
	CountSession countSession;
	List<Pert> perts=new ArrayList<Pert>();
	PertBusiness pb=new PertBusiness();
	private CountSessionBusiness sb = new CountSessionBusiness();
	
	public String editPert() {
		// 查找结果为0条或1条
		perts = pb.getPertByCountSession(countSession);
		if(perts.size()!=0)
			pert = perts.get(0);
		return "pert";
	}

	public String editedPert() {
		if (pert.getId() == null) {
			countSession = sb.find(countSession);
			pert.setCountSession(countSession);
			pb.create(pert);
		} else {
			pb.update(pert);
		}
		return editPert();
	}
}
