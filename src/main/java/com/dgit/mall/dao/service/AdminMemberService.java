package com.dgit.mall.dao.service;

import org.apache.ibatis.session.SqlSession;

import com.dgit.mall.dto.AdminMember;
import com.dgit.mall.util.MySqlSessionFactory;

public class AdminMemberService {
	private static AdminMemberService instance = new AdminMemberService();
	private final String namespace = "com.dgit.mall.dao.AdminMemberDao.";

	public static AdminMemberService getInstance() {
		return instance;
	}

	private AdminMemberService() {
	}

	public AdminMember selectByLogin(AdminMember adMember) {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			return sqlSession.selectOne(namespace + "selectByLogin", adMember);
		}
	}
}
