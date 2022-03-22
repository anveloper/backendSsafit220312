package com.ssafit.model.dao;

public interface MemberDao {

	boolean isExistedUserId(String userId);

	boolean isExistedNickname(String nickname);

	public int getWriterNoByUserId(String string);

}
