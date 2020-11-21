package kr.ac.doungyang.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.doungyang.Community.model.user.userDao;

public class forgetUpdate implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		
		String userId = (String)session.getAttribute("userId_none");
		String pw = request.getParameter("pw");
		
		userDao uDao = new userDao();
		
		int result = uDao.setForgetInfo(userId, pw);
		
		if(result == 1) {
			session.removeAttribute("userId_none");
			request.setAttribute("forgetUpdateResult", 1);
			forward.setRedirect(false);
			forward.setNextPage("ResultNoneLogin.do");
		}else {
			request.setAttribute("forgetUpdateResult", 0);
			forward.setRedirect(false);
			forward.setNextPage("ResultNoneLogin.do");
		}
		
		return forward;
	}
}
