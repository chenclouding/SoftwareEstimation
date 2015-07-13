package Bean;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name="person_inf")
public class Person {
	@Id
	@Column(name="person_id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	
	@Column(name="person_name")
	private String name;
	
	private String gender;
	
	@OneToMany(targetEntity=Son.class,mappedBy="parent")
	private Set<Son> sons = new HashSet<>();
	
	public Person(){		
	}
	
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

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Set<Son> getSons() {
		return sons;
	}

	public void setSons(Set<Son> sons) {
		this.sons = sons;
	}

	public Person(String name, String gender, Set<Son> sons){
		this.name=name;
		this.gender=gender;
		this.sons=sons;
	}
}
