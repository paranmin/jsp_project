package com.dgit.mall.dao;

import com.dgit.mall.dto.Admin;

public interface AdminDao {
	Admin selectByLogin(Admin adMember);
}
