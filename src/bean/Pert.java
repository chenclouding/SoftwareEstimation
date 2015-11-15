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

@Entity
@Table(name="pert")
public class Pert {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Integer id;
	private String estimateObject;// 估算内容
	private double pointEstimate;// 点估计值
	private double intervalEstimateMin;// 区间估计值（最小）
	private double intervalEstimateMax;// 区间估计值（最大）
	
	@ManyToOne
	@LazyCollection(LazyCollectionOption.FALSE)
	@JoinColumn(name = "countSession_id")
	private CountSession countSession;

	public String getEstimateObject() {
		return estimateObject;
	}

	public void setEstimateObject(String estimateObject) {
		this.estimateObject = estimateObject;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public double getPointEstimate() {
		return pointEstimate;
	}

	public void setPointEstimate(double pointEstimate) {
		this.pointEstimate = pointEstimate;
	}

	public double getIntervalEstimateMin() {
		return intervalEstimateMin;
	}

	public void setIntervalEstimateMin(double intervalEstimateMin) {
		this.intervalEstimateMin = intervalEstimateMin;
	}

	public double getIntervalEstimateMax() {
		return intervalEstimateMax;
	}

	public void setIntervalEstimateMax(double intervalEstimateMax) {
		this.intervalEstimateMax = intervalEstimateMax;
	}

	public CountSession getCountSession() {
		return countSession;
	}

	public void setCountSession(CountSession countSession) {
		this.countSession = countSession;
	}
	
}
