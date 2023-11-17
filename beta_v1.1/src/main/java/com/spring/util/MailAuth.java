package com.spring.util;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import java.util.Random;

import org.springframework.stereotype.Service;
import org.springframework.web.util.WebUtils;

@Service
public class MailAuth
{
	// 랜덤한 숫자를 얻는다.
	public static int GetRandom()
	{
		//랜덤숫자를 만든다
		int bound = 1000000;
		Random random = new Random();
		bound = random.nextInt(bound);
		return bound;
	}

	// 인증 이메일을 발송한다
	public int sendAuthMail( String to, HttpServletResponse response )
	{
		System.out.println("sendAuthMail");
		int rand = MailAuth.GetRandom();

		Mailsender server = new Mailsender("google");
		String from = "admin@ezen.com";
/*		String ID = "kimcm9603";	// 계정
		String PW = "ntkt wxlr hfrz rfnk";	// 계정인증	*/

		String ID = "silverwoods.whitecrow@gmail.com";	// 계정
		String PW = "vxjg oyni mcyf ajyv";	// 계정인증

		// 제목 생성
		String title = "[Ateam]인증번호 발송메일 입니다";

		// 본문 생성
		String html_contents = "[Ateam]인증번호는 [ "+ rand +" ] 입니다.";

		if( server.MailSend(from, to, ID, PW, title, html_contents) == true )
		{
			System.out.println("성공적으로 이메일을 발송하였습니다.");

			Cookie verificationCodeCookie = new Cookie("verificationCode", String.valueOf(rand));
			verificationCodeCookie.setMaxAge(3*60);
			response.addCookie(verificationCodeCookie);
			return rand;
		}else
		{
			System.out.println("메일 발송 오류입니다.");
			return -1;
		}
	}

	// 쿠키에서 저장된 인증번호를 가져온다
	public static String getVerificationCodeFromCookie(javax.servlet.http.HttpServletRequest request) {
		Cookie cookie = WebUtils.getCookie(request, "verificationCode");
		if (cookie != null) {
			return cookie.getValue();
		}
		return null;
	}

	// 쿠키에서 저장된 인증번호를 삭제한다
	public static void removeVerificationCodeCookie(HttpServletResponse response) {
		Cookie cookie = new Cookie("verificationCode", null);
		cookie.setMaxAge(0);
		response.addCookie(cookie);
	}
}