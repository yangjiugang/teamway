package com.fc.flf.eagent.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.fc.flf.eagent.service.ICustomerFunService;

/**
 * 更改页面跳转路径
 * 
 * @author Administrator
 * 
 */
@Controller
public class ChangePageGotoGontroller {
	@Autowired
	private ICustomerFunService customerFunService;
	@RequestMapping(value = "IndexA")
	public String IndexA() {
		return "/eagent/Index-a";
	}

	@RequestMapping(value = "IndexAB")
	public String IndexAB() {
		return "/eagent/Index-a-b";
	}

	@RequestMapping(value = "IndexATianjia")
	public String IndexATianjia() {
		return "/eagent/Index-a-tianjia";
	}



	@RequestMapping(value = "testUpload")
	public String IndexFa() {
		return "/eagent/TestUpload";
	}
	
	@RequestMapping(value = "example")
	public String example() {
		return "/eagent/example";
	}

	@RequestMapping(value = "IndexFang")
	public String IndexFang() {
		return "/eagent/Index-fang";
	}

	@RequestMapping(value = "IndexFangA")
	public String IndexFangA() {
		return "/eagent/Index-fang-a";
	}

	@RequestMapping(value = "IndexFangB")
	public String IndexFangB() {
		return "/eagent/Index-fang-b";
	}

	@RequestMapping(value = "IndexFangC")
	public String IndexFangC() {
		return "/eagent/Index-fang-c";
	}

	@RequestMapping(value = "IndexFangRight")
	public String IndexFangRight() {
		return "/eagent/Index-fang-Right";
	}

	@RequestMapping(value = "IndexHaoyouRight")
	public String IndexHaoyouRight() {
		return "/eagent/Index-haoyou-right";
	}

	@RequestMapping(value = "IndexHaoyouRightZhao")
	public String IndexHaoyouRightZhao() {
		return "/eagent/Index-haoyou-right-zhao";
	}



	@RequestMapping(value = "IndexTianjiaKehu")
	public String IndexTianjiaKehu() {
		return "/eagent/index-kehu-tianjia";
	}
	

	@RequestMapping(value = "IndexBRightZhao")
	public String IndexBRightZhao() {
		return "/eagent/Index-b-right-zhao";
	}

	@RequestMapping(value = "IndexBRight")
	public String IndexBRight() {
		return "/eagent/Index-b-right";
	}

	@RequestMapping(value = "IndexGerenZiliao")
	public String IndexGerenZiliao() {
		return "/eagent/Index-geren-ziliao";
	}

	@RequestMapping(value = "IndexGeren")
	public String IndexGeren() {
		return "/eagent/Index-geren";
	}
	
	@RequestMapping(value = "IndexRenshou")
	public String IndexRenshou() {
		return "/eagent/Index-renshou";
	}

	@RequestMapping(value = "IndexXiaoxi")
	public String IndexXiaoxi() {
		return "/eagent/Index-xiaoxi";
	}

	

	@RequestMapping(value = "Denglu")
	public String Denglu() {
		return "/eagent/Denglu";
	}

	@RequestMapping(value = "DingdanY4")
	public String DingdanY4() {
		return "/eagent/DingdanY4";
	}

	@RequestMapping(value = "GRZYkxjlY06")
	public String GRZYkxjlY06() {
		return "/eagent/GRZYkxjlY06";
	}

	@RequestMapping(value = "HomejiaoyiY4")
	public String HomejiaoyiY4() {
		return "/eagent/HomejiaoyiY4";
	}

	@RequestMapping(value = "HomeTJFXY4")
	public String HomeTJFXY4() {
		return "/eagent/HomeTJFXY4";
	}

	@RequestMapping(value = "JiaoyiY4")
	public String JiaoyiY4() {
		return "/eagent/JiaoyiY4";
	}

	@RequestMapping(value = "KaixiaojiluY06")
	public String KaixiaojiluYo6() {
		return "/eagent/KaixiaojiluY06";
	}

	@RequestMapping(value = "RizhiY04")
	public String RizhiY04() {
		return "/eagent/RizhiY04";
	}

	@RequestMapping(value = "RizhiY04Home")
	public String RizhiY04Home() {
		return "/eagent/RizhiY04Home";
	}

	@RequestMapping(value = "Y03juluyuehuiKehu")
	public String Y03juluyuehuiKehu() {
		return "/eagent/Y03juluyuehui-kehu";
	}

	@RequestMapping(value = "Y03juluyuehui")
	public String Y03juluyuehui() {
		return "/eagent/Y03juluyuehui";
	}

	@RequestMapping(value = "Y52hangyezhengce")
	public String Y52hangyezhengce() {
		return "/eagent/Y52hangyezhengce";
	}

	@RequestMapping(value = "Y52qitaxuexi")
	public String Y52qitaxuexi() {
		return "/eagent/Y52qitaxuexi";
	}

	@RequestMapping(value = "Y52xiaoshoujiqiao")
	public String Y52xiaoshoujiqiao() {
		return "/eagent/Y52xiaoshoujiqiao";
	}

	@RequestMapping(value = "Y52xuexi")
	public String Y52xuexi() {
		return "/eagent/Y52xuexi";
	}

	@RequestMapping(value = "Y7chihewanle")
	public String Y7chihewanle() {
		return "/eagent/Y7chihewanle";
	}

	@RequestMapping(value = "Zhuce")
	public String Zhuce() {
		return "/eagent/Zhuce";
	}
	
	@RequestMapping(value = "UpLoadPhoto")
	public String UpLoadPhoto() {
		return "/eagent/UpLoadPhoto";
	}
}
