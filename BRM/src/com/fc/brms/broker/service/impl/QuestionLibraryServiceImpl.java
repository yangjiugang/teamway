package com.fc.brms.broker.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fc.brms.broker.mapper.IQuestionLibraryMapper;
import com.fc.brms.broker.service.IQuestionLibraryService;
import com.fc.brms.common.domain.QuestionLibrary;
import com.fc.brms.common.domain.QuestionPapersDetail;
import com.fc.brms.common.domain.QuestionType;
import com.fc.brms.common.util.DateTools;
import com.fc.brms.common.util.Page;

@Service
public class QuestionLibraryServiceImpl implements IQuestionLibraryService {
	
	@Resource
	private IQuestionLibraryMapper questionLibraryMapper;

	@Override
	public List<QuestionType> findQuestionType() {
		return questionLibraryMapper.findQuestionType();
	}
	
	@Override
	public String getQuestionLibraryNo() {
		String ts = DateTools.getTodays().substring(2,8);
		String WT = "WT";
		String no = WT + ts;
		String result = questionLibraryMapper.getQuestionLibraryNo(no);
		if(result == null){
			no += "0001";
		}else{
			String maxno = result.substring(2, result.length());
			maxno = String.valueOf((Integer.parseInt(maxno) + 1));
			no = WT + ts + maxno.substring(6,maxno.length());
		}
		return no;
	}
	
	@Override
	public void saveQuestion(QuestionLibrary questionLibrary) {
		if(questionLibrary.getQuestionId() == 0){
			questionLibrary.setQuestionNum(getQuestionLibraryNo());
			questionLibrary.setCreateTime(new Date());
		}else{
			questionLibrary.setLastUpdateTime(new Date());
		}
		questionLibraryMapper.saveQuestion(questionLibrary);
	}
	
	@Override
	public List<QuestionLibrary> findQuestionLibByPaperId(Page page, int paperId) {
		String limit = null;
		if(page != null){
			page.setRecords(findQuestionLibCountByPaperId(paperId));
			limit = page.getLimit();
		}
		return questionLibraryMapper.findQuestionLibByPaperId(paperId, limit);
	}
	
	@Override
	public int findQuestionLibCountByPaperId(int paperId) {
		return questionLibraryMapper.findQuestionLibraryByPaperIdCount(paperId);
	}
	
	@Override
	public void savePaperDetail(QuestionPapersDetail detail) {
		questionLibraryMapper.savePaperDetail(detail);
	}
	
	@Override
	public void updateQuestionPoint(int id, int point) {
		questionLibraryMapper.updateQuestionPoint(id, point);
	}
	
	@Override
	public void delQuestionPapersDetail(int id) {
		questionLibraryMapper.delQuestionPapersDetail(id);
	}
	
	@Override
	public void updateQuestionOrder(int id, int order) {
		questionLibraryMapper.updateQuestionOrder(id, order);
	}
	
	@Override
	public List<QuestionLibrary> findQuestionLibrary(QuestionLibrary library, Page page) {
		page.setRecords(findQuestionLibraryCount(library));
		return questionLibraryMapper.findQuestionLibrary(library, page.getLimit());
	}
	
	@Override
	public int findQuestionLibraryCount(QuestionLibrary library) {
		return questionLibraryMapper.findQuestionLibraryCount(library);
	}
	
	@Override
	public QuestionLibrary findQuestionLibraryById(int id) {
		return questionLibraryMapper.findQuestionLibraryById(id);
	}
	
	@Override
	public void updateLibraryState(int id) {
		questionLibraryMapper.updateLibraryState(id);
	}
	
	@Override
	public void updateLibrary(QuestionLibrary library) {
		library.setLastUpdateTime(new Date());
		library.setLastUpdateUser(1);
		questionLibraryMapper.updateLibrary(library);
	}
	
	@Override
	public QuestionType findQuestionTypeById(int id) {
		return questionLibraryMapper.findQuestionTypeById(id);
	}
	
	@Override
	public void saveQuestionType(QuestionType type) {
		questionLibraryMapper.saveQuestionType(type);
	}
	
	@Override
	public void updateQuestionType(QuestionType type) {
		questionLibraryMapper.updateQuestionType(type);
	}
	
	@Override
	public void delQuestionType(int typeId) {
		questionLibraryMapper.delQuestionType(typeId);
	}
	
	/**
	 * 查看问卷的所有的题目
	 * @param map （问卷的id号，分页）
	 * @return 所有题目
	 * code gonghj
	 */
	public List<QuestionLibrary> findQuestionLibraryByPaperId(int paperId,Page page){
		Map<String ,Object> map=new HashMap<String, Object>();
		map.put("paperId", paperId);
		map.put("limit", page.getLimit());
		List<QuestionLibrary> list=questionLibraryMapper.findQuestionLibraryByPaperId(map);
		return list;
	}
	/**
	 * 查看问卷的所有的题目总条数
	 * @param int
	 * @return 所有题目的总条数
	 * code gonghj
	 */
	public int findQuestionLibraryByPaperIdCount(int paperId){
		return questionLibraryMapper.findQuestionLibraryByPaperIdCount(paperId);
	}
	
	/**
	 * 调查活动的参与情况的统计
	 * @param testId  如果只传testId就是查总人数
	 * @param isSubmit 如果传了isSubmit 等于0是没参与 等于1就是参与 9是null
	 * @param isAvailabe 如果传isAvailabe 等于0参与无效 等于1参与有效  9是null
	 * @return
	 */
	public int findSurveyStatistics(int testId,int isSubmit,int isAvailabe){
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("testId", testId);
		map.put("isSubmit", isSubmit);
		map.put("isAvailabe", isAvailabe);
		int count=questionLibraryMapper.findSurveyStatistics(map);
		return count;
	}
	
	/**
	 * 调查成绩统计
	 * @param testId
	 * @param bigScore  最大的分数
	 * @param smallScore 最小的分数
	 * @return
	 */
	public int findScoreStatistice(int testId,int smallScore,int bigScore){
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("testId", testId);
		map.put("bigScore", bigScore);
		map.put("smallScore", smallScore);
		int count=questionLibraryMapper.findScoreStatistice(map);
		return count;
	}
	
	/**
	 * 查看问卷的所有的题目
	 * @param map （问卷的id号，分页）
	 * @return 所有题目
	 * code gonghj
	 */
	public List<QuestionLibrary> findPapersId(int paperId,Page paperPage){
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("paperId", paperId);
		map.put("limit", paperPage.getLimit());
		List<QuestionLibrary> list=questionLibraryMapper.findQuestionLibraryByPapersId(map);
		return list;
	}
	/**
	 * 查看问卷的所有的题目总条数
	 * @param int
	 * @return 所有题目的总条数
	 * code gonghj
	 */
	public int findPapersIdCount(int paperId){
		return questionLibraryMapper.findQuestionLibraryByPapersIdCount(paperId);
	}
}
