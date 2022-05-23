package com.pro.web;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class InfoController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	HashMap<String, Control> list;

	String charset;

	public InfoController() {
		super();
	}

	@Override
	public void init(ServletConfig config) throws ServletException {

		charset = config.getInitParameter("charset");

		list = new HashMap<String, Control>();

		// comment
		list.put("/commentAdd.go", new CmAddControl());
		list.put("/commentList.go", new CmListControl());
		list.put("/commentDel.go", new CmDelControl());
		list.put("/commentPage.go", new CmPageControl());
		
		// likes and rating
		list.put("/getIndivLike.go", new IndivLikeGetControl());
		list.put("/getLikes.go", new LikesGetControl());
		list.put("/getRating.go", new RatingGetControl());
		list.put("/clickLike.go", new LikeControl());
		
		// payment
		list.put("/payment.go", new PayControl());
		
		System.out.println("pass init");
		
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		System.out.println("into service");
		
		req.setCharacterEncoding(charset);

		String uri = req.getRequestURI();
		String context = req.getContextPath();
		String path = uri.substring(context.length());
		
		System.out.println(uri + "1");
		System.out.println(context + "2");
		System.out.println(path + "3");

		Control exeCon = list.get(path);
		System.out.println("pass service");
		exeCon.execute(req, resp);
		

	}

}
