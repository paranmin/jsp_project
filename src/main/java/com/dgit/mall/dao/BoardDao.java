package com.dgit.mall.dao;

import java.util.List;

import com.dgit.mall.dto.Board;



public interface BoardDao {
	List<Board> selectByAllReviewBoard();

	List<Board> selectByAllQandABoard();

	List<Board> selectNoticeBoardAll();


}
