package kr.ac.doungyang.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.doungyang.Community.model.coments.commentDao;

public class commentUpdate implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		ActionForward forward = new ActionForward();
		
		int commentid = Integer.parseInt(request.getParameter("commentid"));
		int number = Integer.parseInt(request.getParameter("number"));
		String content = request.getParameter("content");
		
		commentDao cDao = new commentDao();
		
		int result = cDao.update(content, commentid);
		
		if(result != 0) {
			forward.setRedirect(true);
			forward.setNextPage("bbsRead.do?number="+number);
		}else {
			request.setAttribute("recommUpdateResult", 0);
			forward.setRedirect(false);
			forward.setNextPage("Result.do");
		}
		return forward;
	}
}
