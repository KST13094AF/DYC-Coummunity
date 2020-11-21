package kr.ac.doungyang.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.doungyang.Community.model.bbs.bbsDao;
import kr.ac.doungyang.Community.model.coments.commentDao;
import kr.ac.doungyang.Community.model.post.postDao;
import kr.ac.doungyang.Community.model.user.userDao;
import kr.ac.doungyang.controller.model.likey.likeyDao;

public class userDelete implements Action{
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");

		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		
		String id = (String)session.getAttribute("userId");
		
		userDao uDao = new userDao();
		bbsDao bDao = new bbsDao();
		likeyDao lDao = new likeyDao();
		commentDao cDao = new commentDao();
		postDao pDao = new postDao();
		int result = uDao.deleteUser(id);
		
		if(result == 1) {
			session.invalidate();
			bDao.userDelete(id);
			cDao.userDelete(id);
			lDao.delete(id);
			pDao.userDeletePost(id);
			forward.setRedirect(true);
			forward.setNextPage("deleteResult.do");
		}
		return forward;
	}
}
