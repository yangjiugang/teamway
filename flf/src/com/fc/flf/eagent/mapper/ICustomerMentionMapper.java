package com.fc.flf.eagent.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.fc.flf.common.domain.CustomerMention;

public interface ICustomerMentionMapper {
	
	public List<CustomerMention> selectCustomerMentionByUserId(@Param("userId")int userId,@Param("limit") String limit);
	public int selectCustomerMentionCountByUserId(int userId);
	public void deletCusMentionById(int mentionId);
	public CustomerMention selectCustomerMetionById(int mentionId);

}
