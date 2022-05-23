package co.reservation.dao;

import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import co.reservation.DAO;
import co.reservation.vo.ArticleVO;

public class BoardDAO extends DAO{
	private DataSource dataFactory;
	
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

	private int getNewArticleNO() {
		conn=getConn();
		String sql = "select max(articleno) from free_board";
		try {
			psmt=conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			if(rs.next()) {
				return (rs.getInt(1)+1);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			disconn();
		}
		return 0;
	}

	public void insertNewArticle(ArticleVO article) {
		try {
			int articleNO=getNewArticleNO();
			conn=getConn();
			System.out.println(articleNO);
			int parentNO = article.getParentNO();
			String title = article.getTitle();
			String content = article.getContent();
			String id = article.getId();
			String imageFileName = article.getImageFileName();
			String sql = "insert into free_board (articleno,parentno,title,content,imagefilename,id)"
					+ "values(?,?,?,?,?,?)";
			psmt=conn.prepareStatement(sql);
			psmt.setInt(1,articleNO);
			psmt.setInt(2, parentNO);
			psmt.setString(3, title);
			psmt.setString(4,content);
			psmt.setString(5,imageFileName);
			psmt.setString(6, id);
			psmt.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			disconn();
		}
	}

	public ArticleVO selectArticle(int articleNO) {
	ArticleVO article= new ArticleVO();
	conn=getConn();
	String sql = "select articleno,parentno,title,content,imagefilename,id,writedate from free_board where articleno=?";
	try {
		psmt= conn.prepareStatement(sql);
		psmt.setInt(1, articleNO);
		rs=psmt.executeQuery();
		rs.next();
		int _articleNO=rs.getInt("articleno");
		int parentNO=rs.getInt("parentno");
		String title=rs.getString("title");
		String content = rs.getString("content");
		String imageFileName = rs.getString("imagefilename");
		String id = rs.getString("id");
		Date writeDate=rs.getDate("writedate");
		
		article.setArticleNO(_articleNO);
		article.setParentNO(parentNO);
		article.setTitle(title);
		article.setContent(content);
		article.setImageFileName(imageFileName);
		article.setId(id);
		article.setWriteDate(writeDate);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally {
		disconn();
	}
	return article;
	}

}
