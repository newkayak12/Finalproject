package com.e_um.common.MailSender;

import java.util.Date;
import java.util.Properties;

import javax.activation.CommandMap;
import javax.activation.MailcapCommandMap;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Message.RecipientType;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.springframework.stereotype.Component;

@Component
public class GoogleSender {
	public void sendMail( String content, String target) {
		final String bodyEncoding ="UTF-8";
		
		String subject = "E_um에서 발송한 인증코드입니다.";
		String fromEmail = "no_reply@gmail.com";
		String fromUsername = "no_reply@gmail.com";
		String toEmail = target;
		
		final String username = "idfordev12";
		final String password = "qwer1234%";
		
		StringBuffer sb=new StringBuffer();
		sb.append("<div>");
		sb.append("<h1>인증 코드</h1>");
		sb.append("<p>해당 메일은 발송 전용입니다. 회신을 받지 않습니다.</p>");
		sb.append("<h3>"+content+"</h3>");
		sb.append("</div>");
		
		String html = sb.toString();
		
		Properties prop = new Properties();
		prop.put("mail.transport.protocol", "smtp");
		prop.put("mail.smtp.host", "smpt.gmail.com");
		prop.put("mail.smtp.port", "465");
		prop.put("mail.smtp.auth", "true");
		
		prop.put("mail.smtp.quiwait", "false");
		prop.put("mail.smtp.socketFactory.port", "465");
		prop.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	    prop.put("mail.smtp.socketFactory.fallback", "false");
	    
	    try {
	        // 메일 서버  인증 계정 설정
	        Authenticator auth = new Authenticator() {
	          protected PasswordAuthentication getPasswordAuthentication() {
	            return new PasswordAuthentication(username, password);
	          }
	        };
	        
	        // 메일 세션 생성
	        Session session = Session.getInstance(prop, auth);
	        
	        // 메일 송/수신 옵션 설정
	        Message message = new MimeMessage(session);
	        message.setFrom(new InternetAddress(fromEmail, fromUsername));
	        message.setRecipients(RecipientType.TO, InternetAddress.parse(toEmail, false));
	        message.setSubject(subject);
	        message.setSentDate(new Date());
	        
	        // 메일 콘텐츠 설정
	        Multipart mParts = new MimeMultipart();
	        MimeBodyPart mTextPart = new MimeBodyPart();
	        MimeBodyPart mFilePart = null;
	   
	        // 메일 콘텐츠 - 내용
	        mTextPart.setText(html, bodyEncoding, "html");
	        mParts.addBodyPart(mTextPart);
	              
	        // 메일 콘텐츠 설정
	        message.setContent(mParts);
	        
	        // MIME 타입 설정
	        MailcapCommandMap MailcapCmdMap = (MailcapCommandMap) CommandMap.getDefaultCommandMap();
	        MailcapCmdMap.addMailcap("text/html;; x-java-content-handler=com.sun.mail.handlers.text_html");
	        MailcapCmdMap.addMailcap("text/xml;; x-java-content-handler=com.sun.mail.handlers.text_xml");
	        MailcapCmdMap.addMailcap("text/plain;; x-java-content-handler=com.sun.mail.handlers.text_plain");
	        MailcapCmdMap.addMailcap("multipart/*;; x-java-content-handler=com.sun.mail.handlers.multipart_mixed");
	        MailcapCmdMap.addMailcap("message/rfc822;; x-java-content-handler=com.sun.mail.handlers.message_rfc822");
	        CommandMap.setDefaultCommandMap(MailcapCmdMap);
	   
	        // 메일 발송
	        Transport.send( message );
	        
	      } catch ( Exception e ) {
	        e.printStackTrace();
	      }
	    }
	  

		
	}

