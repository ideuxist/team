package co.reservation.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.reservation.service.ReservationService;
import co.reservation.vo.MovieVO;
import co.reservation.vo.ScreeningVO;
import co.reservation.vo.SeatReservedVO;

@WebServlet("/screeningChoice")
public class ScreeningChoice extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ScreeningChoice() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
			dohandle(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		dohandle(request,response); 
	} 

	protected void dohandle(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String action = request.getParameter("choice");
		
		if (action.equals("choiceDate")){
			ReservationService service = new ReservationService();
			List<ScreeningVO> dateList = service.choiceDate();
			request.setAttribute("seeDate", dateList);
			request.getRequestDispatcher("reservation/reservation.tiles").forward(request, response);
		
		} else if(action.equals("currentMovie")) {
			String date = request.getParameter("selectedDate");
			ReservationService service = new ReservationService();
			List<MovieVO> movieList = service.choiceMoive(date);
			request.setAttribute("selectedDate", date);
			request.setAttribute("movieList", movieList);
			request.getRequestDispatcher("reservation/reservation.tiles").forward(request, response);
		
		}else if (action.equals("round")) {
			String date = request.getParameter("selectedDate");
			System.out.println("선택된날짜 확인"+date);
			String movie = request.getParameter("selectedMovie");
			ReservationService service = new ReservationService();
			List<ScreeningVO> screening = service.choiceRound(movie,date);
			request.setAttribute("selectedDate", date);
			request.setAttribute("selectedMovie", movie);
			request.setAttribute("round", screening);
			request.getRequestDispatcher("reservation/reservation.tiles").forward(request, response);
			
		}else if (action.equals("searchSeat")) {
			String date = request.getParameter("date");
			String movie = request.getParameter("movie");
			String screeningId=request.getParameter("screeningID");
			ReservationService service = new ReservationService();
			ScreeningVO screening =service.searchAuditoriumId(screeningId);
			List<SeatReservedVO> seat = service.choiceSeat(screeningId);
			request.setAttribute("selectedDate", date);
			request.setAttribute("selectedMovie", movie);
			request.setAttribute("selectedScreeningId", screeningId);
			request.setAttribute("selectedAuditoriumId", screening);
			request.setAttribute("seat", seat);
			request.getRequestDispatcher("reservation/reservation.tiles").forward(request, response);
		
		}else if (action.equals("doReservation")) {
			HttpSession session = request.getSession();
			
			String date =request.getParameter("date");
			String movie = request.getParameter("movie");
			String startTime = request.getParameter("round");
			String scrId=request.getParameter("selectedScreeningId");
			String selectedSeat = request.getParameter("selectedSeat");
			String memberId=(String) session.getAttribute("id");
			System.out.println(memberId);
			ReservationService service = new ReservationService();
			SeatReservedVO sr = service.reservation(scrId,selectedSeat,memberId);
			System.out.println(sr);
			request.setAttribute("seldate", date);
			request.setAttribute("selmovie", movie);
			request.setAttribute("selround", startTime);
			request.setAttribute("reserInfo",sr);
			request.setAttribute("selseat", selectedSeat);
			request.getRequestDispatcher("reservation/reservation.tiles").forward(request, response);
			}
		} 
		
	}

