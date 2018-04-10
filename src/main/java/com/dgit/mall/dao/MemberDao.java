package com.dgit.mall.dao;

import java.sql.SQLException;

import com.dgit.mall.dto.Member;

public interface MemberDao {
	Member selectByLogin(Member member) throws SQLException;
}
