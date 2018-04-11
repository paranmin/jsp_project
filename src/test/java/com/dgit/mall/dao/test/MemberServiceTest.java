package com.dgit.mall.dao.test;

import static org.junit.Assert.*;

import java.util.Date;

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
	public void test1SelectByLogin() {
		Member login = new Member();
		login.setId("test");
		login.setPwd("test");

		Member member = service.selectByLogin(login);
		assertNotNull(member);
		System.out.println(member);
	}
	
	@Test
	public void test2RegisterMember() {
		Member member = new Member();
		member.setId("test2");
		member.setName("test2");
		member.setPwd("test2");
		member.setPhone("01011223344");
		member.setEmail("test2@test.com");
		member.setServiceAgree('Y');
		member.setPrivacyAgree('Y');
		member.setPushEmail('Y');
		member.setPushSMS('Y');
		member.setPushApp('Y');
		member.setRegdate(new Date());
		
		int res = service.registerMember(member);
		assertEquals(1, res);
	}

}
