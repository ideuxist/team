package member.mv.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.mv.service.MovieService;
import member.mv.vo.MovieVO;

public class MemberUpdateControl implements Control {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String passwd = request.getParameter("passwd");
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		
		MovieVO vo = new MovieVO();
		vo.setId(id);
		vo.setPasswd(passwd);
		vo.setEmail(email);
		
		MovieService service = new MovieService();
		service.memberModify(vo);
		
		request.getRequestDispatcher("testIndex.jsp").forward(request, response);
	}

}
