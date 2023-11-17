package com.spring.util;

import java.io.UnsupportedEncodingException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Mailsender {

	private String MailServer;
	private int    MailPort;

	public Mailsender()
	{	// naver
		this.MailServer = "smtp.naver.com";
		this.MailPort   = 465;
	}

	public Mailsender(String server)
	{
		// 서버 별 설정
		if( server.equals("google"))
		{
			this.MailServer = "smtp.gmail.com";
			this.MailPort = 465;
		}
		if( server.equals("naver"))
		{
			this.MailServer = "smtp.naver.com";
			this.MailPort = 465;
		}
	}

	public void setMailServer( String mailserver )
	{
		this.MailServer = mailserver;
	}

	public void setMailPort( int mailPort )
	{
		this.MailPort = mailPort;
	}

	public boolean MailSend(String from, String to, String id, String pw, String title, String body)
	{
		System.out.println("MailSend");
		Properties props = new Properties();
		props.put("mail.smtp.connectiontimeout", 10*1000);
		props.put("mail.smtp.host", MailServer );
		props.put("mail.smtp.port", MailPort );
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", MailServer);

		Session session = Session.getDefaultInstance(props, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication( id, pw );
			}
		});

		try {
			Message msg = new MimeMessage(session);
			msg.setFrom(new InternetAddress("admin@ezen.com", "ezen.com Admin"));
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to, "Mr. User"));
			msg.setSubject(title);
			msg.setText(body);
			Transport.send(msg);
		}catch(AddressException e) {
			e.printStackTrace();
			return false;
		}catch(MessagingException e) {
			e.printStackTrace();
			return false;
		}catch(UnsupportedEncodingException e) {
			e.printStackTrace();
			return false;
		}catch( Exception e ) {
			e.printStackTrace();
			return false;
		}
		return true;
/*		try
		{
			Properties clsProp = System.getProperties();
			clsProp.put("mail.smtp.connectiontimeout", 10*1000);
			clsProp.put("mail.smtp.host", MailServer );
			clsProp.put("mail.smtp.port", MailPort );
			clsProp.put("mail.smtp.auth", "true");
			clsProp.put("mail.smtp.ssl.enable", "true");
			clsProp.put("mail.smtp.ssl.trust", MailServer);
			Session clsSession = Session.getInstance( clsProp, new Authenticator(){
				public PasswordAuthentication getPasswordAuthentication() { return new PasswordAuthentication( id, pw ); }
			});

			Message clsMessage = new MimeMessage( clsSession );
			clsMessage.setFrom( new InternetAddress( from ) );
			clsMessage.addRecipient( Message.RecipientType.TO, new InternetAddress( to ) );
			clsMessage.setSubject( title );
			clsMessage.setContent(body , "text/plain;charset=UTF-8" );
			System.out.println("from : " + from);
			System.out.println("to : " + to);
			System.out.println("id : " + id);
			System.out.println("pw : " + pw);
			System.out.println("title : " + title);
			System.out.println("body : " + body);
			Transport.send( clsMessage );
		}
		catch( Exception e )
		{
			e.printStackTrace();
			return false;
		}
		return true; 	*/
	}
}