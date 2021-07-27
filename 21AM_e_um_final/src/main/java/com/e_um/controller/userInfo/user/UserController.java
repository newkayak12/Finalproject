package com.e_um.controller.userInfo.user;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.e_um.common.verifyCodeMaker.VerifyCodeMaker;
import com.e_um.model.sevice.userInfo.user.UserServiceInterface;
import com.e_um.model.vo.userInfo.interest.Interest;
import com.e_um.model.vo.userInfo.user.User;

import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
public class UserController {
	
	@Autowired
	JavaMailSender sender;

	@Autowired
	UserServiceInterface service;
	BCryptPasswordEncoder encrypt = new BCryptPasswordEncoder();
	
	@Autowired
	VerifyCodeMaker maker;
	@RequestMapping("/")
	public String gotoIndex() {
		
		return "../../index";
	}
	
	
	@RequestMapping(value="/user/login/start")
	public String loginPagin( Model model, @CookieValue(value = "persistlogin", defaultValue = "none", required = false)String cookie){
		
		if(!cookie.equals("none")) {
			model.addAttribute("persistLogin",cookie);
		}
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
//	여기까지는 창 띄우기
	
	@RequestMapping("/user/findmy/middle")
	public String findMiddle(String flag, @RequestParam(value = "userName" , required = false)String userName, @RequestParam(value = "userEmail") String userEmail, @RequestParam(value = "userId", required = false)String userId, Model model) {
		User user = User.builder().userName(userName).userId(userId).userEmail(userEmail).build();
		String code = maker.codeGenerator();
		User userfin = service.verify(user);
		/*
		 * 메일보내기
		 */
		
		
		
		
		
		
		if(userfin != null) {
			model.addAttribute("userId",userfin.getUserId());
			model.addAttribute("code",code);
			model.addAttribute("flag", flag);
			SimpleMailMessage mail = new SimpleMailMessage();
			mail.setTo(user.getUserEmail());
			mail.setSubject("E_um에서 온 인증 메일입니다.");
			mail.setText("인증 코드는 "+code+"입니다.");
			sender.send(mail);
			return "components/user/verifycode";
		} else {
			model.addAttribute("alter", "yes");
			return "components/user/lostandfound";
		}
	}
//	여기까지는 비밀번호 아이디 찾기 중간단계
	
	@RequestMapping("/user/idfound")
	public String idfound(@RequestParam(value = "userId") String userId, Model model) {
		model.addAttribute("userId",userId);
		return "components/user/idfound";
	}
	@RequestMapping("/user/pwfound")
	public String pwfound(User user,Model model) {
		model.addAttribute("userId",user.getUserId());
		return "components/user/pwfound";
	}
//	아이디 비밀번호 찾기 끝단계
	@ResponseBody
	@RequestMapping("/user/changepw")
	public int chagnepw(User user, Model model) {
		log.warn("{}", user);
		user.setUserPassword(encrypt.encode(user.getUserPassword()));
		return service.changepw(user);
	}
// 비밀번호 변경
	@RequestMapping("/user/signup/start/zero")
	public String signupzero() {
		return "components/user/signupzero";
	}
//	약관
	@RequestMapping("/user/signup/start/first")
	public String signupfirst() {
		return "components/user/signupfirst";
	}
// 입력
	@RequestMapping("/user/signup/start/second")
	public String signupsecond(User user, Model model) {
		model.addAttribute("user",user);
		return "components/user/signupsecond";
	}
//	관심사 닉네
	@RequestMapping("/user/signup/start/third")
	@ResponseBody
	public int signupthird(User user, Interest interest, @RequestParam(value = "profilePhoto", required = false) MultipartFile profilePhoto, HttpServletRequest rq) {
		
		log.error("{}signup",user);
		log.error("{}",profilePhoto.getOriginalFilename());
		user.setInterest(interest);
		String fileName ="default.png";
		if(profilePhoto.getOriginalFilename().length()>3) {
			fileName=profilePhoto.getOriginalFilename();
		}
		user.setProfileImageFile(fileName);
		user.setUserPassword(encrypt.encode(user.getUserPassword()));
		SimpleDateFormat fDate = new SimpleDateFormat("yyMMdd");
		log.warn("{}",user);
		
		return service.InsertUser(user);
	}
// 회원가입 마무리
// 회원가입 단계
	
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
// 회원가입시 체킹단계
	
	@RequestMapping("/user/loginverify")
	@ResponseBody
	public int login(Model model, User user, Boolean persistlogin, HttpServletResponse rs, HttpServletRequest rq) {
		log.warn("{}useruser",user);
		User userResult = service.login(user);
		log.warn("{}checker: ",persistlogin);
			
			if(persistlogin==true) {
				Cookie persist = new Cookie("persistlogin", user.getUserId());
				persist.setMaxAge(60*60*24*7);
				persist.setPath("/");
				rs.addCookie(persist);
			} else {
				Cookie persist = new Cookie("persistlogin", "checked");
				persist.setMaxAge(0);
				persist.setPath("/");
				rs.addCookie(persist);
			}
		
		int flag = 0;
		
			if(encrypt.matches(user.getUserPassword(), userResult.getUserPassword())) {
				model.addAttribute("user", userResult);
				HttpSession session = rq.getSession();
				session.setAttribute("userSession", userResult);
				session.setMaxInactiveInterval(60*60*30);
				flag =1;
			}
			
			
		return flag;
	}
// 로그인 단계	
	
	@RequestMapping("/user/gotomain")
	public String gotomain(HttpServletRequest rq, Model model) {
		Object obj =  rq.getSession().getAttribute("userSession");
		
		
		
		if(obj!=null) {
			User session = (User)obj;
			List<User> lists = service.recommandFriend(session.getUserId());
			for(User user : lists) {
				log.warn("{}",user);
			}
			
			model.addAttribute("list", lists);
			return "main";
		} else {
			String path = rq.getContextPath();
			return "redirect : /";
		}
		
	}
//메인으로 포워딩
	
	
	@RequestMapping("/user/kakaologin")
	@ResponseBody
	public int kakaoLogin(String userId, HttpServletRequest rq) {
		User user = User.builder().userId(userId).build();
		user = service.login(user);
		if(user!=null) {
			rq.getSession().setAttribute("userSession", user);
			return 1;
		} else {
			return 0;
		}
	}
	
	@RequestMapping("/user/kakaoInsert")
	@ResponseBody
	public int kakaoInsert(User user) {
		user.setProfileImageFile("default.png");
		user.setUserAddrBasic("서울 특별시 구로구 구로동 1132-32");
		user.setUserAddrDetails("/");
		user.setUserAddrZip("000000");
		user.setUserPhone("01000000000");
		user.setUserPassword(encrypt.encode("kakao"));
		log.warn("{}",user);
		
		return service.InsertKako(user);
	}
	
	@RequestMapping("/user/logout")
	public String logout(HttpServletRequest rq) {
		rq.getSession().invalidate();
		return "../../index";
	}
	
	
}
