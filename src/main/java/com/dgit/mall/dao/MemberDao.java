package com.dgit.mall.dao;

import com.dgit.mall.dto.Member;

public interface MemberDao {
	Member selectByLogin(Member member);

	Member selectByFindMember(Member member);

	Member selectByMemberNo(int no);

	int checkDuplEmail(String email);

	int registerMember(Member member);

	int updatePassword(Member member);

	int modifyMember(Member member);
}
