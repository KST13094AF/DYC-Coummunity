package kr.ac.doungyang.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.doungyang.Community.model.event.eventDao;
import kr.ac.doungyang.Community.model.post.postDao;
import kr.ac.doungyang.Community.model.post.postDto;
import kr.ac.doungyang.Community.model.user.userDao;

public class postUser implements Action{
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");

		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();

		String toid = (String)session.getAttribute("userId");
		String fromid = request.getParameter("user");
		postDao pDao = new postDao();
		eventDao eDao = new eventDao();
		userDao uDao = new userDao();
		
		pDao.readPost(toid, fromid);
		ArrayList<postDto> send = pDao.userPost(toid, fromid);
		String Profile = uDao.getProfile(fromid);
			
		eDao.emailEventRead(toid, fromid);
		request.setAttribute("send", send);
		request.setAttribute("Profile", Profile);
		forward.setRedirect(false);
		forward.setNextPage("post.do");
		
		return forward;
	}
}
