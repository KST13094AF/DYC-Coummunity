package kr.ac.doungyang.controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.doungyang.Community.model.post.postDao;

public class postDelete implements Action{
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");

		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();

		String fromid = (String)session.getAttribute("userId");
		int number = Integer.parseInt(request.getParameter("number"));
		String user = request.getParameter("user");
		postDao pDao = new postDao();

		int result = pDao.deletePost(fromid, number);
		
		if(result != 0) {
			forward.setRedirect(true);
			forward.setNextPage("postUser.do?user="+user);
		}else {
			request.setAttribute("postDelRe", -1);
			forward.setRedirect(false);
			forward.setNextPage("Result.do");
		}
		
		return forward;
	}
}
