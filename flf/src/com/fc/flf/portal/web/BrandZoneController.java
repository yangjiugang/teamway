package com.fc.flf.portal.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BrandZoneController {
 
	@RequestMapping(value = "/brandzone")
    public String brandzone() {
        return "/portal/BrandZone";
    }

}
