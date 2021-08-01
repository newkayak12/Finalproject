package com.e_um.controller.groupInfo.group;

import static com.e_um.common.renamePolicy.RenamePolicy.renamepolicy;

import java.io.Console;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.e_um.model.sevice.groupInfo.board.BoardServiceInterface;
import com.e_um.model.sevice.groupInfo.group.GroupServiceInterface;
import com.e_um.model.vo.groupinfo.board.Board;
import com.e_um.model.vo.groupinfo.comment.Comment;
import com.e_um.model.vo.groupinfo.group.Group;
import com.e_um.model.vo.groupinfo.member.Member;
import com.e_um.model.vo.userInfo.user.User;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class GroupController {

	@Autowired
	GroupServiceInterface service;
	
	@Autowired
	BoardServiceInterface serviceb;

	@RequestMapping("/group/groupCreate.do")
	public String groupCreate() {
		return "group/groupCreate";
	}

	/* 메인으로 내가가입한, 인기있는, 새로생긴 소모임 */
	@RequestMapping("/group/groupMain.do")
	public String groupList(Model m, HttpServletRequest rq) {
		List<Group> list = service.selectGroupList();
		List<Group> list2 = service.selectGroupListConditional((User) rq.getSession().getAttribute("userSession")); // 내가가입한
																													// 소모임

		m.addAttribute("list2", list2);
		m.addAttribute("list", list);
		return "group";
	}

	/* 더보기 버튼 전체 페이지 조회 */
	@RequestMapping("/group/groupListAll.do")
	public String groupListAll(Model m) {

		List<Group> list = service.selectGroupList(); // 전체소모임
		m.addAttribute("list", list);
		return "group/groupList";
	}

	@RequestMapping("/group/Gomain.do")
	public String groupInsert(@RequestParam Map param, Model model, HttpServletRequest rq, MultipartFile file) {

		User user = (User) rq.getSession().getAttribute("userSession");

		param.put("file", renamepolicy(rq, file, "group"));
		int result = service.groupInsert(param, user.getUserId());
		
		return "redirect:/group/groupMain.do";
	}
	
	

	@RequestMapping("/group/groupJoinForm.do")
	public String groupJoin(@RequestParam Map param, HttpServletRequest rq, Model model) {
		User user = (User) rq.getSession().getAttribute("userSession");
		log.warn("추측{}",param);
		String userId= user.getUserId();
		param.put("userId", userId);
		int result = service.groupJoin(param);
		return "redirect:/group/groupMain.do";
	}

	
	@RequestMapping("/group/groupJoin.do") 
	  public String groupJoinForm(HttpServletRequest rq, @RequestParam(value="groupSeq")String groupSeq ,Model model) { 
		  User user=(User) rq.getSession().getAttribute("userSession"); 
		  String userId= user.getUserId();
		  String page ="group/groupJoin";
		  System.out.println(groupSeq);
		  Group list=service.selectGroupUseridCheck(groupSeq);
		  model.addAttribute("group",list);
		  
		  log.warn("{}",list);
		  for(Member m : list.getMembers()) {
		  
				
			if(m.getGroupUser().getUserId().equals(userId)) {
				log.warn("야호!");
				return "redirect:/group/groupSigned.do?groupSeq="+groupSeq;
			}
		  }
		  return page;
		}

	
	@RequestMapping("/group/groupBoardWrite.do")
	public String groupBoardWrite(HttpSession session, String groupSeq, Model model) {
		model.addAttribute("groupSeq",groupSeq);
		
		return"group/groupboard/groupBoardWrite";
		
	}
	
	
	  

	  
	
	@RequestMapping("/group/groupBoardInsert.do")
	public String groupBoardInsert(Board board ,String groupSeq, Model model, MultipartFile[] file, HttpServletRequest rq) {
		User user=(User) rq.getSession().getAttribute("userSession");
		String userId= user.getUserId();
		
		
		
		Group groupmaster = new Group();
		groupmaster.getGroupMaster();
		
		board.setGroupBoardUser(user);
		
		Map<String, Object> map = new HashMap<>();
		map.put("groupBoardPhoto1",null);
		map.put("groupBoardPhoto2",null);
		map.put("groupBoardPhoto3",null);
		
		System.out.println(groupSeq);
		log.warn("{}",user);
		log.warn("{}",board);
		log.warn("{}",file);
		
		/*
		 * if(groupmaster=userId)
		 */
			
		int i = 1;
		
		if(file != null) {
			for(MultipartFile f : file) {
				System.out.println("파일이름 : "+f.getOriginalFilename());
				
				if(f.getSize()==0) break;
				
				map.put("groupBoardPhoto"+i,renamepolicy(rq, f, "board"));
				
				i++;
			}
		}
		int result = serviceb.groupboardinsert(board);
		log.error("{}",board.getGroupBoardSeq());
		
		
		
		 if(result>0) { 
			 map.put("groupBoardSeq", board.getGroupBoardSeq());
			 int resultfile = serviceb.groupboardfileinsert(map);
		 }
		
		return "redirect:/group/groupBoard.do?groupSeq="+groupSeq;
	}
	
	
	
	
	
	
	@RequestMapping("/group/groupSigned.do")
	public String groupSigned(HttpSession session,Group group,Model model) {
		log.warn("signed{}",group);
		String groupSeq = group.getGroupSeq();
		Group list=service.selectGroupUseridCheck(groupSeq);
		System.out.println(list);
		model.addAttribute("group",list);
		return "group/groupboard/groupBoardMain";
	}

	@RequestMapping("/group/groupBoard.do")
	public String groupBoard(HttpSession session,Group group,String groupSeq,Model model) {
		log.warn("Board{}",group);
		Group list=service.selectGroupUseridCheck(groupSeq);
		log.warn("qeweq{}",list);
		model.addAttribute("group",list);
		
		
		
		  List<Board> boardlist=serviceb.selectBoardList(groupSeq);
		  List<Board> notice = new ArrayList();
		  
		  log.warn("mastmastmastbefore{}",boardlist);
		  log.error("groupgruop{}",group);
		  for(Board b : boardlist) {
			  log.error("testtsttasdasdasdasdasd{}",b.getGroupBoardUser().getUserId().equals(list.getGroupMaster()));
			  if(b.getGroupBoardUser().getUserId().equals(list.getGroupMaster())) {
				  notice.add(b);
				  boardlist.remove(b);
			  }
		  }
		  log.warn("mastmastmast{}",notice);
		  log.warn("mastmastmast{}",boardlist);
		  
		  model.addAttribute("boardlist",boardlist);
		  model.addAttribute("notice",notice);
		 
		
		return "group/groupboard/groupBoardSub";
	}

	@RequestMapping("/group/groupScheduler.do")
	public String groupScheduler(String groupSeq,Model model) {
		Group list=service.selectGroupUseridCheck(groupSeq);
		System.out.println(list);
		model.addAttribute("group",list);
		return "group/groupboard/groupBoardSchedule";
	}
	
	@RequestMapping(value = "/group/filesupload", method = RequestMethod.POST)
	@ResponseBody
	public String fileUpload(HttpServletRequest rq, MultipartHttpServletRequest files) {
		log.warn("asdfasdf{}",files);
		return null;
	}
	
	@RequestMapping("/group/groupBoardContents.do")
	public String groupBoardContents(String groupBoardSeq,Model model) {
		Board board = serviceb.selectGroupBoard(groupBoardSeq);
		List<Comment> commentlist = serviceb.selectGroupBoardComment(groupBoardSeq);
		Board notice = serviceb.selectGroupBoard(groupBoardSeq);
		
		
		model.addAttribute("board",board);
		model.addAttribute("notice",notice);
		
		model.addAttribute("comment",commentlist);
		
		
		return "group/groupboard/groupBoardContents";
	}
	

}
