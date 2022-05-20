package member.mv.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.mv.dao.MovieDAO;
import member.mv.service.MovieService;
import member.mv.vo.MovieVO;

public class MemberDeleteControl implements Control {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		System.out.println(id);
	
		MovieService service= new MovieService();
		service.memberDelete(id);
		
		request.setAttribute("id", id);
		request.getRequestDispatcher("member.result/deleteOutput.jsp").forward(request, response);
	}

}
