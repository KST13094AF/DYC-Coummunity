package kr.ac.doungyang.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.doungyang.Community.model.bbs.bbsDao;
import kr.ac.doungyang.Community.model.bbs.bbsDto;

public class write implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		
		bbsDao bDao = new bbsDao();
		bbsDto bDto = new bbsDto();
		
		String id = (String)session.getAttribute("userId");
		String classType = request.getParameter("class");
		String major = request.getParameter("major");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		bDto.setId(id);
		bDto.setClassType(classType);
		bDto.setMajor(major);
		bDto.setTitle(title);
		bDto.setContent(content);
		
		int result = bDao.write(bDto);
		
		if(result == 1) {
			request.setAttribute("writeResult", 1);
			forward.setRedirect(false);
			forward.setNextPage("Result.do?major="+major);
		}else if(result == 0) {
			request.setAttribute("writeResult", 0);
			forward.setRedirect(false);
			forward.setNextPage("Result.do?major="+major);
		}
		return forward;
		
	}
}
