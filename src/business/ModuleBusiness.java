package business;

import java.util.List;

import com.opensymphony.xwork2.ActionSupport;

import bean.Module;
import bean.Project;
import bean.User;
import dao.BaseDAO;

public class ModuleBusiness extends ActionSupport{
	private BaseDAO<Module> dao=new BaseDAO<Module>();
	
	public void create(Module p) {
		dao.create(p);
	}
	
	public List<Module> getModulesByProject(Project u) {
		return dao.list("select c from Module c where c.project.id="+u.getId());
	}
	
	public Module find(Module p) {
		return dao.find(Module.class, p.getId());
	}
	
	public void update(Module p) {
		Module module = dao.find(Module.class, p.getId());
		module.setDescription(p.getDescription());
		module.setName(p.getName());
		dao.update(module);
	}
	
	public void delete(Module p) {
		dao.delete(dao.find(Module.class, p.getId()));
	}
}
