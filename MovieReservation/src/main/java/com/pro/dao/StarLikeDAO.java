package com.pro.dao;

import java.sql.SQLException;

import com.pro.DAO;
import com.pro.vo.StarLikeVO;

public class StarLikeDAO extends DAO {

	public void getRating(StarLikeVO slv) {

		conn = getConnect();

		String sql = "select avg(cm_stars) from info_cmt where movie_id = ?";

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, slv.getMovieId());
			rs = psmt.executeQuery();
			if (rs.next()) {
				slv.setRating(rs.getDouble("avg(cm_stars)"));;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disConnect();
		}
	}

	public void getLikes(StarLikeVO slv) {
		conn = getConnect();

		String sql = "select count(*) from info_like where movie_id = ?";

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, slv.getMovieId());
			rs = psmt.executeQuery();
			if (rs.next()) {
				slv.setLikes(rs.getInt("count(*)"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disConnect();
		}
	}

	public void getIndivLike(StarLikeVO slv) {
		conn = getConnect();

		String sql = "SELECT\n"+
				"    COUNT(*)\n"+
				"FROM\n"+
				"    info_like\n"+
				"WHERE\n"+
				"        movie_id = ?\n"+
				"    AND usr_id = ?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, slv.getMovieId());
			psmt.setString(2, slv.getId());
			rs = psmt.executeQuery();
			if (rs.next()) {
				slv.setIndivLike(rs.getInt("COUNT(*)"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disConnect();
		}
	}
	
	public void checkLike (StarLikeVO slv) {
		
		conn = getConnect();
		
		String sql = "SELECT\n"+
				"    movie_id\n"+
				"FROM\n"+
				"    info_like\n"+
				"WHERE\n"+
				"        movie_id = ?\n"+
				"    AND usr_id = ?";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, slv.getMovieId());
			psmt.setString(2, slv.getId());
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				slv.setIndivLike(1);
			} else {
				slv.setIndivLike(0);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disConnect();
		}

	}

	public void like(StarLikeVO slv) {
		conn = getConnect();

		String sql = "INSERT INTO info_like (\n"+

				"    usr_id,\n"+
				"    movie_id\n"+
				") VALUES (\n"+
			
				"    ?,\n"+
				"    ?\n"+
				")";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, slv.getId());
			psmt.setInt(2, slv.getMovieId());
			int r = psmt.executeUpdate();
			slv.setIndivLike(1);
			
			if (r>0) {
				System.out.println("done");
			} else {
				System.out.println("failed");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disConnect();
		}
	}
	
	public void unLike(StarLikeVO slv) {
		conn = getConnect();

		String sql = "DELETE FROM info_like\n"+
				"WHERE\n"+
				"    usr_id = ? and movie_id = ?";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, slv.getId());
			psmt.setInt(2, slv.getMovieId());
			int r = psmt.executeUpdate();
			slv.setIndivLike(0);
			
			if (r>0) {
				System.out.println("done");
			} else {
				System.out.println("failed");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disConnect();
		}
	}

}
