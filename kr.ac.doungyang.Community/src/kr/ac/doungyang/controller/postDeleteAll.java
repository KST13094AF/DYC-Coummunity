package kr.ac.doungyang.controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.doungyang.Community.model.post.postDao;

public class postDeleteAll implements Action{
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");

		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();

		String type = request.getParameter("type");
		String id = (String)session.getAttribute("userId");
		String user = request.getParameter("user");
		postDao pDao = new postDao();
		
		int result = 0;
		
		if(type.equals("1"))
			result = pDao.deletePost(id, user);
		else if(type.equals("2"))
			result = pDao.deletePost(user, id);
		
		if(result != 0) {
			forward.setRedirect(true);
			forward.setNextPage("postHome.do");
		}else {
			request.setAttribute("postDelRe", -1);
			forward.setRedirect(false);
			forward.setNextPage("Result.do");
		}
		
		return forward;
	}
}
