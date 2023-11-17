package com.spring.service;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.spring.util.MailAuth;

@Service
public class MailServiceImpl implements MailService {
	
	@Inject
	private MailAuth mailAuth;
	
	@Inject
	private PasswordEncoder pwEncoder;

	@Override
	public String mailAuth(String mail, HttpServletResponse response, HttpSession session) {
		System.out.println("메일 인증");
		int result = mailAuth.sendAuthMail(mail, response);
		System.out.println("인증번호 : "+ result);
		String encodedCode = pwEncoder.encode(""+result);
		session.setAttribute(mail, encodedCode);
		if( result < 0 ) return "ERROR";
		else return "OK";
	}

	@Override
	public String mailAuth(String mail, String code, HttpSession session) {
		System.out.println("mail : " + mail);
		System.out.println("code : " + code);
		if(pwEncoder.matches(code, (String) session.getAttribute(mail)))
		{
			System.out.println("OK");
//			session.setAttribute(mail, "");
			return "OK";
		}
		System.out.println("fail");
		return "ERROR";
	}
}