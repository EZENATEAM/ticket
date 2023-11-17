package com.spring.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.spring.service.MailService;
import com.spring.service.UserService;
import com.spring.domain.Message;
import com.spring.domain.UserVo;

@Controller
@RequestMapping("/")
public class MemberController
{
	@Inject
	private MailService mailService;
	@Inject
	private UserService userService;
	@Inject
	private PasswordEncoder pwEncoder;

	// 회원 가입
	@RequestMapping("/signup")
	public String signup(UserVo user, Model model) {
		model.addAttribute("user", user);
		return "sign/signup";
	}

	// 아이디 중복 체크
	@ResponseBody
	@RequestMapping(value = "/check_id", method = RequestMethod.GET)
	public String checkId(String id) {
		if(userService.findByID(id) == 1) return "DUPLE";
		else return "OK";
	}

	// 회원 가입처리
	@Transactional
	@RequestMapping(value="/signup", method= RequestMethod.POST)
	public String signup(@ModelAttribute UserVo user, HttpSession session, HttpServletRequest request, Message msg) {
		userService.signup(user);
		return "redirect:/signin";
	}

	// id 찾기
	@RequestMapping(value = "/find_id", method = RequestMethod.GET)
	public String findId() {
		return "sign/find_id";
	}
	@RequestMapping(value = "/find_id", method = RequestMethod.POST)
	public String findId(UserVo vo, String code, Model model, HttpSession session, HttpServletRequest request) {
		if( !mailService.mailAuth(vo.getEMAIL(),code,session ).equals("OK") ) return "redirect:" + request.getHeader("Referer");

		vo = userService.findByName(vo);
		if( vo == null || vo.getID() == null ) return "redirect:" + request.getHeader("Referer");
		
//		session.setAttribute("finded_id", vo.getID());
		model.addAttribute("finded_id", vo.getID());
		return "sign/find_id_result";
	}

	// pw 찾기
	@RequestMapping(value = "/find_pw", method = RequestMethod.GET)
	public String findPw() {
		return "sign/find_pw";
	}
	@RequestMapping(value = "/find_pw", method = RequestMethod.POST)
	public String findPw(UserVo vo, String code, Model model, HttpSession session, HttpServletRequest request) {
		if( !mailService.mailAuth(vo.getEMAIL(),code,session ).equals("OK") ) return "redirect:" + request.getHeader("Referer");
		
		// DB에서 이름과 이메일이 일치하는 계정이 있는지 확인합니다
		
		String result = "";
	//	DB에서 이메일 찾는 로직 작성
		
		// 있으면 모델에 계정을 저장하고 idfindResult페이지로 이동
		model.addAttribute("msg", result);
		// 없으면 모델에 계정이 없습니다 라는 메세지를 찍고 이동
		model.addAttribute("msg", "가입정보가 확인되지 않습니다.");
		
		return "sign/find_pw_result";
	}

	// 회원 정보
	@RequestMapping(value = "/user/info", method = RequestMethod.GET)
	public String mypage(String idx) {
		return "user/mypage";
	}
	
	// 가입 정보 조회 요청
	@RequestMapping(value = "/user/view", method = RequestMethod.GET)
	public String view(@RequestParam Long idx, Model model) {
		model.addAttribute("user", userService.findOne(idx));
		return "sign/view";
	}
	// 가입 정보 수정 요청
	@RequestMapping(value = "/user/edit", method = RequestMethod.GET)
	public String edit(Long idx, Model model) {
		model.addAttribute("user", userService.findOne(idx));
		return "sign/edit";
	}
	// 가입 정보 수정 요청
	@RequestMapping(value = "/user/edit", method = RequestMethod.POST)
	public String edit(UserVo vo, Model model) {
		
		return "sign/view";
	}
	
	// 로그인
	@RequestMapping("/signin")
	public String signin() {
		return "sign/signin";
	}
}