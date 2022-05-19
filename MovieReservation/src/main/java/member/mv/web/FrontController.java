package member.mv.web;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FrontController extends HttpServlet{
	HashMap<String, Control> list =null;
	String charset = null;
	
	public void init(ServletConfig config) throws ServletException {
		charset = config.getInitParameter("charset");
		list = new HashMap<String, Control>();
		list.put("/memberInsert.do", new MemberInsertControl());
		list.put("/movieHistory.do", new MovieHistoryControl());
		list.put("/memberUpdate.do", new MemberUpdateControl());
		list.put("/memberSearch.do", new MemberSearchControl());
		list.put("/memberIdCheck.do", new MemberIdCheckControl());
		list.put("/memberFindId.do", new MemberIdFindControl());
		list.put("/memberFindPw.do", new MemberPwFindControl());
	}
	
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding(charset);
		
		String url = req.getRequestURI();
		String context = req.getContextPath();
		String path = url.substring(context.length());
		
		Control exeCon = list.get(path);
		exeCon.execute(req, resp);
	}
	
}
