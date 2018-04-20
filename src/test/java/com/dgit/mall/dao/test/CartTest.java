package com.dgit.mall.dao.test;

import static org.junit.Assert.assertNotNull;

import java.sql.SQLException;
import java.util.List;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;

import com.dgit.mall.dao.CartDao;
import com.dgit.mall.dao.service.CartService;
import com.dgit.mall.dao.service.CouponService;
import com.dgit.mall.dto.Cart;
import com.dgit.mall.dto.Coupon;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class CartTest {
	private static CartService service;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		service = CartService.getInstance();
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		service = null;
	}

	@Test
	public void test1SelectByAll(){
		List<Cart> list = service.selectAllCart(1);
		System.out.println(list);
		assertNotNull(list);
		for(Cart c : list){
			System.out.println(c);
		}
		
	}

}

