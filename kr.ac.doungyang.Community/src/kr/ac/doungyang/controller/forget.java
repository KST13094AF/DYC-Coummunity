package kr.ac.doungyang.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.doungyang.Community.model.user.userDao;

public class forget implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		
		String userId = request.getParameter("id");
		String email = request.getParameter("email");
		
		userDao uDao = new userDao();
		
		int result = uDao.getForgetInfo(userId, email);
		
		if(result == 1) {
			session.setAttribute("userId_none", userId);
			forward.setRedirect(true);
			forward.setNextPage("forgetForm.do");
		}else{
			request.setAttribute("forgetResult", 0);
			forward.setRedirect(false);
			forward.setNextPage("ResultNoneLogin.do");
		}
		
		return forward;
	}
}
