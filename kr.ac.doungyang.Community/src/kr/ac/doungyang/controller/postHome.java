package kr.ac.doungyang.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.doungyang.Community.model.post.postDao;
import kr.ac.doungyang.Community.model.post.postDto;
import kr.ac.doungyang.Community.model.user.userDao;

public class postHome implements Action{
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");

		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("userId");
		userDao uDao = new userDao();
		postDao pDao = new postDao();

		int relimit = 10, selimit = 10;
		if(request.getParameter("recivelimit") != null)
			relimit = 500000;
		if(request.getParameter("sendlimit") != null)
			selimit = 500000;
		
		ArrayList<postDto> recive = pDao.recivePost(id, relimit);
		ArrayList<postDto> send = pDao.sendPost(id, selimit);
		ArrayList<String> profile = new ArrayList<String>();
		for(int i=0; i<recive.size(); i++) {
			profile.add(uDao.getUserProfile(recive.get(i).getFromid()));
		}
		
		request.setAttribute("recive", recive);
		request.setAttribute("send", send);
		request.setAttribute("profile", profile);
		forward.setRedirect(false);
		forward.setNextPage("postAction.do");
		
		return forward;
	}
}
