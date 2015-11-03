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
@Table(name="dataGroup")
public class DataGroup {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Integer id;
	private String name;
/*	private String description;*/
	
	@ManyToOne
	@LazyCollection(LazyCollectionOption.FALSE)
	@JoinColumn(name = "interestObject_id")
	private InterestObject interestObject;

/*	@ManyToMany(fetch = FetchType.LAZY,mappedBy = "dataMovement")
	@Cascade(value = { CascadeType.SAVE_UPDATE, CascadeType.REMOVE, CascadeType.ALL })
	private List<DataMovement> dataMovements = new ArrayList<DataMovement>();*/
	  @ManyToMany
	  @Cascade(value = { CascadeType.SAVE_UPDATE, CascadeType.REMOVE, CascadeType.ALL })
	    @JoinTable(name="dataMovement",    
	        joinColumns={    
	            @JoinColumn(name="dataGroup_id",referencedColumnName="id")    
	            },    
	            inverseJoinColumns={    
	             @JoinColumn(name="dataMovement_id",referencedColumnName="id")    
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

/*	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}*/

	public InterestObject getInterestObject() {
		return interestObject;
	}

	public void setInterestObject(InterestObject interestObject) {
		this.interestObject = interestObject;
	}

}

