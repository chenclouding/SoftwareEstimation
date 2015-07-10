package action;

public class LoginAction {
	private String username;
	private String password;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String execute() throws Exception
	{
		if(getUsername().equals("chen") 
				&& getPassword().equals("chen")){
			return "success";
		}else{
			return "error";
		}
	}
}
