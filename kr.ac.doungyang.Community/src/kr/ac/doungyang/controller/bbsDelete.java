package kr.ac.doungyang.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.doungyang.Community.model.bbs.bbsDao;
import kr.ac.doungyang.Community.model.coments.commentDao;

public class bbsDelete implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		ActionForward forward = new ActionForward();
		
		bbsDao bDao = new bbsDao();
		commentDao cDao = new commentDao();
		
		int number = Integer.parseInt(request.getParameter("number"));
		String major = request.getParameter("major");
		
		int result = bDao.delete(number);
		
		if(result != -1) {
			cDao.bbsDelete(number);
			forward.setRedirect(false);
			forward.setNextPage("bbsAction.do?major="+major);
		}else {
			System.out.println("error");
			request.setAttribute("deleteFail", 1);
			forward.setRedirect(false);
			forward.setNextPage("Result.do");
		}
		return forward;
	}
}
