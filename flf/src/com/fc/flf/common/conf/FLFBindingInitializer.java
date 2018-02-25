package com.fc.flf.common.conf;

import java.text.DateFormat;
import java.util.Date;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.support.WebBindingInitializer;
import org.springframework.web.context.request.WebRequest;

public class FLFBindingInitializer implements WebBindingInitializer {

	@Override
	public void initBinder(WebDataBinder binder, WebRequest request) {
		// TODO Auto-generated method stub
		binder.registerCustomEditor(int.class, new FLFNumberEditor(Integer.class));
		binder.registerCustomEditor(long.class, new FLFNumberEditor(Long.class));
		binder.registerCustomEditor(Date.class, new CustomDateEditor(DateFormat.getDateInstance(), true));
	}

}
