package co.reservation.vo;

public class MovieVO {
	
	private int movieId;
	private String movieTitle;
	private int durationMin;
	private int audi;
	
	public MovieVO(int movieId, String movieTitle, int durationMin, int audi) {
		super();
		this.movieId = movieId;
		this.movieTitle = movieTitle;
		this.durationMin = durationMin;
		this.audi = audi;
	}

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
	


	public int getAudi() {
		return audi;
	}

	public void setAudi(int audi) {
		this.audi = audi;
	}

	public MovieVO(String movieTitle, int audi) {
		super();
		this.movieTitle = movieTitle;
		this.audi = audi;
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
		return "MovieVO [movieId=" + movieId + ", movieTitle=" + movieTitle + ", durationMin=" + durationMin + ", audi="
				+ audi + "]";
	}
	
	
}
