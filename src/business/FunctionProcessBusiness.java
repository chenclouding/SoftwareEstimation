package business;

import java.util.List;

import dao.BaseDAO;
import bean.CountSession;
import bean.FunctionProcess;
import bean.Module;

public class FunctionProcessBusiness{
	private BaseDAO<FunctionProcess> dao = new BaseDAO<FunctionProcess>();
	/*
	 * 选择数据功能，满足他们属于同一个估算场景,同一个模块
	 */
	public List<FunctionProcess> listAllByCountSessionFunctionModule(CountSession countSession, Module module) {
		return dao.list("select c from FunctionProcess c where c.countSession.id=" + countSession.getId() + " and c.module.id="
				+ module.getId());
	}
	
	public void create(FunctionProcess p) {
		dao.create(p);
	}
	
	public FunctionProcess find(FunctionProcess p) {
		return dao.find(FunctionProcess.class, p.getId());
	}
	
	public void update(FunctionProcess p) {
		FunctionProcess functionProcess = dao.find(FunctionProcess.class, p.getId());
		functionProcess.setDescription(p.getDescription());
		functionProcess.setName(p.getName());
		
		// add update cfpCount here

		dao.update(functionProcess);
	}
	
	public void delete(FunctionProcess p) {
		dao.delete(dao.find(FunctionProcess.class, p.getId()));
	}
}
