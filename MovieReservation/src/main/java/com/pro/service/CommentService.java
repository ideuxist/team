package com.pro.service;

import java.util.List;

import com.pro.dao.CommentDAO;
import com.pro.vo.MemberVO;
import com.pro.vo.PageVO;

public class CommentService {
	CommentDAO dao = new CommentDAO(); // db CRUD
	
	public void addComment(MemberVO member) {
		dao.addComment(member);
	}
	
	public List<MemberVO> listComment(PageVO pv) {
		return dao.listComment(pv);
	}
	
	public void delComment(String code) {
		dao.delComment(code);
	}
	
	public int getRownum(int movieId) {
		return dao.getRownum(movieId);
	}
}
