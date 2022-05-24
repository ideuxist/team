//package member.mv.web;
//
//import java.io.IOException;
//import java.util.ArrayList;
//import java.util.List;
//
//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import member.mv.service.MovieService;
//import member.mv.vo.MovieVO;
//import member.mv.vo.ScreeningVO;
//import member.mv.vo.SeatReservedVO;
//import member.mv.vo.auditoriumVO;
//
//public class ReservationAutoControll implements Control {
//
//	@Override
//	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// sql 작성을 위해 vo 호출
//		MovieVO vo = new MovieVO();
//		ScreeningVO screen = new ScreeningVO();
//		SeatReservedVO seatReserved = new SeatReservedVO();
//		auditoriumVO audi = new auditoriumVO();
//		//service 호출
//		MovieService service = new MovieService();
//		// movie_id, Screening_id를 담을 list 생성
//		List<Integer> list = new ArrayList<Integer>();
//		List<Integer> list2 = new ArrayList<Integer>();
//		
//		//movie_id 값 가져오기
//		list = service.SearchMovieId();
//		System.out.println(list);
//		System.out.println(list.size());
//		// 날짜에 따른 영화 상영일자 생성
//		service.FindScreeningId(list); // 8 * 3 = 24;
//		
//		// 
//		
//		
//		
//
//	}
//
//}
