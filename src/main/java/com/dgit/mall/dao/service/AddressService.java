package com.dgit.mall.dao.service;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dgit.mall.dao.AddressDao;
import com.dgit.mall.dto.Address;
import com.dgit.mall.dto.Member;
import com.dgit.mall.util.MySqlSessionFactory;

public class AddressService {
	private static AddressService instance = new AddressService();

	public static AddressService getInstance() {
		return instance;
	}

	private AddressService() {
	}

	public List<Address> selectByMemberNo(Member member) {
		List<Address> list = null;
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			AddressDao dao = sqlSession.getMapper(AddressDao.class);

			list = dao.selectByMemberNo(member);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public Address selectHomeByMemberNo(Member member) {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			AddressDao dao = sqlSession.getMapper(AddressDao.class);

			return dao.selectHomeByMemberNo(member);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
}
