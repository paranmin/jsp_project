package com.dgit.mall.dao.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.dgit.mall.dto.Member;
import com.dgit.mall.util.MySqlSessionFactory;

public class MemberService {
	private static final MemberService instance = new MemberService();
	private final String namespace = "com.dgit.mall.dao.MemberDao.";

	public static MemberService getInstance() {
		return instance;
	}

	private MemberService() {
	}

	public Member selectByLogin(Member member) {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			return sqlSession.selectOne(namespace + "selectByLogin", member);
		}
	}

	public Member selectByFindMember(Member member) {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			return sqlSession.selectOne(namespace + "selectByFindMember", member);
		}
	}

	public Member selectByMemberNo(int no) {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			return sqlSession.selectOne(namespace + "selectByMemberNo", no);
		}
	}

	public List<Member> selectMemberList() {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			return sqlSession.selectList(namespace + "selectMemberList");
		}
	}

	public int countTotalMemberBySearch(Map<String, Object> map) {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			return sqlSession.selectOne(namespace + "countTotalMemberBySearch", map);
		}
	}

	public List<Member> selectMemberListBySearch(Map<String, Object> map) {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			return sqlSession.selectList(namespace + "selectMemberListBySearch", map);
		}
	}

	public int checkDuplId(String id) {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			return sqlSession.selectOne(namespace + "checkDuplId", id);
		}
	}

	public int checkDuplEmail(String email) {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			return sqlSession.selectOne(namespace + "checkDuplEmail", email);
		}
	}

	public int registerMember(Member member) {
		int res = 0;
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			res = sqlSession.insert(namespace + "registerMember", member);
			sqlSession.commit();
		}
		return res;
	}

	public int registerFullMember(Member member) {
		int res = 0;
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			res = sqlSession.insert(namespace + "registerFullMember", member);
			sqlSession.commit();
		}
		return res;
	}

	public int updatePassword(Member member) {
		int res = 0;
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			res = sqlSession.update(namespace + "updatePassword", member);
			sqlSession.commit();
		}
		return res;
	}

	public int modifyMember(Member member) {
		int res = 0;
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			res = sqlSession.update(namespace + "modifyMember", member);
			sqlSession.commit();
		}
		return res;
	}

	public int leaveMember(int no) {
		int res = 0;
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			res = sqlSession.update(namespace + "leaveMember", no);
			sqlSession.commit();
		}
		return res;
	}

}
