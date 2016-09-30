package com.tistory.devhong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tistory.devhong.dao.BoardDAO;
import com.tistory.devhong.vo.BoardVO;

@Service
public class BoardService {

	@Autowired
	private BoardDAO dao;
	
	public int regist(BoardVO vo) throws Exception{
		return dao.create(vo);
	}
	
	public BoardVO read(int bno) throws Exception{
		System.out.println("service bno : " + bno);
		return dao.read(bno);
	}
	
	public void modify(BoardVO vo)throws Exception{
		dao.update(vo);
	}
	
	public void remove(int bno)throws Exception{
		dao.delete(bno);
	}
	public List<BoardVO> listAll() throws Exception{
		return dao.listAll();
	}
}
