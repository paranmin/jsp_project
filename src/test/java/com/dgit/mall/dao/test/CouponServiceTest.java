package com.dgit.mall.dao.test;


import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;

import com.dgit.mall.dao.service.CouponService;
import com.dgit.mall.dto.Coupon;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class CouponServiceTest {
	private static CouponService service;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		service = CouponService.getInstance();
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		service = null;
	}

	@Test
	public void test1SelectByAll() {
		List<Coupon> list = service.selectByAll();
		System.out.println(list);
		assertNotNull(list);
		for(Coupon cp : list){
			System.out.println(list);
		}
		
	}

}
