package kr.ac.doungyang.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.doungyang.Community.model.user.userDao;

public class login implements Action{
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");

		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

		userDao uDao = new userDao();

		int result = uDao.login(id, pw);
		
		if(result == 1) {
			session.setAttribute("userId", id);
			session.setAttribute("userProfile", uDao.getProfile(id));
			forward.setRedirect(true);
			forward.setNextPage("home.do");
		}else if(result == 0) {
			request.setAttribute("loginFail", 0);
			forward.setRedirect(false);
			forward.setNextPage("login.do");
		}
		return forward;
	}
}
