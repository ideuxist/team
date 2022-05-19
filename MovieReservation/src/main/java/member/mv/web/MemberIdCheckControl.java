package member.mv.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.mv.dao.MovieDAO;
import member.mv.service.MovieService;
import member.mv.vo.MovieVO;

public class MemberIdCheckControl implements Control {

//	@Override
//	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String id = request.getParameter("id");
//        MovieDAO dao = MovieDAO.getInstance();
//        
//        boolean result = dao.duplicateIdCheck(id);
//        
//        response.setContentType("text/html;charset=euc-kr");
//        PrintWriter out = response.getWriter();
// 
//        if(result)    out.println("0"); // 아이디 중복
//        else        out.println("1");
//        
//        out.close();
//        
//	}
	
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MovieService service = new MovieService();
		
		String id = request.getParameter("id");
		String pw = request.getParameter("password");
		MovieVO vo = new MovieVO();
		System.out.println(1);
		// id, passwd 값이 모두 있어야 함.
		if(id.isBlank() || pw.isBlank()) {
			id = null;
			pw = null;
			HttpSession session = null;
			session = request.getSession();
			session.setAttribute("id", vo.getId());
			session.setAttribute("pw", vo.getPasswd());
			request.getRequestDispatcher("").forward(request, response);
		} else {
			// id, passwd를 DAO에서 사용하기 위해 MovieVO 형태로 담음.
			vo.setId(id);
			vo.setPasswd(pw);
			
			// DAO 실행
			vo = service.duplicateIdCheck(vo);
			
	        
	        response.setContentType("text/html;charset=UTF-8");
	        PrintWriter out = response.getWriter();
	 
	        HttpSession session = null;
	        String chkId = vo.getId();
       
	     if(chkId == null) {
				id = null;
				pw = null;
				session = null;
				session = request.getSession();
				session.setAttribute("id", id);
				session.setAttribute("pw", id);
				request.getRequestDispatcher("WEB-INF/view/login.jsp").forward(request, response);
	     }
			session = request.getSession();
			session.setAttribute("id", vo.getId());
			session.setAttribute("pw", vo.getPasswd());
			
			
	        String path = "myapp.homepage.tiles";
	        request.getRequestDispatcher(path).forward(request, response);
		}
		
        
       
	}

}
