package kr.ac.doungyang.controller;

import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class sendMailAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		
		String userId = (String)session.getAttribute("userId");
		String select = request.getParameter("select");
		String title = request.getParameter("title");
		String msg = request.getParameter("message");
		
		int result = mailSend(userId, select, title, msg);
		
		if(result == 1) {
			request.setAttribute("sendEmailResult", 1);
			forward.setRedirect(false);
			forward.setNextPage("Result.do");
		}else {
			request.setAttribute("sendEmailResult", 0);
			forward.setRedirect(false);
			forward.setNextPage("Result.do");
		}
		return forward;
		
	}
	public int mailSend(String userId, String select, String title, String message) {
		Properties prop = System.getProperties();
		prop.put("mail.smtp.starttls.enable", "true");
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.port", "587");
		
		Authenticator auth = new mailAuth();
		
		Session session = Session.getDefaultInstance(prop, auth);
		
		MimeMessage msg = new MimeMessage(session);
		
		try {
			msg.setSentDate(new Date());
			msg.setFrom(new InternetAddress(userId, "[" + select + "]" +"동양 커뮤니티 제보"));
			InternetAddress to = new InternetAddress("newyour1964@gmail.com");
			msg.setRecipient(Message.RecipientType.TO, to);
			msg.setSubject(title, "UTF-8");
			msg.setText(message,"UTF-8");
			
			Transport.send(msg);
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
}
