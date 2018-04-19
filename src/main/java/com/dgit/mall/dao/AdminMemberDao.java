package com.dgit.mall.dao;

import com.dgit.mall.dto.AdminMember;

public interface AdminMemberDao {
	AdminMember selectByLogin(AdminMember adMember);
}
