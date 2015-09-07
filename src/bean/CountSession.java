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

/** 估算场景 */

@Entity
@Table(name="countSession")
public class CountSession {
/*	public Session(){
		super();
		System.out.print("session created!");
	}*/
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Integer id;
	private String name;// 名称
	private String description;// 描述
	private String methodType;// 估算方法类型
	private String lifecyclePhase;// 软件生命周期阶段
	@Temporal(TemporalType.DATE)
	private java.util.Date time;// 估算开始时间
	private String purpose;// 估算目的
	private String scope;// 估算范围
	private Double ufpc;// 未调整功能点数
	private Double effort;// 工作量
	private Double duration;// 工期
	private Double cost;// 成本
	
	@ManyToOne
	@LazyCollection(LazyCollectionOption.FALSE)
	@JoinColumn(name = "project_id")
	private Project project;

	@OneToMany(fetch = FetchType.EAGER,mappedBy = "countSession")
	@Cascade(value = { CascadeType.SAVE_UPDATE, CascadeType.REMOVE, CascadeType.ALL })
	private List<DataFunction> dataFunctions = new ArrayList<DataFunction>();
	
	@OneToMany(fetch = FetchType.EAGER,mappedBy = "countSession")
	@Cascade(value = { CascadeType.SAVE_UPDATE, CascadeType.REMOVE, CascadeType.ALL })
	private List<TransFunction> transFunctions = new ArrayList<TransFunction>();
	
	@OneToMany(fetch = FetchType.EAGER,mappedBy = "countSession")
	@Cascade(value = { CascadeType.SAVE_UPDATE, CascadeType.REMOVE, CascadeType.ALL })
	private List<InterestObject> interestObjects = new ArrayList<InterestObject>();
	
	@OneToMany(fetch = FetchType.EAGER,mappedBy = "countSession")
	@Cascade(value = { CascadeType.SAVE_UPDATE, CascadeType.REMOVE, CascadeType.ALL })
	private List<FunctionProcess> functionProcesses = new ArrayList<FunctionProcess>();
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
/*		System.out.print("session name"+name);*/
		this.name = name;
		
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getLifecyclePhase() {
		return lifecyclePhase;
	}

	public void setLifecyclePhase(String lifecyclePhase) {
		this.lifecyclePhase = lifecyclePhase;
	}

	public String getMethodType() {
		return methodType;
	}

	public void setMethodType(String methodType) {
		this.methodType = methodType;
	}

	public Double getUfpc() {
		return ufpc;
	}

	public void setUfpc(Double ufpc) {
		this.ufpc = ufpc;
	}


	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}
	public java.util.Date getTime() {
		return time;
	}

	public void setTime(java.util.Date time) {
		this.time = time;
	}

	public String getPurpose() {
		return purpose;
	}

	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}

	public String getScope() {
		return scope;
	}

	public void setScope(String scope) {
		this.scope = scope;
	}

	public Double getEffort() {
		return effort;
	}

	public void setEffort(Double effort) {
		this.effort = effort;
	}

	public Double getDuration() {
		return duration;
	}

	public void setDuration(Double duration) {
		this.duration = duration;
	}

	public Double getCost() {
		return cost;
	}

	public void setCost(Double cost) {
		this.cost = cost;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
}