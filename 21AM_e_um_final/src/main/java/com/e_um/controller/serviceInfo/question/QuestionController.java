package com.e_um.controller.serviceInfo.question;

import static com.e_um.common.renamePolicy.RenamePolicy.renamepolicy;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.e_um.common.pagebar.PageBar;
import com.e_um.model.sevice.serviceInfo.question.QuestServiceInterface;
import com.e_um.model.vo.serviceinfo.question.NoHasAQuestion;
import com.e_um.model.vo.userInfo.user.User;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class QuestionController {
	
	@Autowired
	QuestServiceInterface service;
	
	
	@RequestMapping("/qna/write/start")
	public String openQuestionForm(String flag, Model m) {
		m.addAttribute("prevPage", flag);
		return "qna/writeQ";
	}
	
	
	@RequestMapping("/qna/openList")
	public String openQuesList(HttpServletRequest rq, Model m,
			@RequestParam(value="cPage", defaultValue="1") int cPage,
			@RequestParam(value="numPerPage", defaultValue="10") int numPerPage) {
		
		User user=(User)rq.getSession().getAttribute("userSession");
		m.addAttribute("quesList",service.selectQuestionList(user.getUserId(), cPage, numPerPage));
		//log.warn("quesList: {}",service.selectQuestionList(user.getUserId(), cPage, numPerPage));
		int totalData=service.selectQuestionListCount(user.getUserId());
		m.addAttribute("pageBar",PageBar.getPageBarDef(totalData, cPage, numPerPage,rq.getContextPath() + "/qna/openListPaging", "fn_paging"));
		
		return "qna/quesList";
	}
	
	
	@RequestMapping("/qna/openListPaging")
	public String openQuesListPaging(HttpServletRequest rq, Model m,
			@RequestParam(value="cPage", defaultValue="1") int cPage,
			@RequestParam(value="numPerPage", defaultValue="10") int numPerPage) {
		
		User user=(User)rq.getSession().getAttribute("userSession");
		m.addAttribute("quesList",service.selectQuestionList(user.getUserId(), cPage, numPerPage));
		int totalData=service.selectQuestionListCount(user.getUserId());
		m.addAttribute("pageBar",PageBar.getPageBarDef(totalData, cPage, numPerPage,rq.getContextPath() + "/qna/openListPaging", "fn_paging"));
		
		return "components/qna/qnaListTable";
	}
	
	
	@RequestMapping("/qna/write/end")
	public String inserQuestion(HttpServletRequest rq, String category, String title, String content, Model m,
			@RequestParam(value="file", required=false) MultipartFile file) {
		
		User user=(User)rq.getSession().getAttribute("userSession");
		//log.warn("file: {}",file);
		String newName=null;
		
		if(file!=null) {
			newName=renamepolicy(rq, file, "question");			
		}
		NoHasAQuestion nhq=NoHasAQuestion.builder().userId(user.getUserId()).questionCategory(category).questionTitle(title).questionContents(content).questionImageFile(newName).build();
		
		m.addAttribute("loc","/qna/openList");
		if(service.insertQuestion(nhq)>0) {
			m.addAttribute("msg","문의사항이 등록되었습니다.");
		}else {
			m.addAttribute("msg","문의사항이 등록되지 않았습니다.");
		}
		
		return "common/msg";
	}
	
	
	@RequestMapping("/qna/view")
	public String openQnaView(String queSeq, Model m) {
		m.addAttribute("qna",service.selectQNA(queSeq));
		//log.warn("service.selectQNA(queSeq): {}",service.selectQNA(queSeq));
		return "qna/qnaView"; 
	}
	
}
