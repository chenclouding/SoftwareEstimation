package bean;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="applicationComposition")
public class ApplicationComposition {
		@Id
		@GeneratedValue(strategy=GenerationType.AUTO)
		private Integer id;
		private Integer nop;// 新对象点数
		private Integer prod;
		private Double monthlyAvg;
		private Double effort;
/*		private Double duration;*/
		private Double cost;
		
		@OneToOne
		@JoinColumn(name = "countSession_id")
		private CountSession countSession;

		public Integer getId() {
			return id;
		}

		public void setId(Integer id) {
			this.id = id;
		}

		public Integer getNop() {
			return nop;
		}

		public void setNop(Integer nop) {
			this.nop = nop;
		}

		public Integer getProd() {
			return prod;
		}

		public void setProd(Integer prod) {
			this.prod = prod;
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

/*		public Double getDuration() {
			return duration;
		}

		public void setDuration(Double duration) {
			this.duration = duration;
		}*/

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
}
