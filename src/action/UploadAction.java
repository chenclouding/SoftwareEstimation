package action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.UUID;

import com.opensymphony.xwork2.ActionSupport;

public class UploadAction extends ActionSupport{
	private String title;
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public File getUpload() {
		return upload;
	}
	public void setUpload(File upload) {
		this.upload = upload;
	}
	public String getUploadContentType() {
		return uploadContentType;
	}
	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}
	public String getUploadFileName() {
		return uploadFileName;
	}
	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}
	public String getSavePath() {
		return savePath;
	}
	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}
	private File upload;
	private String uploadContentType;
	private String uploadFileName;
	private String savePath;
	private String allowTypes;
	
	public String filterType(String[] types){
		String fileType = getUploadContentType();
		for(String type:types){
			if(type.equals(fileType)){
				return null;
			}
		}
		return INPUT;
	}
	
	@Override
	public String execute() throws Exception{
		String filterResult =filterType(getAllowTypes().split(","));
		if(filterResult!=null){
			return filterResult;
		}
		String newName = UUID.randomUUID()+uploadFileName.substring(uploadFileName.lastIndexOf("."));
		FileOutputStream fos = new FileOutputStream(getSavePath()+"\\"+newName);
		FileInputStream fis = new FileInputStream(getUpload());
		byte[] buffer = new byte[1024];
		int len=0;
		while((len = fis.read(buffer))>0){
			fos.write(buffer,0,len);
		}
		setUploadFileName(newName);
		return SUCCESS;
	}
	public String getAllowTypes() {
		return allowTypes;
	}
	public void setAllowTypes(String allowTypes) {
		this.allowTypes = allowTypes;
	}
}
