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

@Entity
@Table(name="functionProcess")
public class FunctionProcess {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Integer id;
	private String name;
	private String description;
	private Integer cfpCount;
	
	@ManyToOne
	@LazyCollection(LazyCollectionOption.FALSE)
	@JoinColumn(name = "countSession_id")
	private CountSession countSession;
	
	@ManyToOne
	@LazyCollection(LazyCollectionOption.FALSE)
	@JoinColumn(name = "module_id")
	private Module module;
	
	
	@OneToMany(fetch = FetchType.EAGER,mappedBy = "functionProcess")
	@Cascade(value = { CascadeType.SAVE_UPDATE, CascadeType.REMOVE, CascadeType.ALL })
	private List<DataMovement> dataMovements = new ArrayList<DataMovement>();
	

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

	public CountSession getCountSession() {
		return countSession;
	}

	public void setCountSession(CountSession countSession) {
		this.countSession = countSession;
	}

	public Module getModule() {
		return module;
	}

	public void setModule(Module module) {
		this.module = module;
	}

	public List<DataMovement> getDataMovements() {
		return dataMovements;
	}

	public void setDataMovements(List<DataMovement> dataMovements) {
		this.dataMovements = dataMovements;
	}

	public Integer getCfpCount() {
		return cfpCount;
	}

	public void setCfpCount(Integer cfpCount) {
		this.cfpCount = cfpCount;
	}
}

