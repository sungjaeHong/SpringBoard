package com.tistory.devhong.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tistory.devhong.vo.BoardVO;

@Repository
public class BoardDAO {
	
	@Autowired
	private SqlSession session;
	private static String namespace = "com.tistory.devhong.mapper.BoardMapper";
	
	public int create(BoardVO vo) throws Exception{
		return session.insert(namespace+".create", vo);
	}
	public BoardVO read(int bno) throws Exception{
		System.out.println("dao bno : " + bno);
		return (BoardVO)session.selectOne(namespace+".read",bno);
	}
	public void update(BoardVO vo) throws Exception{
		session.update(namespace+".update", vo);
	}
	public void delete(int bno) throws Exception{
		session.delete(namespace+".delete", bno);
	}
	public List<BoardVO> listAll() throws Exception{
		return session.selectList(namespace+".listAll");
	}

}
