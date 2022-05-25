package member.mv.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.mv.service.MovieService;

public class MemberDeleteControl implements Control {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		System.out.println(id);
	
		MovieService service= new MovieService();
		service.memberDelete(id);
		
		request.getSession().invalidate();
		request.getSession().setAttribute("success", "탈퇴가 완료되었습니다");
		response.sendRedirect("/MovieReservation/member.view/login.tiles");
	}

}