package com.spring.controller;

import org.springframework.ui.Model;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.inject.Inject;

import com.spring.domain.Search;
import com.spring.repository.UserDao;
import com.spring.service.RawService;

@Controller
@RequestMapping("/admin")
public class AdminController
{
	@Inject
	private UserDao uDao;
	@Inject
	private RawService rawService;
	
	// home
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(Model model) {
		int total = rawService.total();
		model.addAttribute("total", total);
		return "admin/home";
	}

	// 회원 목록 조회 요청
	@RequestMapping(value = "/Membership", method = RequestMethod.GET)
	public String list(@RequestParam(required=false) Search	search, Model model) {
		if(search == null) search = new Search();
		model.addAttribute("users", uDao.list(search));
		return "admin/Membership";
	}
	
	// 회원 정보 수정
}