package com.e_um.controller.userInfo.user;

import static com.e_um.common.renamePolicy.RenamePolicy.renamepolicy;

import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.e_um.common.verifyCodeMaker.VerifyCodeMaker;
import com.e_um.model.sevice.userInfo.user.UserServiceInterface;
import com.e_um.model.vo.userInfo.interest.Interest;
import com.e_um.model.vo.userInfo.user.User;

import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
@SessionAttributes({"user","code"})
public class UserController {
	

	@Autowired
	UserServiceInterface service;
	BCryptPasswordEncoder encrypt = new BCryptPasswordEncoder();
	
	@Autowired
	VerifyCodeMaker maker;

	@RequestMapping(value="/user/login/start")
	public String loginPagin(){
		return "components/user/login";
	}
	@RequestMapping("/user/lostandfound/start")
	public String lostandfound() {
		return "components/user/lostandfound";
	}
	@RequestMapping("/user/findmyid/start")
	public String findmyid(Model model) {
		model.addAttribute("flag","id");
		return"components/user/findmyid";
	}
	@RequestMapping("/user/findmypw/start")
	public String findmypw(Model model) {
		model.addAttribute("flag","pw");
		return"components/user/findmypw";
	}
	@RequestMapping("/user/findmy/middle")
	public String findMiddle(String flag, User user, Model model) {
		String code = maker.codeGenerator();
		
		
		User userfin = service.verify(user);
		log.warn("help!!{}", userfin);
		if(userfin != null) {
			model.addAttribute("user",userfin.getUserId());
			model.addAttribute("code",code);
			model.addAttribute("flag", flag);
			return "components/user/verifycode";
		} else {
			model.addAttribute("alter", "yes");
			return "components/user/lostandfound";
		}
	}
	@RequestMapping("/user/signup/start/zero")
	public String signupzero() {
		return "components/user/signupzero";
	}
	@RequestMapping("/user/signup/start/first")
	public String signupfirst() {
		return "components/user/signupfirst";
	}
	@RequestMapping("/user/signup/start/second")
	public String signupsecond(User user, Model model) {
		log.warn("{}", user);
		model.addAttribute("user",user);
		return "components/user/signupsecond";
	}
	@RequestMapping("/user/signup/start/third")
	@ResponseBody
	public int signupthird(User user, Interest interest, MultipartFile profilePhoto, HttpServletRequest rq) {
		
		
		
		user.setInterest(interest);
		user.setProfileImageFile(renamepolicy(rq, profilePhoto, "profile"));
		user.setUserPassword(encrypt.encode(user.getUserPassword()));
		SimpleDateFormat fDate = new SimpleDateFormat("yyMMdd");
		log.warn("{}",user);
		
		return service.InsertUser(user);
	}
	
	@RequestMapping("/user/nickCheker")
	@ResponseBody
	public int nickChecker(String userNick) {
		
		return service.nickChecker(userNick);
	}
	
	@RequestMapping("/user/idchecker")
	@ResponseBody
	public int idChecker(String userId) {
		
		log.warn(userId);
		
		return service.idChecker(userId);
	}
	@RequestMapping("/user/emailchecker")
	@ResponseBody
	public int emailChecker(String userEmail) {
		
		
		return service.emailChecker(userEmail);
	}
	@RequestMapping("/user/loginverify")
	@ResponseBody
	public int login(Model model, User user) {
		User userResult = service.login(user);
		log.warn("{}result: ",userResult);
		
		int flag = 0;
		
			if(encrypt.matches(user.getUserPassword(), userResult.getUserPassword())) {
				model.addAttribute("user", userResult);
				flag =1;
			}
			
			
		return flag;
	}
	@RequestMapping("/user/gotomain")
	public String gotomain(HttpServletRequest rq, Model model) {
		Object obj =  model.getAttribute("user");
		
		if(obj!=null) {
			return "main";
		} else {
			String path = rq.getContextPath();
			return "redirect : "+path+"/index.jsp";
		}
		
	}
	
	@RequestMapping("/user/idfound")
	public String idfound(User user, Model model) {
		model.addAttribute("userId",user.getUserId());
		return"";
	}
	@RequestMapping("/user/pwfound")
	public String pwfound(User user,Model model) {
		model.addAttribute("userId",user.getUserId());
		return"";
	}
}
