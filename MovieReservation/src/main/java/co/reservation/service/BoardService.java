package co.reservation.service;

import java.util.List;

import co.reservation.dao.BoardDAO;
import co.reservation.vo.ArticleVO;

public class BoardService {
	BoardDAO boardDAO;

	public BoardService() {
			boardDAO = new BoardDAO();
		}
	
	public List<ArticleVO> listArticles() {
		List<ArticleVO> articleList = boardDAO.selectAllArticles();
		return articleList;
	}

	


}
