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

	public Member selectByFindMember(Member member) {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			MemberDao dao = sqlSession.getMapper(MemberDao.class);

			return dao.selectByFindMember(member);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public Member selectByMemberNo(int no) {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			MemberDao dao = sqlSession.getMapper(MemberDao.class);

			return dao.selectByMemberNo(no);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public int registerMember(Member member) {
		int res = 0;
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			MemberDao dao = sqlSession.getMapper(MemberDao.class);

			res = dao.registerMember(member);
			sqlSession.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return res;
	}

	public int updatePassword(Member member) {
		int res = 0;
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			MemberDao dao = sqlSession.getMapper(MemberDao.class);

			res = dao.updatePassword(member);
			sqlSession.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return res;
	}

}
