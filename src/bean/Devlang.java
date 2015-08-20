package bean;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="devlang")
public class Devlang {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Integer id;
	private String name;
	private float linesPerFP;
	
	@OneToMany(fetch = FetchType.LAZY,mappedBy = "organization")
	@JoinColumn(name = "organization_id")
	private Organization organization;

	public float getLinesPerFP() {
		return linesPerFP;
	}

	public void setLinesPerFP(float linesPerFP) {
		this.linesPerFP = linesPerFP;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	
}
