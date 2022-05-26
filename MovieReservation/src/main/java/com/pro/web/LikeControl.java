package com.pro.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pro.service.InfoService;
import com.pro.vo.StarLikeVO;

public class LikeControl implements Control {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");

		StarLikeVO slv = new StarLikeVO();

		slv.setId(request.getParameter("id"));
		slv.setMovieId(Integer.parseInt(request.getParameter("movieId")));
		slv.setIndivLike(Integer.parseInt(request.getParameter("bool")));

		InfoService service = new InfoService();

		int bool = slv.getIndivLike();

		service.checkLike(slv);

		if (bool == 0) {
			service.unLike(slv);
		} else if (bool == 1) {
			service.like(slv);
		}

	}
}
