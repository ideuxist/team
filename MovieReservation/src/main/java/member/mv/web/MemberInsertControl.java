package member.mv.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.mv.service.MovieService;
import member.mv.vo.MovieVO;

public class MemberInsertControl implements Control {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		String passwdcf = request.getParameter("passwdcf");
		String email = request.getParameter("email");
		
		if (passwd == passwdcf) {
			
		}
		
		MovieVO vo = new MovieVO();
		vo.setId(id);
		vo.setName(name);
		vo.setPasswd(passwd);
		vo.setEmail(email);
		
		
		MovieService service = new MovieService();
		service.memberInsert(vo);
		
		
		request.getRequestDispatcher("member.result/joinOutput.jsp").forward(request, response);

		
	}
}
