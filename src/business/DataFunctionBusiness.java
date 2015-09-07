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
		dao.create(p);
	}
}
