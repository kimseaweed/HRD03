package dto;

public class SaleRankDTO {
	@Override
	public String toString() {
		return "SaleRankDTO [custno=" + custno + ", cutname=" + cutname + ", grade=" + grade + ", sale=" + sale + "]";
	}
	public int getCustno() {
		return custno;
	}
	public void setCustno(int custno) {
		this.custno = custno;
	}
	public String getCutname() {
		return cutname;
	}
	public void setCutname(String cutname) {
		this.cutname = cutname;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public int getSale() {
		return sale;
	}
	public void setSale(int sale) {
		this.sale = sale;
	}
	int custno;
	String cutname;
	String grade;
	int sale;
}
