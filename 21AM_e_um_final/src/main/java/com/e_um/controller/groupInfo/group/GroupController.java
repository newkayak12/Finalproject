package com.e_um.controller.groupInfo.group;

import static com.e_um.common.renamePolicy.RenamePolicy.renamepolicy;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
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
import com.e_um.model.vo.groupinfo.group.Category;
import com.e_um.model.vo.groupinfo.group.Group;
import com.e_um.model.vo.groupinfo.likeBoard.LikeBoard;
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
	
	@Autowired
	SqlSessionTemplate t;

	@RequestMapping("/group/groupCreate.do")
	public String groupCreate() {
		return "group/groupCreate";
	}

	/* 메인으로 내가가입한, 인기있는, 새로생긴 소모임 */
	@RequestMapping("/group/groupMain.do")
	public String groupList(Model m, HttpServletRequest rq) {
		List<Group> list = service.selectGroupList();
		List<Group> list2 = service.selectGroupListConditional((User) rq.getSession().getAttribute("userSession")); // 내가가입한
		List<Group> list3 = service.selectGroupListTop();																										// 소모임
		List<Group> list4 = service.selectGrouplistNew();
		List<Category> listcate = service.selectGroupCategory();
		log.warn("catecate{}",listcate);
		log.warn("listlist{}",list);
		m.addAttribute("list2", list2);
		m.addAttribute("list", list);
		m.addAttribute("list3", list3);
		m.addAttribute("list4",list4);
		m.addAttribute("listcate",listcate);
		return "group";
	}

	/* 더보기 버튼 전체 페이지 조회 */
	@RequestMapping("/group/groupListAll.do")
	public String groupListAll(Model m) {

		List<Group> list = service.selectGroupList(); // 전체소모임
		m.addAttribute("list", list);
		return "group/groupList";
	}
	
	
	/* 그룹 만들기 */
	@RequestMapping("/group/Gomain.do")
	public String groupInsert(@RequestParam Map param, Model model, HttpServletRequest rq, MultipartFile file) {

		User user = (User) rq.getSession().getAttribute("userSession");

		param.put("file", renamepolicy(rq, file, "group"));
		int result = service.groupInsert(param, user.getUserId());
		
		return "redirect:/group/groupMain.do";
	}
	
	
	/* 그룹 가입하기 */
	@RequestMapping("/group/groupJoinForm.do")
	public String groupJoin(@RequestParam Map param, HttpServletRequest rq, Model model) {
		User user = (User) rq.getSession().getAttribute("userSession");
		log.warn("추측{}",param);
		String userId= user.getUserId();
		param.put("userId", userId);
		int result = service.groupJoin(param);
		return "redirect:/group/groupMain.do";
	}

	
	/* 그룹 가입이 되어있지 않으면 그룹가입으로 아니면 입장 */
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
	

	
	/* 게시판 글작성폼으로 */
	@RequestMapping("/group/groupBoardWrite.do")
	public String groupBoardWrite(HttpSession session, String groupSeq, Model model) {
		model.addAttribute("groupSeq",groupSeq);
		
		return"group/groupboard/groupBoardWrite";
		
	}
	
	
	  

	  
	/* 게시판 만들기 */
	@RequestMapping("/group/groupBoardInsert.do")
	public String groupBoardInsert(Group groupmaster,Board board ,String groupSeq, Model model, MultipartFile[] file, HttpServletRequest rq) {
		User user=(User) rq.getSession().getAttribute("userSession");
		String userId= user.getUserId();
		
		groupmaster = serviceb.selectGroupMaster(groupSeq);
		String gm = groupmaster.getGroupMaster();
		 
		
		board.setGroupBoardUser(user);
		
		Map<String, Object> map = new HashMap<>();
		map.put("groupBoardPhoto1",null);
		map.put("groupBoardPhoto2",null);
		map.put("groupBoardPhoto3",null);
		
		System.out.println(groupSeq);
		log.warn("{}",user);
		log.warn("{}",board);
		log.warn("{}",file);
		log.warn("groupgroup{}",gm);
		log.warn("usersuser{}",userId);
		
		
		int result =0;
		 if(gm.equals(userId)) {
			 result = serviceb.groupboardinsertmaster(board);
		 }
		 else {
			 result = serviceb.groupboardinsert(board);
		 }
		 
			
		int i = 1;
		
		if(file != null) {
			for(MultipartFile f : file) {
				System.out.println("파일이름 : "+f.getOriginalFilename());
				
				if(f.getSize()==0) break;
				
				map.put("groupBoardPhoto"+i,renamepolicy(rq, f, "board"));
				
				i++;
			}
		}
		
		log.error("{}",board.getGroupBoardSeq());
		
		
		
		 if(result>0) { 
			 map.put("groupBoardSeq", board.getGroupBoardSeq());
			 int resultfile = serviceb.groupboardfileinsert(map);
		 }
		
		return "redirect:/group/groupBoard.do?groupSeq="+groupSeq;
	}
	
	
	
	
	
	/* 그룹 의 메인으로 */
	@RequestMapping("/group/groupSigned.do")
	public String groupSigned(HttpSession session,Group group,Model model) {
		log.warn("signed{}",group);
		String groupSeq = group.getGroupSeq();
		Group list=service.selectGroupUseridCheck(groupSeq);
		System.out.println(list);
		model.addAttribute("group",list);
		return "group/groupboard/groupBoardMain";
	}
	
	/* 그룹 의 게시판탭으로 */
	@RequestMapping("/group/groupBoard.do")
	public String groupBoard(HttpSession session,Group group,String groupSeq,Model model) {
		log.warn("Board{}",group);
		Group list=service.selectGroupUseridCheck(groupSeq);
		log.warn("qeweq{}",list);
		model.addAttribute("group",list);
		
		
		
		  List<Board> boardlist=serviceb.selectBoardList(groupSeq);
			/* List<Board> notice = new ArrayList(); */
		  List<Board> notice = serviceb.selectBoardListNotice(groupSeq);
		  List<Board> best = serviceb.selectBoardListBest(groupSeq);
		  
		  log.error("bestbestbest{}",best);
		  
		  log.warn("mastmastmastbefore{}",boardlist);
		  log.error("groupgruop{}",group);
			/*
			 * for(Board b : boardlist) {
			 * log.error("testtsttasdasdasdasdasd{}",b.getGroupBoardUser().getUserId().
			 * equals(list.getGroupMaster()));
			 * if(b.getGroupBoardUser().getUserId().equals(list.getGroupMaster())) {
			 * notice.add(b);
			 * 
			 * } }
			 * 
			 * for(Board b: notice) { boardlist.remove(b); }
			 */
		  log.warn("mastmastmast{}",notice);
		  log.warn("mastmastmast{}",boardlist);
		  
		  model.addAttribute("boardlist",boardlist);
		  model.addAttribute("notice",notice);
		  
		  model.addAttribute("best",best);
		
		return "group/groupboard/groupBoardSub";
	}
	
	/* 스케쥴러로 */
	@RequestMapping("/group/groupScheduler.do")
	public String groupScheduler(String groupSeq,Model model) {
		Group list=service.selectGroupUseridCheck(groupSeq);
		System.out.println(list);
		model.addAttribute("group",list);
		return "group/groupboard/groupBoardSchedule";
	}
	
	
	/* 파일업로드 되니? */
	@RequestMapping(value = "/group/filesupload", method = RequestMethod.POST)
	@ResponseBody
	public String fileUpload(HttpServletRequest rq, MultipartHttpServletRequest files) {
		log.warn("asdfasdf{}",files);
		return null;
	}
	
	
	/* 게시판 글 내부 내용 표시 */
	@RequestMapping("/group/groupBoardContents.do")
	public String groupBoardContents(String groupBoardSeq,Model model) {
		Board board = serviceb.selectGroupBoard(groupBoardSeq);
		List<Comment> commentlist = serviceb.selectGroupBoardComment(groupBoardSeq);
				
		
		model.addAttribute("board",board);

		
		model.addAttribute("comment",commentlist);
		
		
		return "group/groupboard/groupBoardContents";
	}
	
	/* 베스트게시글 뽑아오기 */
	@RequestMapping("/group/groupBoardContentsNotice.do")
	public String groupBoardContentsNotice(String groupBoardSeq,Model model) {
		log.warn("qqqq{}",groupBoardSeq);
		Board board = serviceb.selectGroupBoard(groupBoardSeq);
		List<Comment> commentlist = serviceb.selectGroupBoardComment(groupBoardSeq);
		log.warn("qwrqwer{}",board);
		log.warn("qwrqwer2{}",commentlist);		
		log.warn("TTTTTTTTTTTTTTTTTTTTTTTTest {}", (Board)t.selectOne("group.selectGroupBoard",groupBoardSeq));
		model.addAttribute("board",board);

		
		model.addAttribute("comment",commentlist);
		
		
		return "group/groupboard/groupBoardContentNotice";
	}

	
	
	/* 좋아요버튼 누르기 */
	@RequestMapping("/group/addBoardLike")
	@ResponseBody
	public String addBoardLike(String groupSeq,String groupBoardSeq, HttpServletRequest rq) {
		Map<String, String> param = new HashMap<>();
		
		User user=(User) rq.getSession().getAttribute("userSession");
		String userId= user.getUserId();
			
		
		param.put("groupBoardSeq", groupBoardSeq);
		param.put("userId", userId);
		param.put("groupSeq",groupSeq);
		
		log.warn("add{}",param);
		int result = serviceb.addBoardLike(param);
		log.warn("asdasdasdasdasdsad",result);
		return "success";
	}
	
	/* 좋아요버튼 해제 */
	@RequestMapping("/group/delBoardLike")
	@ResponseBody
	public String delBoardLike(String groupSeq, String groupBoardSeq, HttpServletRequest rq) {
		
		Map<String, String> param = new HashMap<>();
		
		User user=(User) rq.getSession().getAttribute("userSession");
		String userId= user.getUserId();
		
		
		param.put("groupBoardSeq", groupBoardSeq);
		param.put("userId", userId);
		param.put("groupSeq",groupSeq);
		
		
		log.warn("del{}",param);
		int result = serviceb.delBoardLike(param);
		
		
		return "success";
	}
	
	
	/* 로그인시 좋아요가 되어있니? */
	@RequestMapping("/group/checkLikeBoard")
	@ResponseBody
	public String checkLikeBoard(String groupSeq, String groupBoardSeq, String userId, Model model) {
		
		Map<String, String> param=new HashMap<>();
		param.put("groupSeq", groupSeq);
		param.put("groupBoardSeq", groupBoardSeq);
		param.put("userId", userId);
		
		LikeBoard like = serviceb.checkBoardLike(param);
		log.warn("likebdbbdbdb{}",like);
		String glike = "";
		if(like != null) {
			
			glike="okay";
		} else {
			glike="no";
		}
		
		return glike;
		
	}
	
	@RequestMapping("/group/checkCommentReport")
	@ResponseBody
	public int checkReport(String groupCommentSeq, String userId) {
		Map<String, String > param = new HashMap<>();
		param.put("groupCommentSeq", groupCommentSeq);
		param.put("userId", userId);
		log.warn("checkcheck{}",param);
		int report=serviceb.checkCommentReport(param);
		 
		 if(report> 0) {
			 return 0;
		 }
		 else {
			 return serviceb.CommentReport(param);
		 }
	}
	
	/* 게시판 검색 */
	@RequestMapping("/group/gorupBoardSearch")
	public String groupBoardSearch(String inputSearch,String groupSeq,Model model) {
		Map param = new HashMap();
		param.put("inputSearch", inputSearch);
		param.put("groupSeq", groupSeq);
		
		List<Board> boardlist=serviceb.selectBoardSearchList(param);
		log.warn("swswsswswsw{}",groupSeq);
		log.warn("swswsswswsw2{}",inputSearch);
		
		model.addAttribute("boardlist",boardlist);
		return "components/group/group";
	}
	
	
	/* 일반게시글 뽑아오기 */
	@RequestMapping("/board/boardlist")
	public String groupList(@RequestParam(value="groupSeq")String groupSeq, Model model) {
		System.out.println("그룹번호 : "+groupSeq);
		List<Board> boardlist=serviceb.selectBoardList(groupSeq);
		System.out.println(boardlist);
		model.addAttribute("boardlist",boardlist);
		
		return "components/group/group";
	}
	
	@RequestMapping("/group/groupCountToday")
	@ResponseBody
	public Map groupCountToday(String groupSeq) {
		log.warn("countcount{}",groupSeq);
		int result = serviceb.groupCountToday(groupSeq);
 		log.error("resultresultresult{}",result);
		Map param = new HashMap();
		param.put("groupSeq", groupSeq);
		return param;
	}
	
	@RequestMapping("/group/groupCountTotal")
	@ResponseBody
	public Map groupCountTotal(String groupSeq) {
		int result = serviceb.groupCountTotal(groupSeq);
		Map param=new HashMap();
		param.put("groupSeq", groupSeq);
		return param;
	}
	
	@RequestMapping("/board/boardcommentlist")
	public String commentList(String groupBoardSeq,Model model) {
		log.warn("commentboardseq{}",groupBoardSeq);
		List<Comment> commentlist = serviceb.selectBoardCommentList(groupBoardSeq);
		model.addAttribute("commentlist",commentlist);
		log.warn("commentlistlog{}",commentlist);
		return "components/group/boardcomment";
	}
	
	
	@RequestMapping("/group/addcomment")
	@ResponseBody 
	public int addComment(String groupBoardSeq, String userId, String groupCommentContents) {
		Map param = new HashMap();
		param.put("groupBoardSeq",groupBoardSeq);
		param.put("userId",userId);
		param.put("groupCommentContents",groupCommentContents);
		
		return serviceb.addComment(param);
	}
	
	@RequestMapping("/group/delcomment")
	@ResponseBody
	public int delComment(String groupCommentSeq) {
		log.warn("dasdas{}",groupCommentSeq);
		return serviceb.delComment(groupCommentSeq);
	}
	
	
	
}
