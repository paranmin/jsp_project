package com.dgit.mall.dao;

import java.util.List;
import java.util.Map;

import com.dgit.mall.dto.Member;

public interface MemberDao {
	Member selectByLogin(Member member);

	Member selectByFindMember(Member member);

	Member selectByMemberNo(int no);

	List<Member> selectMemberList();

	List<Member> selectMemberListBySearch(Map<String, String> map);

	int checkDuplId(String id);

	int checkDuplEmail(String email);

	int registerMember(Member member);
	
	int registerFullMember(Member member);

	int updatePassword(Member member);

	int modifyMember(Member member);

	int leaveMember(int no);
}
