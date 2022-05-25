package member.mv.web;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.mv.service.MovieService;
import member.mv.vo.MovieVO;
import member.mv.vo.ScreeningVO;
import member.mv.vo.SeatReservedVO;
import member.mv.vo.auditoriumVO;

public class ReservationAutoControll implements Control {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// sql 작성을 위해 vo 호출
		MovieVO vo = new MovieVO();
		ScreeningVO screen = new ScreeningVO();
		SeatReservedVO seatReserved = new SeatReservedVO();
		auditoriumVO audi = new auditoriumVO();
		
		//service 호출
		MovieService service = new MovieService();
		
		// movie_id, Screening_id를 담을 list 생성
		List<Integer> list = new ArrayList<Integer>();
		//screening table에 입력 전, 현재 날짜 기준 상영 일자를 위한 배열 생성
		
		List<String> date = new ArrayList<String>();
		List<String> time = new ArrayList<String>();
		List<Integer> screening1 = new ArrayList<Integer>();
		List<Integer> screening2 = new ArrayList<Integer>();
		List<Integer> screening3 = new ArrayList<Integer>();
		// 현재 날짜 기준 5,6,7일 후 상영일자
		
		LocalDate now = LocalDate.now();
		LocalDate fifthDay = now.plusDays(5);
		LocalDate sixthDay = now.plusDays(6);
		LocalDate seventhDay = now.plusDays(7);
		
		// date -> String
		String StringFifthDay = fifthDay.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		String StringSixthDay = sixthDay.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		String StringSeventhDay = seventhDay.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		date.add(StringFifthDay);
		date.add(StringSixthDay);
		date.add(StringSeventhDay);
		time.add("10:00");
		time.add("16:00");
		time.add("20:00");
		
		screening1.add(1);
		screening1.add(2);
		screening1.add(3);
		screening2.add(2);
		screening2.add(3);
		screening2.add(1);
		screening3.add(3);
		screening3.add(1);
		screening3.add(2);
		
		//movie_id 값 가져오기
		list = service.SearchMovieId();
		System.out.println(list);
		System.out.println(list.size());
		
		// 현재 list = ['', '',....];
		// date = ['', '', '']
		// timt =['10:00','16:00','20:00']
		

		for(int i = 5; i<list.size(); i++) { //3관까지 3번의 상영이 있어서 3개만 설정
			int movieIdNum = list.get(i);
			String movieDate = date.get(0);
			int screenLocation = screening1.get(i-5);
				for(int n = 0; n < time.size(); n++) {
					String movieTime = time.get(n);
					// 날짜에 따른 영화 상영일자 생성
					String reserv = movieDate + " " + movieTime;
					service.FindScreeningId(movieIdNum,reserv, screenLocation);
				}
		
		}


		
		
		request.getRequestDispatcher("/member.view/checkDB.tiles").forward(request, response);
		
		

	}

}
