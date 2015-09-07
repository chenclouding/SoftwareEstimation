package bean;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

@Entity
@Table(name="dataMovement")
public class DataMovement {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Integer id;
	private String name;
	private String description;
	
	@ManyToOne
	@LazyCollection(LazyCollectionOption.FALSE)
	@JoinColumn(name = "functionProcess_id")
	private FunctionProcess functionProcess;
	
/*	@ManyToMany(fetch = FetchType.LAZY,mappedBy = "dataGroup")
	@Cascade(value = { CascadeType.SAVE_UPDATE, CascadeType.REMOVE, CascadeType.ALL })
	private List<DataGroup> dataGroups = new ArrayList<DataGroup>();*/
	  @ManyToMany
	  @Cascade(value = { CascadeType.SAVE_UPDATE, CascadeType.REMOVE, CascadeType.ALL })
	    @JoinTable(name="dataGroup",    
	        joinColumns={    
	            @JoinColumn(name="dataMovement_id",referencedColumnName="id")    
	            },    
	            inverseJoinColumns={    
	             @JoinColumn(name="dataGroup_id",referencedColumnName="id")    
	       }    
	    ) 

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

	public FunctionProcess getFunctionProcess() {
		return functionProcess;
	}

	public void setFunctionProcess(FunctionProcess functionProcess) {
		this.functionProcess = functionProcess;
	}

}

