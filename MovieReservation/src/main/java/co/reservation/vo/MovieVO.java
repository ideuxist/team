package co.reservation.vo;

public class MovieVO {
	
	private int movieId;
	private String movieTitle;
	private int durationMin;
	
	public MovieVO() {
		super();
	}

	public MovieVO(String movieTitle) {
		super();
		this.movieTitle = movieTitle;
	}

	public MovieVO(int movieId, String movieTitle, int durationMin) {
		super();
		this.movieId = movieId;
		this.movieTitle = movieTitle;
		this.durationMin = durationMin;
	}
	
	public int getMovieId() {
		return movieId;
	}
	public void setMovieId(int movieId) {
		this.movieId = movieId;
	}
	public String getMovieTitle() {
		return movieTitle;
	}
	public void setMovieTitle(String movieTitle) {
		this.movieTitle = movieTitle;
	}
	public int getDurationMin() {
		return durationMin;
	}
	public void setDurationMin(int durationMin) {
		this.durationMin = durationMin;
	}

	@Override
	public String toString() {
		return "movie [movieId=" + movieId + ", movieTitle=" + movieTitle + ", durationMin=" + durationMin + "]";
	}
	
	
}
