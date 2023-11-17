package com.spring.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandlerImpl;

public class UserDeniedHandler extends AccessDeniedHandlerImpl
{
	@Override
	public void handle(HttpServletRequest req, HttpServletResponse res, AccessDeniedException ade) throws IOException, ServletException
	{
		req.setAttribute("errMsg",ade.getMessage());
		req.getRequestDispatcher("/denied").forward(req, res);
	}
}