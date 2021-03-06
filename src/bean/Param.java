package bean;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

@Entity
@Table(name="param")
public class Param {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Integer id;
	//后体系架构成本驱动因子
	private String sf_PREC;
	private String sf_FLEX;
	private String sf_RESL;
	private String sf_TEAM;
	private String sf_PMAT;
	private String cd_RELY;
	private String cd_DATA;
	private String cd_CPLX;
	private String cd_RUSE;
	private String cd_DOCU;
	private String cd_TIME;
	private String cd_STOR;
	private String cd_PVOL;
	private String cd_ACAP;
	private String cd_PCAP;
	private String cd_AEXP;
	private String cd_PLEX;
	private String cd_LTEX;
	private String cd_PCON;
	private String cd_TOOL;
	private String cd_SITE;
	private String cd_SCED; 
	//早期设计的成本驱动因子
	private String ed_RCPX;
	private String ed_RUSE;
	private String ed_PDIF;
	private String ed_PREX;
	private String ed_FCIL;
	private String ed_SCED;
	private String ed_PERS;
	private Double monthlyAvg;
	
	@OneToOne
	@LazyCollection(LazyCollectionOption.FALSE)
	@JoinColumn(name = "organization_id")
	private Organization organization;
	
	@OneToOne
	@LazyCollection(LazyCollectionOption.FALSE)
	@JoinColumn(name = "earlyDesignAndPostArchitecture_id")
	private EarlyDesignAndPostArchitecture earlyDesignAndPostArchitecture;
	
	public Organization getOrganization() {
		return organization;
	}
	public void setOrganization(Organization organization) {
		this.organization = organization;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getSf_PREC() {
		return sf_PREC;
	}
	public void setSf_PREC(String sf_PREC) {
		this.sf_PREC = sf_PREC;
	}
	public String getSf_FLEX() {
		return sf_FLEX;
	}
	public void setSf_FLEX(String sf_FLEX) {
		this.sf_FLEX = sf_FLEX;
	}
	public String getSf_RESL() {
		return sf_RESL;
	}
	public void setSf_RESL(String sf_RESL) {
		this.sf_RESL = sf_RESL;
	}
	public String getSf_TEAM() {
		return sf_TEAM;
	}
	public void setSf_TEAM(String sf_TEAM) {
		this.sf_TEAM = sf_TEAM;
	}
	public String getSf_PMAT() {
		return sf_PMAT;
	}
	public void setSf_PMAT(String sf_PMAT) {
		this.sf_PMAT = sf_PMAT;
	}
	public String getCd_RELY() {
		return cd_RELY;
	}
	public void setCd_RELY(String cd_RELY) {
		this.cd_RELY = cd_RELY;
	}
	public String getCd_DATA() {
		return cd_DATA;
	}
	public void setCd_DATA(String cd_DATA) {
		this.cd_DATA = cd_DATA;
	}
	public String getCd_CPLX() {
		return cd_CPLX;
	}
	public void setCd_CPLX(String cd_CPLX) {
		this.cd_CPLX = cd_CPLX;
	}
	public String getCd_RUSE() {
		return cd_RUSE;
	}
	public void setCd_RUSE(String cd_RUSE) {
		this.cd_RUSE = cd_RUSE;
	}
	public String getCd_DOCU() {
		return cd_DOCU;
	}
	public void setCd_DOCU(String cd_DOCU) {
		this.cd_DOCU = cd_DOCU;
	}
	public String getCd_TIME() {
		return cd_TIME;
	}
	public void setCd_TIME(String cd_TIME) {
		this.cd_TIME = cd_TIME;
	}
	public String getCd_STOR() {
		return cd_STOR;
	}
	public void setCd_STOR(String cd_STOR) {
		this.cd_STOR = cd_STOR;
	}
	public String getCd_PVOL() {
		return cd_PVOL;
	}
	public void setCd_PVOL(String cd_PVOL) {
		this.cd_PVOL = cd_PVOL;
	}
	public String getCd_ACAP() {
		return cd_ACAP;
	}
	public void setCd_ACAP(String cd_ACAP) {
		this.cd_ACAP = cd_ACAP;
	}
	public String getCd_PCAP() {
		return cd_PCAP;
	}
	public void setCd_PCAP(String cd_PCAP) {
		this.cd_PCAP = cd_PCAP;
	}
	public String getCd_AEXP() {
		return cd_AEXP;
	}
	public void setCd_AEXP(String cd_AEXP) {
		this.cd_AEXP = cd_AEXP;
	}
	public String getCd_PLEX() {
		return cd_PLEX;
	}
	public void setCd_PLEX(String cd_PLEX) {
		this.cd_PLEX = cd_PLEX;
	}
	public String getCd_LTEX() {
		return cd_LTEX;
	}
	public void setCd_LTEX(String cd_LTEX) {
		this.cd_LTEX = cd_LTEX;
	}
	public String getCd_PCON() {
		return cd_PCON;
	}
	public void setCd_PCON(String cd_PCON) {
		this.cd_PCON = cd_PCON;
	}
	public String getCd_TOOL() {
		return cd_TOOL;
	}
	public void setCd_TOOL(String cd_TOOL) {
		this.cd_TOOL = cd_TOOL;
	}
	public String getCd_SITE() {
		return cd_SITE;
	}
	public void setCd_SITE(String cd_SITE) {
		this.cd_SITE = cd_SITE;
	}
	public String getCd_SCED() {
		return cd_SCED;
	}
	public void setCd_SCED(String cd_SCED) {
		this.cd_SCED = cd_SCED;
	}
	public Double getMonthlyAvg() {
		return monthlyAvg;
	}
	public void setMonthlyAvg(Double monthlyAvg) {
		this.monthlyAvg = monthlyAvg;
	}
	public EarlyDesignAndPostArchitecture getEarlyDesignAndPostArchitecture() {
		return earlyDesignAndPostArchitecture;
	}
	public void setEarlyDesignAndPostArchitecture(
			EarlyDesignAndPostArchitecture earlyDesignAndPostArchitecture) {
		this.earlyDesignAndPostArchitecture = earlyDesignAndPostArchitecture;
	}
	public String getEd_RCPX() {
		return ed_RCPX;
	}
	public void setEd_RCPX(String ed_RCPX) {
		this.ed_RCPX = ed_RCPX;
	}
	public String getEd_RUSE() {
		return ed_RUSE;
	}
	public void setEd_RUSE(String ed_RUSE) {
		this.ed_RUSE = ed_RUSE;
	}
	public String getEd_PDIF() {
		return ed_PDIF;
	}
	public void setEd_PDIF(String ed_PDIF) {
		this.ed_PDIF = ed_PDIF;
	}
	public String getEd_PREX() {
		return ed_PREX;
	}
	public void setEd_PREX(String ed_PREX) {
		this.ed_PREX = ed_PREX;
	}
	public String getEd_FCIL() {
		return ed_FCIL;
	}
	public void setEd_FCIL(String ed_FCIL) {
		this.ed_FCIL = ed_FCIL;
	}
	public String getEd_SCED() {
		return ed_SCED;
	}
	public void setEd_SCED(String ed_SCED) {
		this.ed_SCED = ed_SCED;
	}
	public String getEd_PERS() {
		return ed_PERS;
	}
	public void setEd_PERS(String ed_PERS) {
		this.ed_PERS = ed_PERS;
	}
	
}
