package kr.ac.doungyang.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.doungyang.Community.model.bbs.bbsDao;
import kr.ac.doungyang.Community.model.coments.commentDao;
import kr.ac.doungyang.Community.model.user.userDao;
import kr.ac.doungyang.Community.model.user.userDto;

public class userInfo implements Action{
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");

		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();

		String id = (String)session.getAttribute("userId");
		
		commentDao cDao = new commentDao();
		userDao uDao = new userDao();
		userDto uDto = uDao.getUserInfo(id);
		
		bbsDao bDao = new bbsDao();
		int recode = bDao.getUserRecode(id);
		int comment = cDao.getUserComment(id);
		
		if(uDto != null) {
			request.setAttribute("userInfo", uDto);
			request.setAttribute("recode", recode);
			request.setAttribute("comment", comment);
			forward.setRedirect(false);
			forward.setNextPage("info.do");
		}else if(uDto == null) {
			request.setAttribute("userInfoFail", 0);
			forward.setRedirect(false);
			forward.setNextPage("Result.do");
		}
		return forward;
	}
}
