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

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

import com.opensymphony.xwork2.ActionSupport;

@Entity
@Table(name="module")
public class Module extends ActionSupport{

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Integer id;
	private String name;
	private String description;
	
	@ManyToOne
	@LazyCollection(LazyCollectionOption.FALSE)
	@JoinColumn(name = "project_id")
	private Project project;
	
	@OneToMany(fetch = FetchType.EAGER,mappedBy = "module")
	@Cascade(value = { CascadeType.SAVE_UPDATE, CascadeType.REMOVE, CascadeType.ALL })
	private List<DataFunction> dataFunctions = new ArrayList<DataFunction>();
	
	@OneToMany(fetch = FetchType.EAGER,mappedBy = "module")
	@Cascade(value = { CascadeType.SAVE_UPDATE, CascadeType.REMOVE, CascadeType.ALL })
	private List<TransFunction> transFunctions = new ArrayList<TransFunction>();
	
	@OneToMany(fetch = FetchType.EAGER,mappedBy = "module")
	@Cascade(value = { CascadeType.SAVE_UPDATE, CascadeType.REMOVE, CascadeType.ALL })
	private List<InterestObject> interestObjects = new ArrayList<InterestObject>();
	
	@OneToMany(fetch = FetchType.EAGER,mappedBy = "module")
	@Cascade(value = { CascadeType.SAVE_UPDATE, CascadeType.REMOVE, CascadeType.ALL })
	private List<FunctionProcess> functionProcesses = new ArrayList<FunctionProcess>();
	
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

	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	public List<DataFunction> getDataFunctions() {
		return dataFunctions;
	}

	public void setDataFunctions(List<DataFunction> dataFunctions) {
		this.dataFunctions = dataFunctions;
	}

	public List<TransFunction> getTransFunctions() {
		return transFunctions;
	}

	public void setTransFunctions(List<TransFunction> transFunctions) {
		this.transFunctions = transFunctions;
	}

	public List<InterestObject> getInterestObjects() {
		return interestObjects;
	}

	public void setInterestObjects(List<InterestObject> interestObjects) {
		this.interestObjects = interestObjects;
	}

	public List<FunctionProcess> getFunctionProcesses() {
		return functionProcesses;
	}

	public void setFunctionProcesses(List<FunctionProcess> functionProcesses) {
		this.functionProcesses = functionProcesses;
	}
	
}
