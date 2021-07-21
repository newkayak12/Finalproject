package com.e_um.controller.groupInfo.group;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.e_um.model.sevice.groupInfo.group.GroupServiceInterface;
import com.e_um.model.vo.groupinfo.group.Group;
import com.e_um.model.vo.userInfo.user.User;
import static com.e_um.common.renamePolicy.RenamePolicy.renamepolicy;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class GroupController {

	@Autowired
	GroupServiceInterface service;
	
	
	@RequestMapping("/group/groupCreate.do")
	public String groupCreate(){
		return "group/groupCreate";
	}
	
	/* 메인으로 */
	@RequestMapping("/group/groupMain.do")
	public String groupList(Model m) {
		
		
		List<Group> list=service.selectGroupList();
		m.addAttribute("list",list);
		return "group";
	}
	
	/* 전체 페이지 조회 */
	@RequestMapping("/group/groupListAll.do")
	public String groupListAll(Model m) {
		List<Group> list=service.selectGroupList();
		m.addAttribute("list",list);
		System.out.println(list);
		return "group/groupList";
	}
	
	@RequestMapping("/group/Gomain.do") 
	public String  groupInsert(@RequestParam Map param, Model model, HttpServletRequest rq, MultipartFile file){ 
		
		User user = (User) rq.getSession().getAttribute("userSession");
		
		param.put("file", renamepolicy(rq, file, "group"));
		int result = service.groupInsert(param,user.getUserId());
		return "redirect:/group/groupMain.do";
	}
	 
	@RequestMapping("group/groupSigned.do")
	public String groupSigned() {
		return "group/groupboard/groupBoardMain";
	}
	
	@RequestMapping("group/groupBoard.do")
	public String groupBoard() {
		return "group/groupboard/groupBoardSub";
	}
	
	@RequestMapping("group/groupScheduler.do")
	public String groupScheduler() {
		return "group/groupboard/groupBoardSchedule";
	}
	
	
	
}
