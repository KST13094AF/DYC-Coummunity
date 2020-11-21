package kr.ac.doungyang.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.doungyang.Community.model.bbs.bbsDao;
import kr.ac.doungyang.Community.model.bbs.bbsDto;

public class bbsUpdateGetData implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		ActionForward forward = new ActionForward();
		
		bbsDao bDao = new bbsDao();
		
		int number = Integer.parseInt(request.getParameter("number"));

		bbsDto bDto = bDao.read(number);
		
		if(bDto != null) {
			request.setAttribute("bbsUpdate", bDto);
			forward.setRedirect(false);
			forward.setNextPage("update.do");
		}else {
			request.setAttribute("updateResult2", 1);
			forward.setRedirect(false);
			forward.setNextPage("Result.do");
		}
		return forward;
		
	}
}
