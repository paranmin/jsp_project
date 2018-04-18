package com.dgit.mall.dao.test;

import static org.junit.Assert.assertEquals;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.dgit.mall.dao.service.ProductService;
import com.dgit.mall.dto.Product;

public class ProductServiceTest {
	private static ProductService service;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		service = ProductService.getInstance();
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		service = null;
	}

	@Test
	public void test1InsertProduct() {
		Product pro = new Product();
		pro.setPrdNo(1);
		pro.setCategory("001001");
		pro.setName("목걸이");
		pro.setSubDesc("목걸이 부가설명");
		pro.setCost(1000);
		pro.setSellingPrice(5000);
		pro.setDiscountPer("0");
		pro.setContent("목걸이 상세설명");
		pro.setUseOption("1");
		pro.setStock(10);
		pro.setMainImg("necklace_main_img.png");

		int res = service.insertProduct(pro);
		assertEquals(1, res);
	}

}
