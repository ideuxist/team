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
		String sql = "select distinct to_char(screening_start,'yy/mm/dd') as seeDate\r\n"
				+ "from screening \r\n"
				+ "where to_char(screening_start,'yy/mm/dd') >= to_char(sysdate,'yy/mm/dd') \r\n"
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
		String sql = "select distinct movie_title,auditorium_id\r\n"
				+ "from movie m\r\n"
				+ "inner join screening s\r\n"
				+ "on m.movie_id = s.movie_id\r\n"
				+ "where to_char(s.screening_start,'yy/mm/dd')=?"
				+ "order by auditorium_id asc";
		try {
			psmt=conn.prepareStatement(sql);
			System.out.println(date);
			psmt.setString(1, date);
			rs=psmt.executeQuery();
			while(rs.next()) {
				MovieVO mov = new MovieVO(rs.getString("movie_title"),rs.getInt("auditorium_id"));
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

	public List<ScreeningVO> roundChoice(String title,String date) {
		conn = getConn();
		List<ScreeningVO> list = new ArrayList<ScreeningVO>();
		String sql = "select s.auditorium_id,s.screening_id as sid, to_char(s.screening_start,'hh24:mi') as start_time  "
				+ "from movie m\r\n"
				+ "inner join screening s on m.movie_id=s.movie_id\r\n"
				+ "where to_char(s.screening_start,'yy/mm/dd') = ? and movie_title=?";
		
		try {
			psmt=conn.prepareStatement(sql);
			psmt.setString(1, date);
			psmt.setString(2, title);
			rs=psmt.executeQuery();
			while(rs.next()) {
				ScreeningVO sc = new ScreeningVO(rs.getInt("auditorium_id"),rs.getInt("sid")
						,rs.getString("start_time"));
				list.add(sc);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			disconn();
		}
		System.out.println("상영관 시작시간출력"+list);
		return list;
	}

	public List<SeatReservedVO> seatChoice(String screeningId) {
		conn=getConn();
		List<SeatReservedVO> list = new ArrayList<SeatReservedVO>();
		String sql = "select *\r\n"
				+ "from seat_reserved\r\n"
				+ "where screening_id=?"
				+ "order by seat_id";
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

	public SeatReservedVO completReservation(String scrId,String selectedSeat,String memberId) {
		conn=getConn();
		System.out.println(selectedSeat);
		System.out.println(scrId);
		int id = Integer.parseInt(scrId);
		int seat = Integer.parseInt(selectedSeat);
		SeatReservedVO sr = new SeatReservedVO();
		String sql = "update seat_reserved set seat_reservation = 1,id=? where screening_id=? and seat_id=?";
		try {
			psmt=conn.prepareStatement(sql);
			psmt.setString(1, memberId);
			psmt.setInt(2, id);
			psmt.setInt(3, seat);
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

	public ScreeningVO auditoriumIdSearch(String screeningId) {
		conn = getConn();
		ScreeningVO vo = new ScreeningVO();
		//int id = Integer.parseInt(screeningId);
		String sql = "select auditorium_id, to_char(screening_start,'hh24:mi') as str_time from screening where screening_id=?";
		try {
			psmt=conn.prepareStatement(sql);
			psmt.setString(1, screeningId);
			rs = psmt.executeQuery();
			while(rs.next()) {
			
			vo.setAuditoriumID(rs.getInt("auditorium_id"));
			vo.setScreeningStart(rs.getString("str_time"));
			
			
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			disconn();
		}
	    System.out.println("찾기 힘드네"+vo);
		return vo; 
	}	

}
