package kr.ac.doungyang.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.doungyang.Community.model.user.userDao;

public class userPwUpdate implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		
		String userId = (String)session.getAttribute("userId");
		String pw = request.getParameter("pw");
		
		userDao uDao = new userDao();
		
		int result = uDao.setForgetInfo(userId, pw);
		
		if(result == 1) {
			request.setAttribute("updateResult", 1);
			forward.setRedirect(false);
			forward.setNextPage("Result.do");
		}else {
			request.setAttribute("updateResult", 0);
			forward.setRedirect(false);
			forward.setNextPage("Result.do");
		}
		
		return forward;
	}
}
