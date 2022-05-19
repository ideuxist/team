package member.mv.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.mv.dao.MovieDAO;
import member.mv.service.MovieService;
import member.mv.vo.MovieVO;

public class MovieHistoryControl implements Control {
	
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		HttpSession session = null;
		session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		MovieService service = new MovieService();
		service.movieHistory(id);
		
		List<MovieVO> list = service.movieHistory(id);
		request.setAttribute("all", list);
		request.getRequestDispatcher("member.result/historyOutput.jsp").forward(request, response);
		

	}

}
