package co.reservation.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.reservation.service.BoardService;
import co.reservation.vo.ArticleVO;
@WebServlet("/BoardController")
public class BoardController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	BoardService boardService;
	ArticleVO aricleVO;

	@Override
	public void init(ServletConfig config) throws ServletException {
		boardService = new BoardService();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doHandle(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doHandle(req, resp);
	}

	private void doHandle(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String nextPage = "";
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String action = request.getPathInfo(); // 요청명 가져오기
		System.out.println("action" + action);
		List<ArticleVO> articlesList = new ArrayList<ArticleVO>();
		try {

			if (action == null) {
				// action 값이 널값이라도 db에서 list 받아옴
				articlesList = boardService.listArticles();
				request.setAttribute("articlesList", articlesList);
				nextPage = "/board/listArticle.tiles";
			} else if (action.equals("/listArticles.do")) {
				// action 값이 .do 이면 전체글 조회
				articlesList = boardService.listArticles();// 전체글 조회
				request.setAttribute("articlesList", articlesList);
				nextPage = "/board/listAricle.tiles";
			}
			System.out.println(articlesList);
			RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
			dispatch.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
