package Bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="son_inf")
public class Son {
	@Id
	@Column(name="son_id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	
	@Column(name="son_name")
	private String sonName;
	public Son() {
		
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getSonName() {
		return sonName;
	}

	public void setSonName(String sonName) {
		this.sonName = sonName;
	}

	public int getSonAge() {
		return sonAge;
	}

	public void setSonAge(int sonAge) {
		this.sonAge = sonAge;
	}

	public Person getParent() {
		return parent;
	}

	public void setParent(Person parent) {
		this.parent = parent;
	}

	public Son(String sonName, int sonAge) {
		super();
		this.sonName = sonName;
		this.sonAge = sonAge;
	}

	private int sonAge;
	
	@ManyToOne(targetEntity=Person.class)
	@JoinColumn(name="parent_id")
	private Person parent;
	
	
}
