package com.dgit.mall.dao.service;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;

import com.dgit.mall.dao.MemberDao;
import com.dgit.mall.dto.Member;
import com.dgit.mall.util.MySqlSessionFactory;

public class MemberService {
	private static final MemberService instance = new MemberService();

	public static MemberService getInstance() {
		return instance;
	}

	private MemberService() {
	}
	
	public Member selectByLogin(Member member) {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			MemberDao dao = sqlSession.getMapper(MemberDao.class);

			return dao.selectByLogin(member);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
}
