package member.mv.vo;

public class MovieVO {
	String name;
	String id;
	String passwd;
	String email;
	String movieTitle;
	String movieDate;
	String movieRoom;
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getMovieRoom() {
		return movieRoom;
	}
	public void setMovieRoom(String movieRoom) {
		this.movieRoom = movieRoom;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getMovieTitle() {
		return movieTitle;
	}
	public void setMovieTitle(String movieTitle) {
		this.movieTitle = movieTitle;
	}
	public String getMovieDate() {
		return movieDate;
	}
	public void setMovieDate(String movieDate) {
		this.movieDate = movieDate;
	}
	@Override
	public String toString() {
		return "MovieVO [movieTitle=" + movieTitle + ", movieDate=" + movieDate + ", movieRoom=" + movieRoom + "]";
	}
	
	
	
	
}
