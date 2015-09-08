package business;

import java.util.List;

import dao.BaseDAO;
import bean.CountSession;
import bean.DataFunction;
import bean.Module;

public class DataFunctionBusiness{
	private BaseDAO<DataFunction> dao = new BaseDAO<DataFunction>();
	/*
	 * 选择数据功能，满足他们属于同一个估算场景,同一个模块
	 */
	public List<DataFunction> listAllByCountSessionFunctionModule(CountSession countSession, Module module) {
		return dao.list("select c from DataFunction c where c.countSession.id=" + countSession.getId() + " and c.module.id="
				+ module.getId());
	}
	
	public void create(DataFunction p) {
		p.setFpCount(countFpForDataFunction(p));
		dao.create(p);
	}
	
	public int countFpForDataFunction(DataFunction dataFunction){
		CountSession countSession = dataFunction.getCountSession();
		if(countSession.getMethodType().equals("NESMA-预估型")){
			if(dataFunction.getType().equals("ILF")){
				return 35;
			}else{
				return 15;
			}
		}else if(countSession.getMethodType().equals("NESMA-估计型")){
			if(dataFunction.getType().equals("ILF")){
				return 7;
			}else{
				return 5;
			}
		}else{
			int detCount = dataFunction.getDetCount();
			int retCount = dataFunction.getRetCount();
			if((detCount>=1&&detCount<=19 && retCount==1)||
			   (detCount>=20&&detCount<=50 && retCount==1)||
			   (detCount>=1&&detCount<=19 && retCount>=2&& retCount<=5)){
				if(dataFunction.getType().equals("ILF")){
					return 7;//ILF复杂度为低
				}else{
					return 5;//EIF复杂度为低
				}			
			}else if((detCount>=1&&detCount<=19 && retCount>=6)||
					(detCount>=20&&detCount<=50 && retCount>=2 && retCount<=5)||
					(detCount>=51 && retCount==1)){
				if(dataFunction.getType().equals("ILF")){
					return 10;//ILF复杂度为中等
				}else{
					return 7;//EIF复杂度为中等
				}	
			}else{
				if(dataFunction.getType().equals("ILF")){
					return 15;//ILF复杂度为高
				}else{
					return 10;//EIF复杂度为高
				}	
			}
		}
	}
	
	public DataFunction find(DataFunction p) {
		return dao.find(DataFunction.class, p.getId());
	}
	
	public void update(DataFunction p) {
		DataFunction dataFunction = dao.find(DataFunction.class, p.getId());
		dataFunction.setDescription(p.getDescription());
		dataFunction.setType(p.getType());
		dataFunction.setName(p.getName());
		if(dataFunction.getDetCount()!=0){//只有详细型和ifpug才有det/ftr
			dataFunction.setDetCount(p.getDetCount());
		}
		if(dataFunction.getRetCount()!=0){//只有详细型和ifpug才有det/ftr
			dataFunction.setDetCount(p.getRetCount());
		}
		dataFunction.setFpCount(countFpForDataFunction(dataFunction));//若改变类型，更新FP数
		dao.update(dataFunction);
	}
	
	public void delete(DataFunction p) {
		dao.delete(dao.find(DataFunction.class, p.getId()));
	}
}
