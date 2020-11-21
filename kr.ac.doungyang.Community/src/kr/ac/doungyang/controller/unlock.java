package kr.ac.doungyang.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.doungyang.Community.model.user.userDao;

public class unlock implements Action{
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");

		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();

		String id = (String)session.getAttribute("userId");
		String pw = request.getParameter("pw");

		userDao uDao = new userDao();

		int result = uDao.checkPw(id, pw);
		
		if(result == 1) {
			request.setAttribute("unlockSuccess", 1);
			forward.setRedirect(true);
			forward.setNextPage("infoAction.do");
		}else if(result == 0) {
			request.setAttribute("unlockFail", 0);
			forward.setRedirect(false);
			forward.setNextPage("unlock.do");
		}
		return forward;
	}
}
