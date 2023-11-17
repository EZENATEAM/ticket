package com.spring.controller;

import com.spring.domain.Search;
import com.spring.domain.UserVo;
import com.spring.domain.rawVo;
import com.spring.repository.AuthorityDao;
import com.spring.repository.RawDao;
import com.spring.repository.UserDao;
import com.spring.service.UserService;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.WebAttributes;

import org.springframework.stereotype.Controller;

import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import javax.inject.Inject;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/")
public class SecurityController {
	
	@Inject
	private RawDao rDao;
	@Inject
	private UserDao uDao;
	@Inject
	private AuthorityDao aDao;
	@Inject
	private UserService userService;
	
	// 메인 요청 처리
	@RequestMapping
	public String home(Search search, Model model) {
		if( search == null )
		{
			search = new Search();
		}
		List<rawVo> list = rDao.list(search);
		model.addAttribute("list", list);
		return "index";
	}

	// 가입 정보 조회 요청
	@RequestMapping(value = "/auth/view", method = RequestMethod.GET)
	public String view(@RequestParam Long idx, Model model) {
		model.addAttribute("user", uDao.select(idx));
		model.addAttribute("authorities", aDao.select(idx));
		return "sign/view";
	}

	// 회원 목록 조회
	@RequestMapping(value = "/auth/list", method = RequestMethod.GET)
	public String list(Model model, 
						@RequestParam(required=false) String name, 
						@RequestParam(required=false) String email, 
						@RequestParam(required=false) String order) {
		Search	search = new Search();
		model.addAttribute("users", uDao.list(search));
		return "sign/list";
	}

	// 회원 정보 수정 요청
	/* @PreAuthorize("hasRole('ROLE_ADMIN')") */
	@RequestMapping(value = "/auth/edit", method = RequestMethod.GET)
	public String edit(@RequestParam Long idx, Model model) {
		model.addAttribute("user", uDao.findOne(idx));
		return "sign/edit";
	}

	// 회원 정보 수정 적용
	/* @PreAuthorize("hasRole('ROLE_ADMIN')") */
	@Transactional
	@RequestMapping(value="/auth/edit", method= RequestMethod.POST)
	public String edit(@ModelAttribute UserVo user, String npw)
	{
		if(user == null || user.getPassword() == null) return "redirect:/";
		
		// 기존 비번 확인 절차
		if( !userService.checkPW(user.getIdx(), user.getPASSWORD())) return "redirect:/edit?idx="+user.getIdx();
		// 관리자가 유저 정보 수정시에는 기존 비번 확인 절차를 무시할 필요 있음

		System.out.println(user.toString());

		if( npw == null || npw.equals("") ) uDao.update(user);		// 새 비번이 없으면 나머지 정보 업데이트
		else userService.UpdateWithNewPW(user, npw);				// 비번이 있으면, 비번도 업데이트
		
		// 변경된 유저 정보 조회
		return "redirect:/auth/view?idx=" + user.getIdx();
	}

//	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@Transactional
	@RequestMapping(value="/auth/delete", method= RequestMethod.GET)
	public String delete(@RequestParam(required=false) Long idx,Authentication authentication) {
		
		if( authentication == null ) return "redirect:/";
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null && auth.getAuthorities().stream().anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN"))) {
			System.out.println("관리자");
		}
		UserDetails userVO = (UserDetails) authentication.getPrincipal();
		for( GrantedAuthority item : userVO.getAuthorities() )
		{
			// 관리자 메인으로
			if( item.getAuthority().indexOf("ADMIN") > 0)
			{
				if(aDao.delete(idx) > 0)
				{
					System.out.println("권한 삭제");
				}
				if(uDao.delete(idx) > 0)
				{
					System.out.println("계정 삭제");
				}
			}
		}
//		uDao.delete(idx);
//		return "redirect:/auth/list";
		return "redirect:/admin/Membership";
	}

	// 스프링 시큐리티에서 로그인 인증 성공시
	@RequestMapping(value="/signinSuccess")
	public String signinSuccess(Authentication authentication)
	{
		String url = "redirect:/";
		UserDetails userVO = (UserDetails) authentication.getPrincipal();
		for( GrantedAuthority item : userVO.getAuthorities() )
		{
			if( item.getAuthority().indexOf("ADMIN") > 0) url = "redirect:/admin/home";
		}
		return url;
	}

	// 스프링 시큐리티에서 로그인 인증 실패시
	@RequestMapping(value="/signinFailed")
	public String signinFailed() {
		System.out.println("signin Failed");
		return "redirect:/";
	}

	// 권한 인증 실패시 UserDeniedHandler가 이 컨트롤러 메소드를 호출함 
	@RequestMapping(value="/denied")
	public String other( Model model, Authentication auth,HttpServletRequest req) {
		AccessDeniedException ade = (AccessDeniedException) req.getAttribute(WebAttributes.ACCESS_DENIED_403);
		model.addAttribute("auth", auth);
		model.addAttribute("errMsg", ade);
		return "denied";
	}
}