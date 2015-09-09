package business;

import java.util.List;

import dao.BaseDAO;
import bean.CountSession;
import bean.TransFunction;
import bean.Module;

public class TransFunctionBusiness{
	private BaseDAO<TransFunction> dao = new BaseDAO<TransFunction>();
	/*
	 * 选择数据功能，满足他们属于同一个估算场景,同一个模块
	 */
	public List<TransFunction> listAllByCountSessionFunctionModule(CountSession countSession, Module module) {
		return dao.list("select c from TransFunction c where c.countSession.id=" + countSession.getId() + " and c.module.id="
				+ module.getId());
	}
	
	public void create(TransFunction p) {
		p.setFpCount(countFpForTransFunction(p));
		dao.create(p);
	}
	
	public int countFpForTransFunction(TransFunction transFunction){
		CountSession countSession = transFunction.getCountSession();
		if(countSession.getMethodType().equals("NESMA-估计型")){
			if(transFunction.getType().equals("EI")){
				return 4;
			}else if(transFunction.getType().equals("EO")){
				return 5;
			}else{
				return 4;
			}
		}else{
			int detCount = transFunction.getDetCount();
			int ftrCount = transFunction.getFtrCount();
			if(transFunction.getType().equals("EI")){
				if((detCount>=1&&detCount<=4 && ftrCount>=0 && ftrCount<=1)||
				   (detCount>=5&&detCount<=15 && ftrCount>=0 && ftrCount<=1)||
				   (detCount>=1&&detCount<=4 && ftrCount==2)){
					return 3;
				}else if((detCount>=16 && ftrCount>=0 && ftrCount<=1)||
						   (detCount>=5&&detCount<=15 && ftrCount==2)||
						   (detCount>=1&&detCount<=4 && ftrCount>=3)){
					return 4;
				}else{
					return 6;
				}
			}else{//EO或EQ
				if((detCount>=1&&detCount<=5 && ftrCount>=0 && ftrCount<=1)||
				   (detCount>=5&&detCount<=19 && ftrCount>=0 && ftrCount<=1)||
				   (detCount>=1&&detCount<=5 && ftrCount==2)){
					if(transFunction.getType().equals("EO")){//低复杂度
						return 4;
					}else{
						return 3;
					}			
				}else if((detCount>=20 && ftrCount>=0 && ftrCount<=1)||
						   (detCount>=6&&detCount<=19 && ftrCount==2)||
						   (detCount>=1&&detCount<=5 && ftrCount>=3)){
					if(transFunction.getType().equals("EO")){
						return 5;
					}else{
						return 4;
					}	
				}else{
					if(transFunction.getType().equals("EO")){
						return 7;
					}else{
						return 6;
					}	
				}
			}
		}
	}
	
	public TransFunction find(TransFunction p) {
		return dao.find(TransFunction.class, p.getId());
	}
	
	public void update(TransFunction p) {
		TransFunction transFunction = dao.find(TransFunction.class, p.getId());
		transFunction.setDescription(p.getDescription());
		transFunction.setType(p.getType());
		transFunction.setName(p.getName());
		if(transFunction.getDetCount()!=0){//只有详细型和ifpug才有det/ftr
			transFunction.setDetCount(p.getDetCount());
		}
		if(transFunction.getFtrCount()!=0){//只有详细型和ifpug才有det/ftr
			transFunction.setFtrCount(p.getFtrCount());
		}
		transFunction.setFpCount(countFpForTransFunction(transFunction));//若改变类型，更新FP数
		dao.update(transFunction);
	}
	
	public void delete(TransFunction p) {
		dao.delete(dao.find(TransFunction.class, p.getId()));
	}
}
