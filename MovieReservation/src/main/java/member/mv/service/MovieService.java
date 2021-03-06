package member.mv.service;

import java.util.List;

import member.mv.dao.MovieDAO;
import member.mv.vo.MovieVO;

public class MovieService {
	MovieDAO dao = new MovieDAO();
	
	public void memberDelete(String id) {
		dao.deleteMember(id);
	}
	
	public void memberInsert(MovieVO vo) {
		dao.insertMember(vo);
	}	 
	
	public void memberModify(MovieVO vo) {
		dao.updateMember(vo);
	}
	
	public MovieVO memberSelect(String id) {
		return dao.selectMember(id);
	}

	public List<MovieVO> movieHistory(String id) {
		return dao.movieHistory(id);
	}
	
	public MovieVO duplicateIdCheck(MovieVO vo) {
		return dao.duplicateIdCheck(vo);
	}
	public MovieVO findId(String email) {
		return dao.findId(email);
	}

	public void autoInputDB(MovieVO vo) {
		dao.autoInputDB(vo);
		
	}

	public List<Integer> SearchMovieId() {
		return dao.SearchMovieId();
	}




	public void FindScreeningId(int movieIdNum, String reserv, int screenLocation) {
		dao.FindScreeningId(movieIdNum,reserv, screenLocation);
		
	}
	
}
