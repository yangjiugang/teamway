package com.fc.brms.common.conf;

import java.beans.PropertyEditorSupport;

import org.apache.commons.lang3.StringUtils;
import org.springframework.util.NumberUtils;

public class FLFNumberEditor extends PropertyEditorSupport {
	
	private final Class numberClass;
	
	public FLFNumberEditor(Class numberClass) {
		this.numberClass = numberClass;
	}
	
	@Override
	public void setAsText(String text) throws IllegalArgumentException {
		if(StringUtils.isBlank(text))
			setValue(0);
		else
			setValue(NumberUtils.parseNumber(text, this.numberClass));
	}
	
}
