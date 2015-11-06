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
@Table(name="earlyDesAndPostArch")
public class EarlyDesignAndPostArchitecture {
		@Id
		@GeneratedValue(strategy=GenerationType.AUTO)
		private Integer id;
		private String type;
		private String language;// 新对象点数
		private Integer linesPerFP;
		private Double monthlyAvg;
		private Double effort;// 软件生命周期阶段
		private Double duration;// 估算目的
		private Double cost;
		
		@OneToOne
		@JoinColumn(name = "param_id")
		private Param param;
		
		@ManyToOne
		@LazyCollection(LazyCollectionOption.FALSE)
		@JoinColumn(name = "countSession_id")
		private CountSession countSession;

		public Integer getId() {
			return id;
		}

		public void setId(Integer id) {
			this.id = id;
		}

		public Double getMonthlyAvg() {
			return monthlyAvg;
		}

		public void setMonthlyAvg(Double monthlyAvg) {
			this.monthlyAvg = monthlyAvg;
		}

		public Double getEffort() {
			return effort;
		}

		public void setEffort(Double effort) {
			this.effort = effort;
		}

		public Double getDuration() {
			return duration;
		}

		public void setDuration(Double duration) {
			this.duration = duration;
		}

		public Double getCost() {
			return cost;
		}

		public void setCost(Double cost) {
			this.cost = cost;
		}

		public CountSession getCountSession() {
			return countSession;
		}

		public void setCountSession(CountSession countSession) {
			this.countSession = countSession;
		}

		public String getType() {
			return type;
		}

		public void setType(String type) {
			this.type = type;
		}

		public String getLanguage() {
			return language;
		}

		public void setLanguage(String language) {
			this.language = language;
		}

		public Integer getLinesPerFP() {
			return linesPerFP;
		}

		public void setLinesPerFP(Integer linesPerFP) {
			this.linesPerFP = linesPerFP;
		}
}
