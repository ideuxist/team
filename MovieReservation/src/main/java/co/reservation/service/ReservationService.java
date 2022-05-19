package co.reservation.service;

import java.util.List; 

import co.reservation.dao.ReservationDAO;
import co.reservation.vo.MovieVO;
import co.reservation.vo.ScreeningVO;
import co.reservation.vo.SeatReservedVO;


public class ReservationService {
	ReservationDAO dao = new ReservationDAO();
	
	public List<ScreeningVO> choiceDate(){
		return dao.dateChoice();
		
	}

	public List<MovieVO> choiceMoive(String date) {
		return dao.movieChoice(date);
	}

	public List<ScreeningVO> choiceRound(String title) {
		return dao.roundChoice(title);
	}

	public List<SeatReservedVO> choiceSeat(String screeningId) {
		return dao.seatChoice(screeningId);
	}

	public SeatReservedVO reservation(String scrId,String selectedSeat) {
		return dao.completReservation(scrId,selectedSeat);
	} 
		
}
		
