package com.dgit.mall.dao;

import java.util.List;
import java.util.Map;

import com.dgit.mall.dto.Board;

public interface BoardDao {
	List<Board> selectByAllReviewBoard();
	List<Board> selectReviewBoardByProduct(int prdNo);

	List<Board> selectByAllQandABoard();
	List<Board> selectQandABoardByProduct(int prdNo);

	List<Board> selectNoticeBoardAll();

	Board selectlistBoardReviewByid(int number);


	Board selectCheckPass(int number);

	public int insertBoard(Board board);

	public int updateBoardReview(Board board);

	public int deleteReview(int number);

	public int updatecheck(int ChBoard);

	List<Board> selectByAllReply();

	public int selectBylastno();

	public int insertBoardReply(Board board);

	List<Board> selectbrdcode();

	public int selectBybrddepth(int number);

	List<Board> selectBoardByMember(Map<String, Object> map);
}
