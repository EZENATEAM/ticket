package com.spring.service;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public interface MailService {
	String mailAuth(String mail, HttpServletResponse response, HttpSession session);
	
	String mailAuth(String mail, String code, HttpSession session);
}