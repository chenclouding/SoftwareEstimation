package bean;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

@Entity
@Table(name="pertItem")
public class PertItem {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Integer id;
	private double optimistic;// 乐观值
	private double pessimistic;// 悲观值
	private double mostLikely;// 最可能值
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

	public double getOptimistic() {
		return optimistic;
	}

	public void setOptimistic(double optimistic) {
		this.optimistic = optimistic;
	}

	public double getPessimistic() {
		return pessimistic;
	}

	public void setPessimistic(double pessimistic) {
		this.pessimistic = pessimistic;
	}

	public double getMostLikely() {
		return mostLikely;
	}

	public void setMostLikely(double mostLikely) {
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
