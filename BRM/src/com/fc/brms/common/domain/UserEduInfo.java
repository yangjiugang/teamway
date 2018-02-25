/**
 * Create Code By Zhenglh
 * Create Date : 2012.03.20
 * Class Desc : 用户教育/培训信息
 * 
 */
package com.fc.brms.common.domain;

import java.io.Serializable;
import java.util.Date;

public class UserEduInfo implements Serializable {

	private static final long serialVersionUID = 1L;
	private int eduId;
	private int userId;
	/** 0教育1培训*/
	private int eduType;
	/**起时间 */
	private Date eduStartDate;
	/**止时间 */
	private Date eduEndDate;
	/**学校名称 */
	private String schoolName;
	/** */
	private int professionId;
	/**专业 */
	private String profession;
	/**学历 高中0；中专1；大专2；本科3；硕士研究生4；博士研究生5；博士后6 */
	private int education;
	/**学位 */
	private int degree;
	/**其他辅修专业 */
	private String otherProfession;

	public void setEduId(int eduId) {
		this.eduId = eduId;
	}

	public int getEduId() {
		return this.eduId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getUserId() {
		return this.userId;
	}

	public void setEduType(int eduType) {
		this.eduType = eduType;
	}

	public int getEduType() {
		return this.eduType;
	}

	public void setEduStartDate(Date eduStartDate) {
		this.eduStartDate = eduStartDate;
	}

	public Date getEduStartDate() {
		return this.eduStartDate;
	}

	public void setEduEndDate(Date eduEndDate) {
		this.eduEndDate = eduEndDate;
	}

	public Date getEduEndDate() {
		return this.eduEndDate;
	}

	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}

	public String getSchoolName() {
		return this.schoolName;
	}

	public void setProfessionId(int professionId) {
		this.professionId = professionId;
	}

	public int getProfessionId() {
		return this.professionId;
	}

	public void setProfession(String profession) {
		this.profession = profession;
	}

	public String getProfession() {
		return this.profession;
	}

	public void setEducation(int education) {
		this.education = education;
	}

	public int getEducation() {
		return this.education;
	}

	public void setDegree(int degree) {
		this.degree = degree;
	}

	public int getDegree() {
		return this.degree;
	}

	public void setOtherProfession(String otherProfession) {
		this.otherProfession = otherProfession;
	}

	public String getOtherProfession() {
		return this.otherProfession;
	}
}