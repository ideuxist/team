package member.mv.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import member.mv.vo.MovieVO;

public class MovieDAO extends DAO{
	
	 public MovieVO duplicateIdCheck(MovieVO vo){	
	        conn = getConnect();
	        String sql="SELECT * FROM movie_member WHERE id=? and passwd = ?";
	       
	        try {
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, vo.getId());
				psmt.setString(2, vo.getPasswd());
				rs = psmt.executeQuery();
				if(rs.next()) {
					vo.setId(rs.getString("id"));
					vo.setPasswd(rs.getString("passwd"));
					System.out.println("건수 확인용");

				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				disconnect();
			}
		return vo;
	        
	    } // end duplicateIdCheck()

	
	 public MovieVO findPw(String id, String email) {
			conn = getConnect();
			String sql = "select * from movie_member where id=? and email =?";
			try {
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, id);
				psmt.setString(2, email);
				
				rs = psmt.executeQuery();
				while(rs.next()) {
					MovieVO vo = new MovieVO();
					vo.setId(rs.getString("id"));
					vo.setPasswd(rs.getString("passwd"));
					return vo;
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return null;
		}
		
		public MovieVO findId(String email) {
			conn = getConnect();
			String sql = "select id from movie_member where email=?";
			try {
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, email);
				rs = psmt.executeQuery();
				while(rs.next()) {
					MovieVO vo = new MovieVO();
					vo.setId(rs.getString("id"));
					return vo;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return null;
			
		}
		
		 public boolean duplicateIdCheck(String id)
		    {	
			 	boolean x = false;
		        conn = getConnect();
		        String sql="SELECT ID FROM movie_MEMBER WHERE ID=?";
		        try {
					psmt = conn.prepareStatement(sql);
					psmt.setString(1, id);
					rs = psmt.executeQuery();
					if(rs.next()) x=true;
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} finally {
					disconnect();
				}
				return x;
		        
		    } // end duplicateIdCheck()

		
	private static MovieDAO instance;
	    
	    // 싱글톤 패턴
	    public MovieDAO(){}
	    public static MovieDAO getInstance(){
	        if(instance==null)
	            instance=new MovieDAO();
	        return instance;
	    }


		
		public List<MovieVO> movieHistory(String id) {
			conn= getConnect();
			List<MovieVO> list = new ArrayList<MovieVO>();
			String sql="select * from movie_history where id = ?";
			try {
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, id);
				rs = psmt.executeQuery();
				while(rs.next()) {
					MovieVO vo = new MovieVO();
					vo.setMovieTitle(rs.getString("movie_title"));
					vo.setMovieRoom(rs.getString("auditorium_id"));
					vo.setMovieDate(rs.getString("screening_start"));
					
					list.add(vo);
				}
				return list;
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				disconnect();
			}
			return null;
		}
		

		public void insertMember(MovieVO vo) {
			conn = getConnect();
			String sql = "insert into movie_member (name, id, passwd, email) values (?,?,?,?)";
			
			try {
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, vo.getName());
				psmt.setString(2, vo.getId());
				psmt.setString(3, vo.getPasswd());
				psmt.setString(4, vo.getEmail());
				
				int r = psmt.executeUpdate();
				System.out.println(r +"건 입력됨");
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				disconnect();
			}
			
		}

		public void updateMember(MovieVO vo) {
			conn = getConnect();
			String sql = "update movie_member set passwd = ?, email = ? where id=?";
			try {
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, vo.getPasswd());
				psmt.setString(2, vo.getEmail());
				psmt.setString(3, vo.getId());
				int r = psmt.executeUpdate();
				System.out.println(r+"건 수정됨");
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				disconnect();
			}
			
			
			
		}

		public MovieVO selectMember(String id) {
			conn= getConnect();
			String sql = "select * from movie_member where id=?";
			try {
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, id);
				
				rs = psmt.executeQuery();
				
				while(rs.next()) {
					MovieVO vo = new MovieVO();
					vo.setName(rs.getString("name"));
					vo.setId(rs.getString("id"));
					vo.setPasswd(rs.getString("passwd"));
					vo.setEmail(rs.getString("email"));
					return vo;
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				disconnect();
			}
			return null;
			 
		}


		public void autoInputDB(MovieVO vo) {
			conn = getConnect();
			// 현재 DB에 등록된 영화인지 체크
			String sql = "SELECT * FROM movie where id = ?";
			
			try {
				psmt = conn.prepareStatement(sql);
				// 도달하는지 체크
				System.out.println("DAO 내부입니다." + vo.getId());
				
				psmt.setInt(1,Integer.parseInt(vo.getId()));
				int r = psmt.executeUpdate();
				if(r == 0) {
					System.out.println("등록된 영화가 없습니다. 등록을 진행합니다.");
					String sql2 = "insert movie (movie_id, movie_title, duration_min) values (?,?,?)";
				
					psmt = conn.prepareStatement(sql2);
					psmt.setInt(1, Integer.parseInt(vo.getId()));
					psmt.setString(2, vo.getMovieTitle());
					psmt.setInt(3, Integer.parseInt(vo.getRuntime()));
			
					rs = psmt.executeQuery();
				} else {
					System.out.println("중복된 영화입니다.");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
					
		}


}
