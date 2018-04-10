package com.dgit.mall.dao.test;

import static org.junit.Assert.*;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;

import com.dgit.mall.dao.service.MemberService;
import com.dgit.mall.dto.Member;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class MemberServiceTest {
	private static MemberService service;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		service = MemberService.getInstance();
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		service = null;
	}

	@Test
	void test1SelectByLogin() {
		Member login = new Member();
		login.setId("test");
		login.setPwd("test");

		Member member = service.selectByLogin(login);
		assertNotNull(member);
		System.out.println(member);
	}

}
