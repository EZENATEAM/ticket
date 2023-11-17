package com.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.service.MailService;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/mail")
public class MailController {
	
	@Inject
	private MailService mailService;
	
	// 이메일 인증
	@ResponseBody
	@RequestMapping(value = "/mail_auth", method = RequestMethod.GET)
	public String mailAuth(String mail, HttpServletResponse response, HttpSession session) {
		return mailService.mailAuth(mail, response, session);
	}
	@ResponseBody
	@RequestMapping(value = "/mail_auth", method = RequestMethod.POST)
	public String mailAuth(String mail, String code, HttpSession session) {
		return mailService.mailAuth(mail, code, session);
	}
}