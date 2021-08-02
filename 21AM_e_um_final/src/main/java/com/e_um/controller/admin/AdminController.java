package com.e_um.controller.admin;

import static com.e_um.common.pagebar.PageBar.getPageBar;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.e_um.model.sevice.admin.AdminServiceInterface;
import com.e_um.model.vo.userInfo.user.User;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class AdminController {
	@Autowired
	AdminServiceInterface service;

	@RequestMapping("/admin/enter")
	public String adminPageEnter() {
		return "admin";
	}
	
	@RequestMapping("/admin/menu")
	public String adminMenu() {
		return "components/admin/adminmenu";
	}

	@RequestMapping("/admin/manageuser")
	public String manageUser(@RequestParam(defaultValue = "1", value = "cPage")String cPage, Model model) {
		int numPerPage = 10;
		
		List<User> list = service.manageUser(Integer.parseInt(cPage), numPerPage);
		log.warn("{}",list);
		model.addAttribute("list",list);
		
		model.addAttribute("pageBar", getPageBar(service.userTotalData(), Integer.parseInt(cPage) ,numPerPage ,"manageUser"));
		return "components/admin/manageuser";
	}
	
	@RequestMapping("/admin/blockuser")
	@ResponseBody
	public int blockUser(String userId) {
		return service.blockUser(userId);
	}
	
	@RequestMapping("/admin/unblockuser")
	@ResponseBody
	public int unblockUser(String userId) {
		return service.unblockUser(userId);
	}
	
	@RequestMapping("/admin/managegroup")
	public String manageGroup(@RequestParam(defaultValue = "1", value = "cPage")String cPage, Model model) {
		int numPerPage = 10;
		model.addAttribute("list",service.manageGroup(Integer.parseInt(cPage), numPerPage));
		
		model.addAttribute("pageBar",getPageBar(service.groupTotalData(), Integer.parseInt(cPage), numPerPage, "managerGroup"));
		
		return "components/admin/managegroup";
	}
	@RequestMapping("/admin/blindgroup")
	@ResponseBody
	public int blindGroup(String groupSeq) {
		return service.blindGroup(groupSeq);
	}
	@RequestMapping("/admin/unblindgroup")
	@ResponseBody
	public int unblindGroup(String groupSeq) {
		return service.unblindGroup(groupSeq);
	}
	
	@RequestMapping("/admin/managefood")
	public String manageFood(@RequestParam(defaultValue = "1", value = "cPage")String cPage, Model model) {
		int numPerPage =10;
		model.addAttribute("list",service.manageFood(Integer.parseInt(cPage), numPerPage));
		return "components/admin/managefood";
	}
	@RequestMapping("/admin/manageservice")
	public String manageService(@RequestParam(defaultValue = "1", value = "cPage")String cPage, Model model) {
		return "components/admin/manageservice";
	}
	@RequestMapping("/admin/managemovie")
	public String manageMovie(@RequestParam(defaultValue = "1", value = "cPage")String cPage, Model model) {
		return "components/admin/managemovie";
	}
	
}
