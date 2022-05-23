package co.reservation.vo;

public class SeatVO {
	private int seatId;
	private String seatRow;
	private String seatNumber;
	private int auditorium_id;
	
	public SeatVO() {
		super();
	}
	
	public SeatVO(int seatId, String seatRow, String seatNumber, int auditorium_id) {
		super();
		this.seatId = seatId;
		this.seatRow = seatRow;
		this.seatNumber = seatNumber;
		this.auditorium_id = auditorium_id;
	}
	
	public int getSeatId() {
		return seatId;
	}
	public void setSeatId(int seatId) {
		this.seatId = seatId;
	}
	public String getSeatRow() {
		return seatRow;
	}
	public void setSeatRow(String seatRow) {
		this.seatRow = seatRow;
	}
	public String getSeatNumber() {
		return seatNumber;
	}
	public void setSeatNumber(String seatNumber) {
		this.seatNumber = seatNumber;
	}
	public int getAuditorium_id() {
		return auditorium_id;
	}
	public void setAuditorium_id(int auditorium_id) {
		this.auditorium_id = auditorium_id;
	}
	
	
}
