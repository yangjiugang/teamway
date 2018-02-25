package com.fc.flf.portal.service;

import com.fc.flf.common.domain.VisitorCollectHouse;

public interface IVisitorCollectHouseService {
	/**
	 * 收藏该楼盘
	 * @param visitorCollectHouse
	 * @return
	 */
	public int userCollectHouse(VisitorCollectHouse visitorCollectHouse);
}
