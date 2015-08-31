package bean;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

@Entity
@Table(name="project")
public class Project {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Integer id;
	private String name;// 名称
	private String description;// 描述
	private String type;// 开发类型 新增、二次开发、增强
	private String ide;// 集成开发环境
	private String devLang;// 编程语言
	private String os;// 操作系统
	private String usedDatabase;// 数据库
	private String lifeCycleModel;// 生命周期模型类型
	@Temporal(TemporalType.DATE)
	private java.util.Date startDate;// 开发开始时间
	@Temporal(TemporalType.DATE)
	private java.util.Date endDate;// 开发预计结束时间
	
	@ManyToOne
	@LazyCollection(LazyCollectionOption.FALSE)
	@JoinColumn(name = "user_id")
	private User user;
	
	@OneToMany(fetch = FetchType.LAZY,mappedBy = "project")
	@Cascade(value = { CascadeType.SAVE_UPDATE, CascadeType.REMOVE, CascadeType.ALL })
	private List<Module> modules = new ArrayList<Module>();
	
	@OneToMany(fetch = FetchType.LAZY,mappedBy = "project")
	@Cascade(value = { CascadeType.SAVE_UPDATE, CascadeType.REMOVE, CascadeType.ALL })
	private List<CountSession> sessions = new ArrayList<CountSession>();
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getIde() {
		return ide;
	}

	public void setIde(String ide) {
		this.ide = ide;
	}

	public String getDevLang() {
		return devLang;
	}

	public void setDevLang(String devLang) {
		this.devLang = devLang;
	}

	public String getOs() {
		return os;
	}

	public void setOs(String os) {
		this.os = os;
	}

	public String getUsedDatabase() {
		return usedDatabase;
	}

	public void setUsedDatabase(String usedDatabase) {
		this.usedDatabase = usedDatabase;
	}

	public String getLifeCycleModel() {
		return lifeCycleModel;
	}

	public void setLifeCycleModel(String lifeCycleModel) {
		this.lifeCycleModel = lifeCycleModel;
	}

	public java.util.Date getStartDate() {
		return startDate;
	}

	public void setStartDate(java.util.Date startDate) {
		this.startDate = startDate;
	}

	public java.util.Date getEndDate() {
		return endDate;
	}

	public void setEndDate(java.util.Date endDate) {
		this.endDate = endDate;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<Module> getModules() {
		return modules;
	}

	public void setModules(List<Module> modules) {
		this.modules = modules;
	}

	public List<CountSession> getSession() {
		return sessions;
	}

	public void setSession(List<CountSession> sessions) {
		this.sessions = sessions;
	}
	
}
