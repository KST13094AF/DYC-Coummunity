package kr.ac.doungyang.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.doungyang.Community.model.user.userDao;

public class profile implements Action{
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");

		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();

		String id = (String)session.getAttribute("userId");
		userDao uDao = new userDao();
		String file = (String)request.getAttribute("file");
		int result = 0;
		if(file != null) {
			result = uDao.setProfile(id, file);
		}
		if(result == 1) {
			session.removeAttribute("userProfile");
			session.setAttribute("userProfile", file);
			forward.setRedirect(true);
			forward.setNextPage("profileRe.do");
		}else if(result == 0) {
			request.setAttribute("fileUpload", 0);
			forward.setRedirect(false);
			forward.setNextPage("Result.do");
		}
		return forward;
	}
}
