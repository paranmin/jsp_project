package com.dgit.mall.dao.service;

import org.apache.ibatis.session.SqlSession;

import com.dgit.mall.dto.Admin;
import com.dgit.mall.util.MySqlSessionFactory;

public class AdminService {
	private static AdminService instance = new AdminService();
	private final String namespace = "com.dgit.mall.dao.AdminDao.";

	public static AdminService getInstance() {
		return instance;
	}

	private AdminService() {
	}

	public Admin selectByLogin(Admin adMember) {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			return sqlSession.selectOne(namespace + "selectByLogin", adMember);
		}
	}
}
