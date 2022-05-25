package member.mv.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.mv.service.MovieService;
import member.mv.vo.MovieVO;

public class autoInputDBControl implements Control {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String[] id = request.getParameterValues("inputMovieId");
		String[] title = request.getParameterValues("inputMovieTitle");
		String[] runtime = request.getParameterValues("inputMovieRuntime");

	
		MovieService service = new MovieService();
		MovieVO vo = new MovieVO();
		for(int i =0; i<4 ; i++) {

			
			vo.setId(id[i]);
			vo.setMovieTitle(title[i]);
			vo.setRuntime(runtime[i]);
			
			service.autoInputDB(vo);
		}
		
		request.getRequestDispatcher("/member.view/checkDB.tiles").forward(request, response);
	}

}
