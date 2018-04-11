package com.dgit.mall.dao.test;

import static org.junit.Assert.assertNotNull;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import com.dgit.mall.dao.service.MemberService;
import com.dgit.mall.dto.Member;

class MemberServiceTest {
	private static MemberService service;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		service = MemberService.getInstance();
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
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
