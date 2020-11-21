package kr.ac.doungyang.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.doungyang.Community.model.bbs.bbsDao;
import kr.ac.doungyang.Community.model.coments.commentDao;

public class commentDelete implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		ActionForward forward = new ActionForward();
		
		int commentid = Integer.parseInt(request.getParameter("commentid"));
		int number = Integer.parseInt(request.getParameter("number"));
		
		commentDao cDao = new commentDao();
		bbsDao bDao = new bbsDao();
		
		int result = cDao.delete(commentid);
		
		if(result != 0) {
			bDao.disComment(number);
			forward.setRedirect(true);
			forward.setNextPage("bbsRead.do?number="+number);
		}else {
			request.setAttribute("recommDeleteResult", 0);
			forward.setRedirect(false);
			forward.setNextPage("Result.do");
		}
		return forward;
	}
}
