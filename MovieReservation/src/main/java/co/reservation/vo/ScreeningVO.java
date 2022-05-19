package co.reservation.vo;

public class ScreeningVO {
	private int screeningID;
	private int movieID;
	private int auditoriumID;
	private String screeningStart;
	
	
	

	

	public ScreeningVO() { 
		super();
	}
	
	public ScreeningVO(String screeningStart) {
		this.screeningStart=screeningStart;
	}
	
	public ScreeningVO(int screeningID, String screeningStart) {
		super();
		this.screeningID = screeningID;
		this.screeningStart = screeningStart;
	}

	public ScreeningVO(int screeningID, int movieID, int auditoriumID, String screeningStart) {
		super();
		this.screeningID = screeningID;
		this.movieID = movieID;
		this.auditoriumID = auditoriumID;
		this.screeningStart = screeningStart;
	}
	public int getScreeningID() {
		return screeningID;
	}
	public void setScreeningID(int screeningID) {
		this.screeningID = screeningID;
	}
	public int getMovieID() {
		return movieID;
	}
	public void setMovieID(int movieID) {
		this.movieID = movieID;
	}
	public int getAuditoriumID() {
		return auditoriumID;
	}
	public void setAuditoriumID(int auditoriumID) {
		this.auditoriumID = auditoriumID;
	}
	public String getScreeningStart() {
		return screeningStart;
	}
	public void setScreeningStart(String screeningStart) {
		this.screeningStart = screeningStart;
	}
	@Override
	public String toString() {
		return "Screening [screeningID=" + screeningID + ", movieID=" + movieID + ", auditoriumID=" + auditoriumID
				+ ", screeningStart=" + screeningStart + "]";
	}
	
	
	
}
