package action;

import model.UserBean;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;

public class LoginAction implements Action,ModelDriven<UserBean>{
	private UserBean model = new UserBean();
	private String username;
	
	public String regist() throws Exception{
		ActionContext.getContext().getSession().put("user", getModel().getUsername());
		return SUCCESS;
	}
	
	public String execute() throws Exception
	{
		if(getModel().getUsername().equals("chen") 
				&& getModel().getPassword().equals("chen")){
			getModel().setTip("haha,³É¹¦£¡");
			return SUCCESS;
		}else{
			return ERROR;
		}
	}
	public UserBean getModel(){
		return model;
	}
}
