package co.reservation.dao;

import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import co.reservation.DAO;
import co.reservation.vo.ArticleVO;

public class BoardDAO extends DAO{
	
	
	public List<ArticleVO> selectAllArticles() {
	List<ArticleVO> articleList = new ArrayList();
	conn=getConn();
	String sql = "SELECT LEVEL,articleno,parentno,title,content,id,writeDate"
			 + " from free_board"
		     + " START WITH  parentno=0" + " CONNECT BY PRIOR articleno=parentno"
		     + " ORDER SIBLINGS BY articleNO DESC";
	try {
		psmt = conn.prepareStatement(sql);
		rs = psmt.executeQuery();
		while(rs.next()) {
			int level = rs.getInt("level");
			int aricleNO = rs.getInt("articleNO");
			int parentNO = rs.getInt("parentNO");
			String title = rs.getString("title");
			String content = rs.getString("content");
			String id = rs.getString("id");
			Date writeDate = rs.getDate("writeDate");
			ArticleVO article = new ArticleVO();
			article.setLevel(level);
			article.setArticleNO(aricleNO);
			article.setParentNO(parentNO);
			article.setTitle(title);
			article.setContent(content);
			article.setId(id);
			article.setWriteDate(writeDate);
			articleList.add(article);
		}
		rs.close();
		psmt.close();
		conn.close();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally {
		disconn();
	}
	return articleList;
	}

}
