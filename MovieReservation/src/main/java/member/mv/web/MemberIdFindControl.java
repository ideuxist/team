package member.mv.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.mv.service.MovieService;
import member.mv.vo.MovieVO;

public class MemberIdFindControl implements Control {
	
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
	
			MovieService dao = new MovieService();
			MovieVO vo = dao.findId(email);
			if (vo == null) {
				request.setAttribute("error", "이메일 주소를 다시 확인해 주세요");
				request.getRequestDispatcher("member.view/findIdForm.jsp").forward(request, response);
			} else {
				request.setAttribute("vo", vo);
				request.getRequestDispatcher("member.result/findIdOutput.jsp").forward(request, response);
			}
		
	}

}
