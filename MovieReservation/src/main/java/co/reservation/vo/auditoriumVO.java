package co.reservation.vo;

public class auditoriumVO {
	
	private int auditorium;
	private String name;
	private int totalSeat;
	
	public auditoriumVO() {
		super();
	}

	public auditoriumVO(int auditorium, String name, int totalSeat) {
		super();
		this.auditorium = auditorium;
		this.name = name;
		this.totalSeat = totalSeat;
	}
	
	public int getAuditorium() {
		return auditorium;
	}
	public void setAuditorium(int auditorium) {
		this.auditorium = auditorium;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getTotalSeat() {
		return totalSeat;
	}
	public void setTotalSeat(int totalSeat) {
		this.totalSeat = totalSeat;
	}

	@Override
	public String toString() {
		return "auditorium [auditorium=" + auditorium + ", name=" + name + ", totalSeat=" + totalSeat + "]";
	}
	
}
