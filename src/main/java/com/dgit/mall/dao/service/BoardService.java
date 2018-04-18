package com.dgit.mall.dao.service;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dgit.mall.dao.BoardDao;
import com.dgit.mall.dto.Board;
import com.dgit.mall.util.MySqlSessionFactory;

public class BoardService {
	private static BoardService instance = new BoardService();

	public static BoardService getInstance() {
		return instance;
	}

	public BoardService() {
	}

	public List<Board> selectByAllReviewBoard() throws SQLException {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			BoardDao dao = sqlSession.getMapper(BoardDao.class);
			return dao.selectByAllReviewBoard();
		}
	}

	public List<Board> selectNoticeBoardAll() throws SQLException {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			BoardDao dao = sqlSession.getMapper(BoardDao.class);
			return dao.selectNoticeBoardAll();
		}
	}
	
}
