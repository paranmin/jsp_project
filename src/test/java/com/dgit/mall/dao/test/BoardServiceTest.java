package com.dgit.mall.dao.test;

import static org.junit.Assert.assertNotNull;

import java.sql.SQLException;
import java.util.List;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.dgit.mall.dao.service.BoardService;
import com.dgit.mall.dto.Board;
import com.dgit.mall.dto.Coupon;

public class BoardServiceTest {
	private static BoardService service;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		service = BoardService.getInstance();
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		service = null;
	}

	@Test
	public void test1Select() throws SQLException {
		List<Board> list = service.selectByAllBoard();
		System.out.println(list);
		assertNotNull(list);
		for (Board cp : list) {
			System.out.println(list);
		}
	}
}
