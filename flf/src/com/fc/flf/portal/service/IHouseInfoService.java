package com.fc.flf.portal.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.fc.flf.common.domain.EventInfo;
import com.fc.flf.common.domain.HouseInfo;
import com.fc.flf.common.util.Page;

public interface IHouseInfoService {

	public HouseInfo findHouseInfoById(int houseId);

	/**
	 * 首页显示最新上市
	 * 
	 * @return
	 */
	public List<Object> findHomeInfoNewHouseList();

	public List<HouseInfo> findHouseInfoWithDetail();

	/**
	 * 首页最近浏览的楼盘
	 * 
	 * @return
	 */
	public List<HouseInfo> findRecentBrowsers() throws Exception;

	/**
	 * 保存House浏览记录
	 * 
	 * @param houseId
	 */
	public void saveVisitorSkimHouse(int houseId,HttpServletResponse response) throws Exception;

	/**
	 * 更新house人气
	 * 
	 * @param houseId
	 */
	public void updateHouseAttenttion(int houseId);

	/**
	 * 收藏的楼盘
	 * 
	 * @param userId
	 */
	public List<HouseInfo> findCollectHouse();

	/**
	 * 新房专卖 （最新楼盘展示）
	 * 
	 * @return
	 */
	public List<HouseInfo> findNewHouseList(Page page);

	/**
	 * 新房专卖分页(得到楼盘总页数)
	 * 
	 * @return
	 */
	public int getTotalCount();

	/**
	 * 新房专卖分页(得到楼盘总页数)
	 * 
	 * @return
	 */
	public List<HouseInfo> findRecentSignHouseInfo();

	public List<HouseInfo> findHouseInfoAccurate(HouseInfo houseInfo, Page page);

	public int getHouseInfoAccurateCount(HouseInfo houseInfo);

	/**
	 * 房秘书推荐榜
	 * 
	 * @return
	 */
	public List<HouseInfo> attentionHouseInfos();

	/**
	 * 大家关注的楼盘
	 * 
	 * @return
	 */
	public List<HouseInfo> everyoneAttention();

	/**
	 * 会所本周活动
	 * 
	 * @param date
	 * @return
	 */
	public List<EventInfo> weekActivity(String date);

	/**
	 * 房秘书关注
	 * 
	 * @return
	 */
	public List<HouseInfo> fangMishuAttention();

	/**
	 * 查询看房团
	 * 
	 * @param houseInfo
	 * @return
	 * @author 覃启轩 add 2012-2-9
	 */
	List<HouseInfo> getSeeHouseAccurate(HouseInfo houseInfo, Page page);

	/**
	 * 查询看房团总记录数
	 * 
	 * @param houseInfo
	 * @return
	 * @author 覃启轩 add 2012-2-9
	 */
	int getSeeHouseAccurateCount(HouseInfo houseInfo);
}
