package bean;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

public class PertItem {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Integer id;
	private String optimistic;// 乐观值
	private String pessimistic;// 悲观值
	private String mostLikely;// 最可能值
	private double weight;// 权重
	
	@ManyToOne
	@LazyCollection(LazyCollectionOption.FALSE)
	@JoinColumn(name = "pert_id")
	private Pert pert;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getOptimistic() {
		return optimistic;
	}

	public void setOptimistic(String optimistic) {
		this.optimistic = optimistic;
	}

	public String getPessimistic() {
		return pessimistic;
	}

	public void setPessimistic(String pessimistic) {
		this.pessimistic = pessimistic;
	}

	public String getMostLikely() {
		return mostLikely;
	}

	public void setMostLikely(String mostLikely) {
		this.mostLikely = mostLikely;
	}

	public double getWeight() {
		return weight;
	}

	public void setWeight(double weight) {
		this.weight = weight;
	}

	public Pert getPert() {
		return pert;
	}

	public void setPert(Pert pert) {
		this.pert = pert;
	}
}
