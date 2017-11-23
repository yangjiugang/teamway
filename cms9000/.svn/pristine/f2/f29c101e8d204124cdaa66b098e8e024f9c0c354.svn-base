package com.teamway.cms.webcontroller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.fastquery.page.Page;
import org.fastquery.page.Pageable;
import org.fastquery.page.PageableImpl;
import org.fastquery.service.FQuery;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teamway.cms.dao.UserDBService;
import com.teamway.cms.dbentity.Cms_config_roleEntity;
import com.teamway.cms.dbentity.Cms_config_userEntity;
import com.teamway.cms.dbentity.Cms_config_user_roleEntity;
import com.teamway.cms.dbentity.Cms_res_server_infoEntity;
import com.teamway.cms.model.DataGridModel;
import com.teamway.cms.model.ResultMessageModel;
import com.teamway.cms.model.UserModel;


@Controller
@RequestMapping("/user") 
public class UserCtl {

	protected Logger log = Logger.getLogger(UserCtl.class);
	@RequestMapping("/page")
	public String page(){
		return "user";
	}
	@RequestMapping("/getAllUser")
	@ResponseBody
	public 	DataGridModel  getUserAll(HttpServletRequest request,int page,int rows){
		String text = request.getParameter("queryMap[text]");
		UserDBService DBService = FQuery.getRepository(UserDBService.class);
		Pageable pageable = new PageableImpl(page, rows);
		String findStr = (text.equals("")|| text==null)?null:"%"+text+"%";
		Page<Cms_config_userEntity> pages = DBService.findLikeLoginUserNameUsers(findStr,pageable);
		DataGridModel model = new DataGridModel();
		model.setRows(pages.getContent());
		model.setTotal(pages.getTotalElements());
		return model;
	}

	@RequestMapping("/getUserById")
	@ResponseBody
	public UserModel  getUserById(int id){
		
		UserModel model = new UserModel();
		
		UserDBService DBService = FQuery.getRepository(UserDBService.class);
		Cms_config_userEntity user = DBService.getUserById(id);
		List<Cms_config_roleEntity> roles=DBService.findAllRole();
		List<Cms_config_user_roleEntity> user_roles=DBService.findUserRole(id);
		user.setPassword("********");
		model.setUser(user);
		model.setRoles(roles);
		model.setUser_roles(user_roles);
		return model;
	}
	
	@RequestMapping("/getAllRoles")
	@ResponseBody
	public List<Cms_config_roleEntity>   getAllRoles(){
		
		UserDBService DBService = FQuery.getRepository(UserDBService.class);
		List<Cms_config_roleEntity> roles=DBService.findAllRole();
		
		return roles;
	}
	
	
	
	
	@RequestMapping("/newUser")
	@ResponseBody
	public ResultMessageModel  newUser(String login_name,String user_name,String password,String  mobile,String email,String expired_time,String remark,String user_roles){

		ResultMessageModel ret =  null;
		UserDBService DBService = FQuery.getRepository(UserDBService.class);
		
		
		
		Cms_config_userEntity existed_user = DBService.findUserByLoginName(login_name);
		if(existed_user != null){
			return new ResultMessageModel(-1,login_name +" 账户已存在!");
		}
		
		Cms_config_userEntity user = DBService.newUser(login_name, user_name, password, mobile, email, expired_time, remark);
		if(user != null){
			ret =  new ResultMessageModel(0,"");
		}else{
			ret =  new ResultMessageModel(-1,"新建用户，不成功");
		}
		return ret;
	}
	
	@RequestMapping("/editUser")
	@ResponseBody
	public ResultMessageModel  editUser(String id,String login_name,String user_name,String  mobile,String email,String expired_time,String remark,String user_roles){

		
		
		//user_roles
		String[] roles = user_roles.split(",");
		
		int user_id = Integer.parseInt(id);
		ResultMessageModel ret =  null;
		UserDBService DBService = FQuery.getRepository(UserDBService.class);
		DBService.delteUserRoleByUserId(user_id);
		for(int i = 0; i < roles.length;i++){
			DBService.insertUserRole(user_id, Integer.parseInt(roles[i]));	
		}
		int user = DBService.editUser(id,user_name, mobile, email, expired_time, remark);
		if(user != 0){
			ret =  new ResultMessageModel(0,"");
		}else{
			ret =  new ResultMessageModel(-1,"新建用户，不成功");
		}
		return ret;
	}
	@RequestMapping("/delUserById")
	@ResponseBody
	public ResultMessageModel  delUserById(String ids)
	{
		ResultMessageModel ret =  null;
		UserDBService DBService = FQuery.getRepository(UserDBService.class);
		String[] id_array = ids.split(",");
		List<String> list = java.util.Arrays.asList(id_array);
		int flag = DBService.delUserByIds(list);
		if(flag != 0){
			ret =  new ResultMessageModel(0,"");
		}else{
			ret =  new ResultMessageModel(-1,"用户删除失败");
		}
		return ret;
	}
	
	
	@RequestMapping("/changePassword")
	@ResponseBody
	public ResultMessageModel  changePassword(String id,String super_password,String password )
	{
		ResultMessageModel ret =  null;
		UserDBService DBService = FQuery.getRepository(UserDBService.class);
		
		Cms_config_userEntity user = DBService.findUserByLoginName("admin");
		
		
		if(!user.getPassword().equals(super_password)){
			ret =  new ResultMessageModel(-1,"超级用户密码错误!");
			return ret;
		}
		int flag = DBService.changeUserPassword(id, password);
		if(flag != 0){
			ret =  new ResultMessageModel(0,"");
		}else{
			ret =  new ResultMessageModel(-1,"用户密码修改失败");
		}
		return ret;
	}
	
	@RequestMapping("/enableUserById")
	@ResponseBody
	public ResultMessageModel  enableUserById(String ids,String enable)
	{
		ResultMessageModel ret =  null;
		UserDBService DBService = FQuery.getRepository(UserDBService.class);
		String[] id_array = ids.split(",");
		List<String> list = java.util.Arrays.asList(id_array);
		
		if(enable.equals("0") || enable.equals("1")){
			int flag = DBService.enableUserByIds(list,Integer.parseInt(enable));
			if(flag != 0){
				ret =  new ResultMessageModel(0,"");
			}else{
				ret =  new ResultMessageModel(-1,"账户状态修改失败");
			}
			return ret;
		}else{
			ret =  new ResultMessageModel(-1,"参数错误");
		}
		return ret;
	}
	

	
	
	
	
	
}
