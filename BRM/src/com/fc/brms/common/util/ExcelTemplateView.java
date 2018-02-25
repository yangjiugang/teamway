package com.fc.brms.common.util;

/**
 * 
 */
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.view.AbstractView;

import com.fc.brms.common.conf.Config;

/**
 * 导出Excel模板
 * @author huangshan
 */
public  class ExcelTemplateView extends AbstractView {
	
	private static final String CONTENT_TYPE = "text/excel";

	private String fileName;
	
	/**
	 * @param fileName	导出的文件名
	 */
	public ExcelTemplateView(String fileName) {
		setContentType(CONTENT_TYPE);
		this.fileName = fileName;
	}

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ByteArrayOutputStream baos = createTemporaryOutputStream();
		String ctxPath = FileUtil.getPath();
		File file = new File(ctxPath + File.separator + Config.getProperty("template") + File.separator + fileName);
		FileInputStream is = new FileInputStream(file);
		int ch;
		while ((ch = is.read()) != -1)
			baos.write(ch);
		response.setHeader("Content-Disposition", "attachment;filename=" + fileName);
		writeToResponse(response, baos);
	}
	
}

