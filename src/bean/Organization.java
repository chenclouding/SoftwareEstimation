package bean;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

/** ��֯��Ϣ */

@Entity
@Table(name="organization")
public class Organization {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Integer id;
	private String name;
	private String type;
	private String description;
	private String address;
	private String postcode;
	private String contact;
	private String phone;
	private String email;
	private String fax;
	
	@OneToMany(fetch = FetchType.EAGER,mappedBy = "organization")
	@Cascade(value = { CascadeType.SAVE_UPDATE, CascadeType.REMOVE, CascadeType.ALL })
	private List<User> users = new ArrayList<User>();
	
	@OneToMany(fetch = FetchType.EAGER,mappedBy = "organization")
	@Cascade(value = { CascadeType.SAVE_UPDATE, CascadeType.REMOVE, CascadeType.ALL })
	private List<DevLang> devLangs = new ArrayList<DevLang>();
	
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
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getFax() {
		return fax;
	}
	public void setFax(String fax) {
		this.fax = fax;
	}
	public List<User> getUsers() {
		return users;
	}
	public void setUsers(List<User> users) {
		this.users = users;
	}
	public List<DevLang> getDevLangs() {
		return devLangs;
	}
	public void setDevLangs(List<DevLang> devLangs) {
		this.devLangs = devLangs;
	}
}