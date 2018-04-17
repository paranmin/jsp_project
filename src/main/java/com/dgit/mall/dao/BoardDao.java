package com.dgit.mall.dao;

import java.util.List;

import com.dgit.mall.dto.Board;



public interface BoardDao {
	List<Board> selectByAllBoard();

	List<Board> selectByAllQandABoard();

}
