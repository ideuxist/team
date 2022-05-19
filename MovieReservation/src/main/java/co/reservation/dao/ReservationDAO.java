package co.reservation.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import co.reservation.DAO;
import co.reservation.vo.MovieVO;
import co.reservation.vo.ScreeningVO;
import co.reservation.vo.SeatReservedVO;
import co.reservation.vo.SeatVO;

public class ReservationDAO extends DAO {

	public List<ScreeningVO> dateChoice() {
		conn = getConn();
		List<ScreeningVO> list = new ArrayList<ScreeningVO>();
		String sql = "select distinct to_char(screening_start,'yy-mm-dd') as seeDate\r\n"
				+ "from screening \r\n"
				+ "where to_char(screening_start,'yy-mm-dd') >= to_char(sysdate,'yy-mm-dd') \r\n"
				+ "GROUP BY screening_start\r\n"
				+ "order by seeDate"; 
		try {
			psmt=conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				ScreeningVO scr = new ScreeningVO(rs.getString("seeDate"));
				System.out.println(scr);
				list.add(scr);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			disconn();
		}
		return list;
	}

	public List<MovieVO> movieChoice(String date) {
		conn = getConn();
		List<MovieVO> list = new ArrayList<MovieVO>();
		String sql = "select distinct movie_title\r\n"
				+ "from movie m\r\n"
				+ "inner join screening s\r\n"
				+ "on m.movie_id = s.movie_id\r\n"
				+ "where to_char(s.screening_start,'yy-mm-dd')=?";
		try {
			psmt=conn.prepareStatement(sql);
			System.out.println(date);
			psmt.setString(1, date);
			rs=psmt.executeQuery();
			while(rs.next()) {
				MovieVO mov = new MovieVO(rs.getString("movie_title"));
				System.out.println(mov);
				list.add(mov);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			disconn();
		}
		
		return list; 
	}

	public List<ScreeningVO> roundChoice(String title) {
		conn = getConn();
		List<ScreeningVO> list = new ArrayList<ScreeningVO>();
		String sql = "select s.screening_id as sid, to_char(s.screening_start,'hh24:mi') as start_time  "
				+ "from movie m\r\n"
				+ "inner join screening s on m.movie_id=s.movie_id\r\n"
				+ "where s.screening_start >= sysdate and movie_title=?";
		try {
			psmt=conn.prepareStatement(sql);
			psmt.setString(1, title);
			rs=psmt.executeQuery();
			while(rs.next()) {
				ScreeningVO sc = new ScreeningVO(rs.getInt("sid")
						,rs.getString("start_time"));
				list.add(sc);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			disconn();
		}
		return list;
	}

	public List<SeatReservedVO> seatChoice(String screeningId) {
		conn=getConn();
		List<SeatReservedVO> list = new ArrayList<SeatReservedVO>();
		String sql = "select *\r\n"
				+ "from seat_reserved\r\n"
				+ "where screening_id=? and seat_reservation!=1";
		try {
			psmt=conn.prepareStatement(sql);
			psmt.setString(1, screeningId);
			rs=psmt.executeQuery();
			while(rs.next()) {
				SeatReservedVO sr = new SeatReservedVO();
				sr.setSeatId(rs.getInt("seat_id"));
				sr.setReserSeat(rs.getInt("seat_reservation"));
				list.add(sr);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			disconn();
		}
		return list;
	}

	public SeatReservedVO completReservation(String scrId,String selectedSeat) {
		conn=getConn();
		System.out.println(selectedSeat);
		scrId.replaceAll("\\p{Z}", "");
		System.out.println(scrId);
		int id = Integer.parseInt(scrId);
		int seat = Integer.parseInt(selectedSeat);
		System.out.println(id);
		System.out.println(seat);
		SeatReservedVO sr = new SeatReservedVO();
		String sql = "update seat_reserved "
				+ "set seat_reservation = 1 "
				+ "where screening_id=? and seat_id=?";
		try {
			psmt=conn.prepareStatement(sql);
			psmt.setInt(1, id);
			psmt.setInt(2, seat);
			psmt.executeUpdate();
			System.out.println("예약성공");
			sr.setScreeningId(id);
			sr.setSeatId(seat);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			disconn();
		}
		return sr;
		
		
	}	

}
